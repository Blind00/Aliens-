extends KinematicBody2D

const Speed = 100

onready var player = get_parent().get_node("Player")

var bullet_scene = preload("res://Scenes/B_bullet.tscn")
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
#The Boss chases after the player always looking at the player's character

func shoot():
	if can_shoot == true:
		for _i in range (3):
			var las = bullet_scene.instance()
			las.global_transform = $Gun.global_transform
			get_parent().add_child(las)
			can_shoot = false
			
		for _i in range (3):
			var las = bullet_scene.instance()
			las.global_transform = $Gun2.global_transform
			get_parent().add_child(las)
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
	if body.is_in_group("P"):
		max_health -= 2
		checkdeath()
