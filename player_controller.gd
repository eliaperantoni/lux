extends KinematicBody2D

export (NodePath) var modulate_path
onready var _modulate: CanvasModulate = get_node(modulate_path)

export (int) var speed = 80
export (int) var jump_speed = -260
export (int) var gravity = 800

var velocity = Vector2.ZERO

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
		
func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	
	if velocity.x != 0:
		$Sprite.scale.x = -1 if velocity.x < 0 else +1
	
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed

func _input(_event):
	if Input.is_action_just_pressed("toggle_light"):
		if _modulate.visible:
			_modulate.hide()
		else:
			_modulate.show()
	
	"""
	if Input.is_action_just_pressed("jump") and $RayCast.is_colliding():
		gravity_scale = -30
		apply_central_impulse(Vector2(0, -300))
		yield(get_tree().create_timer(0.2), "timeout")
		gravity_scale = 30
	"""
