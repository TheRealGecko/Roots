extends Node2D


var talk = ["ARGH I KNEW NOT TO TRUST THIS SKETCHY LOOKING ROOTS STORE!", "Ahh what do I do now that the door is locked!?", "If only I didn't wreck this place, then Roots' mascot might not have been mad at me...", "Er, whatever, I can do this!", "If I can find 3 Roots branded gems, it should break the lock.", "Just gotta avoid that weird beaver while I'm at it ahaha..."]
var idiot = "Tch, still locked. I need to find all 3 gems before I can open this door. Maybe I should look around."
var pos = 1
var start = false

func _ready():
	visible = true
	$NinePatchRect/Text.text = talk[pos]
	print(talk.size())

func _physics_process(delta):
	if Input.is_action_just_released("enter"):
		if pos >= talk.size() - 1:
			start = true
			visible = false
		else:
			pos += 1
			$NinePatchRect/Text.text = talk[pos]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Door2D_body_entered(body):
	if get_parent().gemAmt < 3:
		visible = true
		start = false
		$NinePatchRect/Text.text = idiot
		if Input.is_action_just_released("enter"):
			visible = false
			start = true
	
