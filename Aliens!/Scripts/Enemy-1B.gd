extends KinematicBody2D

const Speed = 250

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
		return
	position += transform.x * Speed  * _delta
	look_at(player.position)

func shoot():
	for i in range (3):
		var las = bullet_scene.instance()
		las.global_transform = $Gun.global_transform
		get_parent().add_child(las)
		$Timer.set_wait_time(1)

func _on_Ouch_body_entered(body: Node) -> void:
	if "p_Bullet" in body.name:
		queue_free()

func _on_Timer_timeout():
		shoot()
