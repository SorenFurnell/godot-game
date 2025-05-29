extends Sprite2D

func _process(_delta):
	if get_parent().canFlip == false:
		visible = false
	else:
		visible = true
