extends Area2D

var speed = 30

func _ready():
	add_to_group("C")

func _physics_process(delta):
position += transform.x * speed * delta 

func _on_Area2D2_body_entered(body):
	if body.is_in_group("P"):
		queue_free()
