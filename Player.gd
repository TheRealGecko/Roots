extends Node2D
var isLeft
var isRight
var isUp
var isDown

var player
var speed

var playerPos


var stamina = 100

var gemAmt = 0

func _ready():
	isLeft = false
	isRight = false
	isUp = false
	isDown = false
	
	speed = 150
	
	player = self
	$Bar/Blue.modulate = Color(0.25, 0.2, 0.25)
	$Bar/Green.modulate = Color(0.25, 0.2, 0.25)
	$Bar/Red.modulate = Color(0.25, 0.2, 0.25)
	
	$Thing/Coming.color = Color(0.23, 0.06, 0.06, 0)
	
	$Heart.playing = false
	
	$Audio.playing = true
	$Audio.pitch_scale = 0.83
	$Audio.volume_db = -0.5
	
	$Thing.visible = true
	$fog.visible = true
	

func _physics_process(delta):
	playerPos = get_position()	
	if $Dialogue.start == true:
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
			
		if Input.is_action_pressed("shift"):
			if $Bar/ProgressBar.value > 0:
				speed = 260
				$Bar/ProgressBar.value -= 0.35
			else:
				speed = 150
		elif $Bar/ProgressBar.value < 100:
			$Bar/ProgressBar.value += 0.15
		
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
	
	if Input.is_action_just_released("shift"):
		speed = 150


func _on_Blue2D_body_entered(body):
	get_parent().get_node("Blue").queue_free()
	$Bar/Blue.modulate = Color(1, 1, 1)
	gemAmt += 1


func _on_Green2D_body_entered(body):
	get_parent().get_node("Green").queue_free()
	$Bar/Green.modulate = Color(1, 1, 1)
	gemAmt += 1


func _on_Red2D_body_entered(body):
	get_parent().get_node("Red").queue_free()
	$Bar/Red.modulate = Color(1, 1, 1)
	gemAmt += 1


func _on_Door2D_body_entered(body):
	if gemAmt == 3:
		get_tree().change_scene("res://Win.tscn")
