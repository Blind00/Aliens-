extends Node2D
func _ready():
	pass
	add_to_group("ene")

var player = null

func _physics_process(delta):
	if player == null:
		
		
	var vec_to_player = player.global_position
	global_rotation = atan2(vec_to_player.y, vec_to_player.x)
	
	
	
	
	
	
