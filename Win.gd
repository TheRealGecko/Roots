extends Node2D


var x = 0
onready var go = false

func _ready():
	$Sprite.modulate = Color(0,0,0)
	yield(get_tree().create_timer(0.5), "timeout")
	go = true

func _physics_process(delta):
	while x < 1 && go:
		x += 0.1
		$Sprite.modulate = Color(x, x, x)
		yield(get_tree().create_timer(0.4), "timeout")
		
	if Input.is_action_just_released("enter"):
		get_tree().change_scene("res://menu.tscn")
