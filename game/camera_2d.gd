extends Camera2D
var room = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if get_parent().get_node("chara").position.y >= position.y+360:
		position.y += 720
		if room >= get_parent().get_node("Control").i:
			get_parent().get_node("Control").i += 1
		room += 1
	if get_parent().get_node("chara").position.y <= position.y-360:
		position.y -= 720
		room -= 1
		#get_parent().get_node("chara").die = true
		#get_parent().get_node("Control").visible = true
