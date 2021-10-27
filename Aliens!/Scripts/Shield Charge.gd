extends Area2D

var speed = 30
var woop = false
onready var player = get_parent().get_node("Player")

func _ready():
	add_to_group("C")

