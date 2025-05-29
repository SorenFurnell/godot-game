extends Sprite2D

func _physics_process(delta):
	if get_parent().canJump == false:
		visible = false
	else:
		visible = true
