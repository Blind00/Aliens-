extends Area2D

var speed = 750
var dir = Vector2(1,0)

func _process(delta):
	self.position -= dir * speed * delta

