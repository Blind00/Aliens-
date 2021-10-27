extends KinematicBody2D

var Speed = 125

onready var player = get_parent().get_node("Player")

var bullet_scene = preload("res://Scenes/B_bullet.tscn")
var velocity = Vector2.ZERO
var direction = velocity
var can_shoot = true
var bomb_scene = preload("res://Scenes/B_Bomb.tscn")
var max_health = 50
var damage = 2

func _ready():
	pass
	add_to_group("ene")

func _physics_process(_delta):
	var to_player = player.global_position - self.global_position
	var distance = to_player.length()
	var direction = to_player.normalized()
	if distance > 500:
		self.move_and_slide(direction * Speed)
	if distance < 250:
		self.move_and_slide(direction * -Speed)
	
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
	
		var las1 = bullet_scene.instance()
		las1.global_transform = $Gun2.global_transform
		get_parent().add_child(las1)
		can_shoot = false
		$Shoot_Timer.start()
#The boss shoots three bullets at the player

func bomb():
	var b = bomb_scene.instance()
	b.global_transform = $Gun.global_transform
	get_parent().add_child(b)
	
	var b1 = bomb_scene.instance()
	b1.global_transform= $Gun2.global_transform
	get_parent().add_child(b1)
	$Bomb_Timer.start()
# Code for instancing the bombs

func checkdeath():
	if max_health < 1:
		queue_free()
	else:
		pass

func _on_Bomb_Timer_timeout():
	bomb()

func _on_Shoot_Timer_timeout():
	can_shoot = true
	shoot()

func _on_Area2D_body_entered(body):
	if "P_Laser" in body.name:
		max_health -=2
		print("Hit")
		body.queue_free()
