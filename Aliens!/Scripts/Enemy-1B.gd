extends KinematicBody2D

const Speed = 10

export var friction = 0.1
export var acceleration = 0.01
export var bspeed = 1000

onready var player = get_parent().get_node("Player")

var bullet_scene = load("res://Scenes/e1_Bullet.tscn")
var velocity = Vector2.ZERO
var direction = velocity

func _ready():
	add_to_group("ene")

func _physics_process(_delta):
	if player == null:
		return 
	velocity = position.direction_to(player.position) * Speed
	velocity = move_and_slide(velocity)
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * Speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)
	look_at(player.position)

func shoot():
	var las = bullet_scene.instance()
	las.global_transform = $Gun.global_transform
	get_parent().add_child(las)
	$Timer.set_wait_time(0.5)

func set_player(p):
	player=p

func _on_Ouch_body_entered(body: Node) -> void:
	if "p_Bullet" in body.name:
		queue_free()

func _on_Timer_timeout():
	if player != null:
		shoot()
