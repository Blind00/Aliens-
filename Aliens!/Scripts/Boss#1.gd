extends KinematicBody2D

var Speed = 125
var speed = 100

onready var player = get_parent().get_node("Player")

var bullet_scene = preload("res://Scenes/B_bullet.tscn")
var velocity = Vector2.ZERO
var direction = velocity
var can_shoot = true
var bomb_scene = preload("res://Scenes/B_Bomb.tscn")
var health = 5
var health2 = 20
var damage = 2
var phasetwo = false

func _ready():
	pass
	add_to_group("ene")

func _physics_process(_delta):
	var to_player = player.global_position - self.global_position
	var distance = to_player.length()
	var direction = to_player.normalized()
	if distance > 350:
		self.move_and_slide(direction * Speed)
	if distance < 200:
		self.move_and_slide(direction * -speed)
	
	if player == null:
		return 
	look_at(player.position)
#The Boss chases after the player always looking at the player's character

func shoot():
	if can_shoot == true:
		var las = bullet_scene.instance()
		las.global_transform = $Gun.global_transform
		get_parent().add_child(las)
		can_shoot = false
	
		var las2 = bullet_scene.instance()
		las2.global_transform = $Gun2.global_transform
		get_parent().add_child(las2)
		can_shoot = false
		$Shoot_Timer.start()
		
		if phasetwo == true:
			var las3 = bullet_scene.instance()
			las3.global_transform = $Gun3.global_transform
			get_parent().add_child(las3)
			can_shoot = false
	
			var las4 = bullet_scene.instance()
			las4.global_transform = $Gun4.global_transform
			get_parent().add_child(las4)
			can_shoot = false
			$Shoot_Timer.start()
		else:
			pass
#The boss shoots three bullets at the player

func bomb():
	var b = bomb_scene.instance()
	b.global_transform = $Gun.global_transform
	get_parent().add_child(b)
	
	var b1 = bomb_scene.instance()
	b1.global_transform= $Gun2.global_transform
	get_parent().add_child(b1)
	$Bomb_Timer.start()

	if phasetwo == true:
		var b3 = bomb_scene.instance()
		b3.global_transform = $Gun3.global_transform
		get_parent().add_child(b3)
	
		var b4 = bomb_scene.instance()
		b4.global_transform = $Gun4.global_transform
		get_parent().add_child(b4)
		$Bomb_Timer.start()
	else:
		pass

func checkdeath():
	if health < 1:
		Phase2()
	else:
		pass

func Phase2():
	phasetwo = true
	print("Phase Two")

func _on_Bomb_Timer_timeout():
	bomb()

func _on_Shoot_Timer_timeout():
	can_shoot = true
	shoot()

func _on_Area2D_body_entered(body):
	if "P_Laser" in body.name:
		health -=2
		print("Hit")
		body.queue_free()
		checkdeath()
