extends KinematicBody2D

export var speed = 200
export var friction = 0.01
export var acceleration = 0.01
export (float) var max_health = 15

var laser_bolt = preload("res://Scenes/P_Laser.tscn")
var ability = preload("res://Scenes/p_Bullet.tscn")
var velocity = Vector2()
var shield_able = true
var shield_up = false
var shield_charge = 10

func _ready():
	add_to_group("P")
	yield(get_tree(),"idle_frame")
	get_tree().call_group("ene","set_player",self)
#The way I got damage to work is to assign my character to a group
#When taking damage, the game looks for an association to a group
#If it corresponds with what the bullet is allowed to damage
#I've tried  other ways of doing it but it either didn't tell me how to do things clear enough or that it was beginner-unfriendly

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('Right'):
		input.x += 1
	if Input.is_action_pressed('Left'):
		input.x -= 1
	if Input.is_action_pressed("Down"):
		input.y +=1
	if Input.is_action_pressed("Up"):
		input.y -=1
	if Input.is_action_just_pressed("Shoot"):
		if shield_up == true:
			pass
		else:
			shoot()
	if Input.is_action_just_pressed("Shield"):
		if shield_charge != 0:
			Shield()
			can_shield()
		else:
			pass
			#Basically it says if Shield Charge is NOT empty then you can use the shield
		$Timers/ShieldLifeTime.start()
	if Input.is_action_just_pressed("Restart"):
		get_tree().reload_current_scene()
		#Pressing "R" will restart the scene
	return input

func _physics_process(_delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)
	look_at(get_global_mouse_position())
#A really simple way to get "space physics" that I copy pasted from KidsCanCode

func can_shield():
	if shield_able == true:
		$Timers/ShieldTimer.start()
		shield_able = false

func checkdeath():
	if max_health < 1:
		dead()
	else: 
		pass
#As the name suggests, it checks whether I'm supposed to be dead

func dead(): 
	get_tree().reload_current_scene()
	pass
#If I die the scene reloads

func Shield():
	shield_charge -= 1
	var abi = ability.instance()
	add_child(abi)
	abi.transform = $Shield.transform
	shield_up = true
	checkshield()
#Using the shield takes a charge and appears in front of the ship
#It will block bullets but it will not last for long
#If you failed to block the bullet or use the shield too late you will get hit 

func checkshield():
	if shield_charge < 1:
		RechargeShield()
		print("Shield Charge Depleted")
	if shield_charge != 0:
		pass
#When the shield charge depletes a timer starts

func RechargeShield():
	$Timers/RechargeShield.start()
#When the timer stops it recharges some charges

func shoot():
	var las = laser_bolt.instance()
	owner.add_child(las)
	las.transform = $Gun.global_transform
#This spawns bullets

func _on_Ouch_body_entered(body):
	if body.is_in_group("b"):
		max_health -= 1
		checkdeath()
	if body.is_in_group("ene"):
		max_health -= 2
		checkdeath()
	if "B" in body.name:
		max_health -= 3
		checkdeath()
		print("Got Hit!")
		print(max_health)
#A very basic way to compute health

func _on_ShieldTimer_timeout():
	shield_able = true

func _on_ShieldLifeTime_timeout():
	shield_up = false

func _on_CheckDeath_timeout():
	checkdeath()

func _on_RechargeShield_timeout():
	shield_charge = 10
