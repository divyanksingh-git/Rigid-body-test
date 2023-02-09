extends RigidBody2D

var speed:int = 200
var jumpVelocity:int = 25000
var friction:int = 1

var left:Vector2
var right:Vector2 
var jump:Vector2

var onGround:bool = false

func _physics_process(delta):
	left = Vector2(-1*speed,linear_velocity.y)
	right = Vector2(1*speed,linear_velocity.y)
	jump = Vector2(linear_velocity.x,-1*jumpVelocity)

	if Input.is_action_pressed("right"):
		linear_velocity = right 
	if Input.is_action_pressed("left"):
		linear_velocity = left
	if Input.is_action_just_pressed("jump"):
		if onGround:
			apply_impulse(jump,Vector2.UP)
	if onGround and !(Input.is_anything_pressed()):
		linear_velocity=lerp(linear_velocity,Vector2.ZERO,friction)


func _on_area_2d_body_entered(body):
	print_debug(body)
	if body.get_name() == "Ground":
		onGround = true


func _on_area_2d_body_exited(body):
	print_debug(body)
	if body.get_name() == "Ground":
		onGround = false
