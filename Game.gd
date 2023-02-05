extends Node2D

onready var player = $Player
onready var nav = $Navigation2D

func _on_Timer_timeout():
	if $Player/Dialogue.start:
		get_tree().call_group("Beaver", 'get_target_path', player.global_position)
	
