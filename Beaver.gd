extends Node2D

var isLeft
var isRight
var isUp
var isDown

var beaver

export var speed = 100
var velocity = Vector2.ZERO
var path = []
var threshold = 16
var nav = null



var playerPos

func _ready():
	yield(owner, "ready")
	nav = owner.nav
	isLeft = false
	isRight = false
	isUp = false
	isDown = false
	
	beaver = self

var direction

func _physics_process(delta):
	if path.size() > 0:
		move_to_target()
	
	if direction != null && direction.x < 0:
		beaver.get_node("Sprite").flip_h = false
		beaver.get_node("Sprite").play("side")
	elif direction != null && direction.x > 0:
		beaver.get_node("Sprite").flip_h = true
		beaver.get_node("Sprite").play("side")
	#elif direction != null && direction.y < 0:
	#	beaver.get_node("Sprite").play("up")
	#elif isDown:
	#	beaver.move_and_slide(Vector2(0, speed))
	#	beaver.get_node("Sprite").play("down")
	
func move_to_target():
	if global_position.distance_to(path[0]) < threshold:
		path.remove(0)	
	else:
		direction = global_position.direction_to(path[0])
		
		velocity = beaver.move_and_slide(direction * speed)
	
	for i in beaver.get_slide_count():
		if beaver.get_slide_collision(i).collider.name == "Player":
			get_tree().change_scene("res://GameOver.tscn")


func get_target_path(target_pos):
	path = nav.get_simple_path(global_position, target_pos, false)


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		speed = 210
		body.get_node("Thing/Coming").color = Color(0.23, 0.06, 0.06, 0.4)
		body.get_node("Audio").pitch_scale = 0.7
		body.get_node("Audio").volume_db = 0
		body.get_node("Heart").playing = true
		


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		speed = 100
		body.get_node("Thing/Coming").color = Color(0.23, 0.06, 0.06, 0)
		body.get_node("Audio").pitch_scale = 3
		body.get_node("Audio").volume_db = 1
		body.get_node("Heart").playing = false
