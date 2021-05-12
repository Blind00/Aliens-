extends Node2D

func _ready():
	pass 
	add_to_group("Player")

export var Speed = 200
var moving = false
var p_Bullet = load("res://Scenes/p_Bullet.tscn")
onready var A1 = $AnimationPlayer.play("Idle")
var b = p_Bullet.instance()

func _process(delta):
	
	if Input.is_action_pressed("ui_right"):
		move(Speed,0,delta)
	if Input.is_action_pressed("ui_left"):
		move(-Speed,0,delta)
	if Input.is_action_pressed("ui_up"):
		move(0,-Speed,delta)
		$AnimationPlayer.play("Move Up")
	if Input.is_action_pressed("ui_down"):
		move(0,Speed,delta)
		$AnimationPlayer.play("Move Down")
	if Input.is_action_pressed("Shoot"):
		shoot()
	

func _physics_process(delta):
	get_input()
	velocity = (velocity)
	
func move(xspeed,yspeed,delta):
	position.x += xspeed * delta
	position.y += yspeed * delta
	moving = true




