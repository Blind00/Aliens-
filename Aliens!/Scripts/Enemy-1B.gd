extends KinematicBody2D

const Speed = 50
export var friction = 0.1
export var acceleration = 0.01
var bullet_scene = load("res://Scenes/e1_Bullet.tscn")
onready var collision = $RayCast2D
onready var player = get_parent().get_node("Player")
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
		
func spawn_bullets():
	var b1 = bullet_scene.instance()
	b1.position = self.position
	b1.dir = Vector2(player.position.x - self.position.x, player.position.y - self.position.y).normalized()
	get_parent().add_child(b1)

func set_player(p):
	player=p

func kill():
	queue_free()

func _on_Area2D_body_entered(body: Node) -> void:
	kill()
