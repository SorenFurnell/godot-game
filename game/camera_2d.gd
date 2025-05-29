extends Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_parent().get_node("chara").position.y >= position.y+360:
		position.y += 720
	if get_parent().get_node("chara").position.y <= position.y-360:
		position.y -= 720
