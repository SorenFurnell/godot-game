extends CharacterBody2D

var maxSpeed = 175
var run_speed = 175
var jump_speed = -500
var gravity = 1250
var friction = 50
var fliped = false
var facingLeft = true
var die = false
@export var canJump = false
@export var canFlip = true

func stop_anims():
	if facingLeft:
		get_node("Sprite2D").stop()
		get_node("Sprite2D").play("facingLeft")
	else:
		get_node("Sprite2D").stop()
		get_node("Sprite2D").play("facingRight")

func get_input():
	if velocity.x > maxSpeed:
		velocity.x = maxSpeed
	elif velocity.x < -1*maxSpeed:
		velocity.x = -1*maxSpeed
	elif velocity.x < -1*friction:
		velocity.x += friction
	elif  velocity.x > friction:
		velocity.x -= friction
	elif velocity.x > -1*friction && velocity.x < friction:
		velocity.x = 0
	
	if is_on_floor() and !fliped:
		canJump = true
		canFlip = true
	elif is_on_ceiling() and fliped:
		canJump = true
		canFlip = true
	else:
		stop_anims()
	
	for i in get_slide_collision_count():
		if get_slide_collision(i).get_collider().name == "die tiles":
			die = true
			get_parent().get_node("Control").visible = true
	
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')
	var flip = Input.is_action_just_pressed('ui_select')

	if canFlip and flip:
		velocity.y *= -1
		gravity *= -1
		jump_speed *= -1
		canFlip = false
		if fliped:
			fliped = false
		else:
			fliped = true
	if canJump and jump:
		velocity.y = jump_speed
		canJump = false
	if right:
		velocity.x += run_speed
		facingLeft = false
		get_node("Sprite2D").play("runRight")
	if left:
		velocity.x -= run_speed
		facingLeft = true
		get_node("Sprite2D").play("runLeft")
		
	if velocity.x == 0:
		stop_anims()
		
	if !facingLeft:
		get_node("Sprite2D").position.x = -25
	else:
		get_node("Sprite2D").position.x = 0

func _physics_process(delta):
	if die == false:
		velocity.y += gravity * delta
		get_input()
		if fliped:
			scale.y = -0.5
		else:
			scale.y = 0.5
		move_and_slide()
	else:
		visible = false
