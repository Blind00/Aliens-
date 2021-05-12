extends Node2D
func _ready():
	pass

var speed = 100

func _physics_process(delta):
	position += transform.x * speed * delta
	 

