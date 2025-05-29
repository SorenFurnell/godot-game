extends CharacterBody2D

var maxSpeed = 175
var run_speed = 175
var jump_speed = -500
var gravity = 1250
var friction = 50
var fliped = false
@export var canJump = false
@export var canFlip = true

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
	if left:
		velocity.x -= run_speed
		
func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	move_and_slide()
