extends KinematicBody2D

onready var player = get_parent().get_node("Player")

var bullet_scene = load("res://Scenes/e1_Bullet.tscn")
var velocity = Vector2.ZERO
var direction = velocity
var Speed = 150
var max_health = 2
var speed = 300

func _ready():
	add_to_group("ene")
	get_parent().get_node("Player")

func _physics_process(_delta):
	if player == null:
		pass 
	var to_player = player.global_position - self.global_position
	var distance = to_player.length()
	var direction = to_player.normalized()
	if distance > 300:
		self.move_and_slide(direction * Speed)
	if distance < 250:
		self.move_and_slide(direction * -speed)
	
	look_at(player.global_position)

func shoot():
	var las = bullet_scene.instance()
	las.global_transform = $Gun.global_transform
	get_parent().add_child(las)
	$Timer.set_wait_time(1)

func _on_Timer_timeout():
		shoot()

func _on_DeathCircle_body_entered(body):
	if "P_Laser" in body.name:
		max_health -= 1
		checkdeath()
		body.queue_free()

func checkdeath():
	if max_health < 1:
		queue_free()

