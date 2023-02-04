extends Node2D
var isLeft
var isRight
var isUp
var isDown

var player
var speed

var playerPos

func _ready():
	isLeft = false
	isRight = false
	isUp = false
	isDown = false
	
	speed = 150
	
	player = self
	

func _physics_process(delta):
	playerPos = get_position()	
	
	if isLeft:
		player.move_and_slide(Vector2(-speed, 0))
		player.get_node("Sprite").flip_h = false
		player.get_node("Sprite").play("side")
	elif isRight:
		player.move_and_slide(Vector2(speed, 0))
		player.get_node("Sprite").flip_h = true
		player.get_node("Sprite").play("side")
	elif isUp:
		player.move_and_slide(Vector2(0, -speed))
		player.get_node("Sprite").play("up")
	elif isDown:
		player.move_and_slide(Vector2(0, speed))
		player.get_node("Sprite").play("down")
	
	if Input.is_action_pressed("left_arrow") and !isRight and !isUp and !isDown:
		isLeft = true
	if Input.is_action_pressed("right_arrow") and !isLeft and !isUp and !isDown:
		isRight = true	
	if Input.is_action_pressed("up_arrow") and !isLeft and !isRight and !isDown: 
		isUp = true
	if Input.is_action_pressed("down_arrow") and !isLeft and !isRight and !isUp:
		isDown = true

	if Input.is_action_just_released("left_arrow"):
		isLeft = false
		player.get_node("Sprite").stop()
	if Input.is_action_just_released("right_arrow"):
		isRight = false
		player.get_node("Sprite").stop()
	if Input.is_action_just_released("up_arrow"):
		isUp = false
		player.get_node("Sprite").stop()
	if Input.is_action_just_released("down_arrow"):
		isDown = false
		player.get_node("Sprite").stop()
		
	if Input.is_action_pressed("shift"):
		speed = 240
	elif Input.is_action_just_released("shift"):
		speed = 150
