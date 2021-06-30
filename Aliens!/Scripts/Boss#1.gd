extends KinematicBody2D

const Speed = 10

onready var player = get_parent().get_node("Player")
onready var e1 = preload("res://Scenes/Enemy-1B.tscn")
onready var e2 = preload("res://Scenes/Enemy-2B.tscn")

export var bspeed = 500
export var friction = 0.1
export var acceleration = 0.01

var bullet_scene = load("res://Scenes/B_bullet.tscn")
var velocity = Vector2.ZERO
var direction = velocity


func _ready():
	pass
	add_to_group("ene")

func _physics_process(_delta):
	if player == null:
		return 
	look_at(player.position)

func shoot():
	for i in range (10):
		var las = bullet_scene.instance()
		las.global_transform = $Gun.global_transform
		get_parent().add_child(las)
		$Timer.set_wait_time(1)
		print("shooting")


func _on_Ouch_body_entered(body):
	if "p_Bullet" in body.name:
		queue_free()

func _on_Timer_timeout():
	shoot()
