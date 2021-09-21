extends KinematicBody2D

const Speed = 20

onready var player = get_parent().get_node("Player")

var bullet_scene = load("res://Scenes/B_bullet.tscn")
var velocity = Vector2.ZERO
var direction = velocity
var can_shoot = true
var bomb_scene = preload("res://Scenes/B_Bomb.tscn")
var max_health = 100

func _ready():
	pass
	add_to_group("ene")

func _physics_process(_delta):
	if player == null:
		return 
		look_at(player.position)
		position += transform.x * Speed  * _delta

func shoot():
	if can_shoot == true:
		for i in range (3):
			var las = bullet_scene.instance()
			las.global_transform = $Gun.global_transform
			get_parent().add_child(las)
			can_shoot = false
			
		for i in range (3):
			var las = bullet_scene.instance()
			las.global_transform = $Gun2.global_transform
			get_parent().add_child(las)
			can_shoot = false
			$Shoot_Timer.start

func bomb():
	for i in range(4):
		var b = bomb_scene.instance()
		b.global_transform = $Gun.global_transform
		get_parent().add_child(b)
		
	for i in range(4):
		var b = bomb_scene.instance()
		b.global_transform = $Gun2.global_transform
		get_parent().add_child(b)

func _on_Bomb_Timer_timeout():
	bomb()

func _on_Shoot_Timer_timeout():
	can_shoot = true

func checkdeath():
	if max_health < 1:
		queue_free()
	else:
		pass

func _on_Area2D_body_entered(body):
	if body.is_in_group("P"):
		max_health -= 2
		print(max_health)
		checkdeath()
