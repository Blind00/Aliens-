extends Node2D

onready var cur = get_node("Sprite")

func _ready() -> void:
	Input.MOUSE_MODE_HIDDEN
	Input.set_custom_mouse_cursor(cur)
	
	
func _physics_process(_delta: float) -> void:
	self.position = get_global_mouse_position()
