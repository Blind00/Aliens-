extends KinematicBody2D

var speed = 200
var steer_force = 50.0
var can_steer = true

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var target = null


func _ready():
	add_to_group("P")

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
	acceleration += seek()
	velocity += seek()
	velocity += acceleration * delta
	velocity = velocity.clamped(speed)
	rotation = velocity.angle()
	position += velocity * delta

func _on_Area2D_body_entered(body):
	if body.is_in_group("ene"):
		target = body

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
