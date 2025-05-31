extends Control
var chara
var checkPointPath
@export var i = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	chara = get_parent().get_node("chara")
	checkPointPath = get_parent().get_node("checkpoints/" + str(i)).position
	position = get_parent().get_node("Camera2D").position
	print(i)
	if visible == true:
		if get_node("Button").button_pressed == true || Input.is_action_pressed("ui_accept"):
			if chara.fliped == true:
				chara.velocity.y *= -1
				chara.gravity *= -1
				chara.jump_speed *= -1
				chara.fliped = false
				
			visible = false
			chara.die = false
			chara.visible = true
			
			match i:
				4:
					get_parent().get_node("Camera2D").position.y -= 720
					get_parent().get_node("Camera2D").room -= 1
					chara.position = checkPointPath
					#chara.position = Vector2(458, 2300)
#				3:
					#chara.position = Vector2(458, 2300)
#				2:
					#chara.position = Vector2(564, 1432)
#				1:
					#chara.position = Vector2(400, 500)
				_:
					chara.position = checkPointPath
					#chara.position = Vector2(-500, 100)
