extends Sprite2D

func _process(_delta):
	if get_parent().canJump == false:
		visible = false
	else:
		visible = true
