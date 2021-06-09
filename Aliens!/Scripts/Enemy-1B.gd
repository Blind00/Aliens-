extends KinematicBody2D

const Speed = 50
export var friction = 0.1
export var acceleration = 0.01
var bullet_scene = load("res://Scenes/e1_Bullet.tscn")
onready var player = get_parent().get_node("Player")
var velocity = Vector2.ZERO
var direction = velocity
export var bspeed = 500



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
	las.player = player
	get_parent().add_child(las)
	$Timer.set_wait_time(1)
	


func set_player(p):
	player=p

func _on_Area2D_body_entered(body: Node) -> void:
	if "p_Bullet" in body.name:
		queue_free()


func _on_Visibilty_body_entered(body):
	if body != self:
		player = body
	else:
		player = null

func _on_Timer_timeout():
	if player != null:
		print("shooting")
		shoot()
