extends Node2D
func _ready():
	pass
	add_to_group("Enemy")

var bull = load("res://Scenes/e1_Bullet.tscn")

func _physics_process(delta):
	
	var B = bull.instance()
	B.position.x += 100
	add_child(B)
