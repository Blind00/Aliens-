extends KinematicBody2D

var Speed = 350

export var friction = 0.1
export var acceleration = 0.01

onready var player = get_parent().get_node("Player")

var bullet_scene = load("res://Scenes/e1_Bullet.tscn")
var velocity = Vector2.ZERO
var direction = velocity

func _ready():
	add_to_group("ene")
	get_parent().get_node("Player")

func _physics_process(_delta):
	if player == null:
		pass 
	position += transform.x * Speed  * _delta

func shoot():
	var las = bullet_scene.instance()
	las.global_transform = $Gun.global_transform
	get_parent().add_child(las)
	$Timer.set_wait_time(1)

func _on_Timer_timeout():
		shoot()

func _on_DeathCircle_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
