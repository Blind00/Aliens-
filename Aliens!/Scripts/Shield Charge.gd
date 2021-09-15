extends RigidBody2D

var speed = 5
var r = 2

func _ready():
	pass

func _physics_process(_delta):
	self.rotation_degrees = r
	
