extends Button

var Level =  preload("res://Scenes/Level 2.tscn").instance()

func _ready():
	pass

func _on_Play_pressed():
	Play()

func Play():
	print("Button Pressed!")
