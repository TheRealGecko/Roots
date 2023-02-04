extends Node2D


export var mainGameScene : PackedScene

func _on_Start_button_up():
	get_tree().change_scene(mainGameScene.resource_path)



func _on_Instructions_button_up():
	get_tree().change_scene("res://instructions.tscn")


func _on_Exit_button_up():
	get_tree().quit()



func _on_Start_mouse_entered():
	$hitsound.play()
	pass # Replace with function body.



func _on_Instructions_mouse_entered():
	$hitsound.play()
	pass # Replace with function body.
	



func _on_Exit_mouse_entered():
	$hitsound.play()
	pass # Replace with function body.
