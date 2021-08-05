extends KinematicBody2D

export var speed = 200
export var friction = 0.01
export var acceleration = 0.01

onready var screen_size = get_viewport_rect().size

var laser_bolt = preload("res://Scenes/P_Laser.tscn")
var ability = preload("res://Scenes/p_Bullet.tscn")
var velocity = Vector2()
var shield = true
var moving = false

func _ready():
	add_to_group("player")
	yield(get_tree(),"idle_frame")
	get_tree().call_group("ene","set_player",self)

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('Right'):
		input.x += 1
		moving = true
	if Input.is_action_pressed('Left'):
		input.x -= 1
		moving = true
	if Input.is_action_pressed("Down"):
		input.y +=1
		moving = true
	if Input.is_action_pressed("Up"):
		input.y -=1
		moving = true
	if Input.is_action_just_pressed("Shoot"):
		shoot()
	if Input.is_action_just_pressed("Ability"):
		Ability()
		shield()
	if Input.is_action_just_pressed("Restart"):
		get_tree().reload_current_scene()
	return input

func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)
	look_at(get_global_mouse_position())
	get_input()

func shield():
	if shield == true:
		$ShieldTimer.start()
		shield = false

func moving():
	if moving == true:
		$Sprites/b2_05/ThrustPart1.emitting = true
		$Sprites/b2_06/ThrustPart2.emitting = true

func dead(): 
	get_tree().reload_current_scene()
	pass

func Ability():
	var abi = ability.instance()
	add_child(abi)
	abi.transform = $Shield.transform

func shoot():
	var las = laser_bolt.instance()
	owner.add_child(las)
	las.transform = $Gun.global_transform

func get_time():
	return OS.get_ticks_msec()/1000.0

func _on_Ouch_body_entered(body):
	if body.is_in_group("ene"):
		print('Hit!')
		dead() 
 
func _on_ShieldTimer_timeout():
	shield = true
