extends Node2D





func _on_Start_button_up():
	get_tree().change_scene("res://Game.tscn")
	



func _on_menu_button_up():
	get_tree().change_scene("res://menu.tscn")



func _on_menu_mouse_entered():
	$hitsound.play()
	pass # Replace with function body.
	
	


func _on_Start_mouse_entered():
	$hitsound.play()
	pass # Replace with function body.
