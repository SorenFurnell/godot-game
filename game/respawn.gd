extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = get_parent().get_node("Camera2D").position
	if visible == true:
		if get_node("Button").button_pressed == true || Input.is_action_pressed("ui_accept"):
			visible = false
			get_parent().get_node("chara").position = Vector2(-500, 100)
			get_parent().get_node("chara").die = false
			get_parent().get_node("chara").visible = true
