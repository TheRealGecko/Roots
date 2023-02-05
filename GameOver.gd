extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
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
		yield(get_tree().create_timer(0.3), "timeout")
		
	if Input.is_action_just_released("enter"):
		get_tree().change_scene("res://menu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
