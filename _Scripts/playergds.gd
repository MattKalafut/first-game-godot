extends CharacterBody2D;


const SPEED = 130.0;
const JUMP_VELOCITY = -300.0;

@onready var animated_sprite = $AnimatedSprite2D;
@onready var jump_sound = $JumpSound
@onready var respawn_sound = $RespawnSound
@onready var game_manager = %GameManager;

func _ready():
	respawn_sound.play();

# _physics_process() runs 60 times per second by default, independent of game framerate
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta;

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_sound.play();
		velocity.y = JUMP_VELOCITY;

	# Get the input direction. -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right");
	
	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false;
	elif direction < 0:
		animated_sprite.flip_h = true;
	
	# Play animations
	if is_on_floor():
		if direction == 0: # Standing still
			animated_sprite.play("idle");
		else:
			animated_sprite.play("run");
	else:
		animated_sprite.play("jump");
	
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED;
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide();
