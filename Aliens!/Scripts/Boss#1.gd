extends KinematicBody2D

const Speed = 20

onready var player = get_parent().get_node("Player")

export var bspeed = 500

var bullet_scene = load("res://Scenes/B_bullet.tscn")
var velocity = Vector2.ZERO
var direction = velocity
var run_away = false
var can_shoot = true

func _ready():
	pass
	add_to_group("ene")

func _physics_process(_delta):
	if player == null:
		return 
	if run_away == true:
		look_at(player.position)
		position += transform.x * Speed  * _delta

func shoot():
	if can_shoot == true:
		for i in range (2):
			var las = bullet_scene.instance()
			las.global_transform = $Gun.global_transform
			get_parent().add_child(las)
			can_shoot = false
			$Timer.start()

func _on_Timer_timeout():
	pass

func Raycast():
	if $RayCast2D.is_colliding("Player"):
		can_shoot = true
		$Timer.start()
	else:
		$Timer.stop()

func _on_Run_Away_mouse_entered():
	run_away = true
	
