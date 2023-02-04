extends Node2D

var isLeft
var isRight
var isUp
var isDown

var beaver
var speed

var playerPos

func _ready():
	isLeft = false
	isRight = false
	isUp = false
	isDown = false
	
	beaver = $KinematicBody2D
	speed = 100

func _physics_process(delta):
	playerPos = get_parent().get_node("Player").get_position()	
	
	if isLeft:
		beaver.move_and_slide(Vector2(-speed, 0))
		beaver.get_node("Sprite").flip_h = false
		beaver.get_node("Sprite").play("side")
	elif isRight:
		beaver.move_and_slide(Vector2(speed, 0))
		beaver.get_node("Sprite").flip_h = true
		beaver.get_node("Sprite").play("side")
	elif isUp:
		beaver.move_and_slide(Vector2(0, -speed))
		beaver.get_node("Sprite").play("up")
	elif isDown:
		beaver.move_and_slide(Vector2(0, speed))
		beaver.get_node("Sprite").play("down")

