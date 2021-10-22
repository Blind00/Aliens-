extends KinematicBody2D

var speed = 180
var steer_force = 80.0
var can_steer = true

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
onready var target =  get_parent().get_node("Player")

func _ready():
	add_to_group("b")

func start(_transform, _target):
	global_transform = _transform
	rotation += rand_range(-0.09, 0.09)
	velocity = transform.x * speed
	target = _target

func seek():
	var steer = Vector2.ZERO
	if target:
		var desired = (target.position - position).normalized() * speed
		steer = (desired - velocity).normalized() * steer_force
	return steer

func _physics_process(delta):
	velocity += seek()
	velocity += acceleration * delta
	velocity = velocity.clamped(speed)
	rotation = velocity.angle()
	position += velocity * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_B_bullet_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()

func _on_LifeTime_timeout():
	queue_free()
