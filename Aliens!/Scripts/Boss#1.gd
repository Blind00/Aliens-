extends KinematicBody2D

const Speed = 20

onready var player = get_parent().get_node("Player")
onready var e1 = preload("res://Scenes/Enemy-1B.tscn")
onready var e2 = preload("res://Scenes/Enemy-2B.tscn")

export var bspeed = 500

var bullet_scene = load("res://Scenes/B_bullet.tscn")
var velocity = Vector2.ZERO
var direction = velocity
var shooting = false
var lock_on = false
var steering_force = 50.0

func _ready():
	pass
	add_to_group("ene")

func _physics_process(_delta):
	if player == null:
		return 
	look_at(player.position)
	if shooting != true:
		position += transform.x * Speed  * _delta

func shoot():
	shooting = true
	for i in range (2):
		var las = bullet_scene.instance()
		las.global_transform = $Gun.global_transform
		get_parent().add_child(las)

func _on_Visibility_body_entered(body):
	if body.is_in_group("Player"):
		lock_on = true
	else:
		lock_on = false

func _on_Timer_timeout():
	if lock_on == true:
		shoot()
