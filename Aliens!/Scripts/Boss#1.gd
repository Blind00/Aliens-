extends KinematicBody2D

const Speed = 20

onready var player = get_parent().get_node("Player")

var bullet_scene = load("res://Scenes/B_bullet.tscn")
var velocity = Vector2.ZERO
var direction = velocity
var can_shoot = true
var bomb_scene = preload("res://Scenes/B_Bomb.tscn")

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

func Raycast():
	if $RayCast2D.is_colliding("Player"):
		can_shoot = true
		$Shoot_Timer.start()
	else:
		$Shoot_Timer.stop()
		
func _on_Shoot_Timer_timeout():
	can_shoot = true
