extends CharacterBody2D


const SPEED = 600
const JUMP_VELOCITY = -600.0
var wall_grabbing = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_timer = 0.4
var wallDir = "None"
var cur_jump_timer = 0  # The time window for coyote time (0.5 seconds)
var can_jump = false
@onready var Hurt_Audio := $Hurt_Audio
@onready var anim = $AnimatedSprite2D
func _physics_process(delta):
	wall_grab()
	
	if(is_on_floor()):
		set_can_jump()
	
	if can_jump:
		#print(cur_jump_timer)
		cur_jump_timer -= delta

	# Add the gravity.
	if not is_on_floor() && not wall_grabbing:
		velocity.y += gravity * delta
	elif(wall_grabbing):
		set_can_jump()
		velocity.y = 0
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and can_jump:
		can_jump = false
		set_wall("None")
		velocity.y = JUMP_VELOCITY
		$Jump_Audio.play()
		
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if(wall_grabbing):
			var condiA = direction > 0 && wallDir == "Right"
			var condiB = direction < 0 && wallDir == "Left"
			if(not(condiA or condiB)):
				set_wall("None")				
		else:
			set_wall("None")
		
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	animation_handler(direction)

func set_can_jump():
	can_jump = true
	cur_jump_timer = jump_timer
	
func wall_grab():
	if(is_on_floor() or wall_grabbing): return
	#if(not can_wall_grab):pass
	var directional_dict = {}
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if(collision.get_collider().name == "Spike_Head" ):continue
		var point1 = collision.get_position()
		var point2 = position
		var direction_vector = point2 - point1
		var normal_vector = direction_vector.normalized()
		print(normal_vector)
		if(normal_vector.x == 0):
			if(normal_vector.y > 0):
				directional_dict["Up"] = normal_vector
			elif(normal_vector.y < 0):
				directional_dict["Down"] = normal_vector
		elif(normal_vector.x > 0):
			directional_dict["Right"] = normal_vector
		elif(normal_vector.x < 0):
			directional_dict["Left"] = normal_vector
			
	if(directional_dict.has("Up")):
		set_wall("None")
		return
	elif(directional_dict.has("Down")):
		set_wall("None")
		return
	elif(directional_dict.has("Left")):
		set_wall("Right")
	elif(directional_dict.has("Right")):
		set_wall("Left")
	#set_wall("None")
	
	
func set_wall(dir):
	wallDir = dir
	if(wallDir == "None"):
		wall_grabbing = false
	else:
		wall_grabbing = true
	$"../Label2".text = "Previous Wall = "+ dir
	
func _on_area_2d_body_entered(body):
	if body is StaticBody2D:
		print(body)

func kill():
	anim.play("Hit")
	Hurt_Audio.play()
	ScoreManager.Dead()
	SceneTransition._change_scene("res://Scene/Dead.tscn")
	
	
func animation_handler(direction):
	
	if(anim.animation == "Hit"):
		return
		
	if direction == -1:
		anim.flip_h = true
	elif direction == 1:
		anim.flip_h = false
	
	if(wall_grabbing):
		anim.play("Wall Jump")
	elif(velocity.y>0):
		anim.play("Jump")
		
	elif (velocity.y < 0):
		anim.play("Fall")
	elif(velocity != Vector2.ZERO):
		anim.play("Run")
	elif(velocity == Vector2.ZERO):
		anim.play("Idle")
