extends Node2D

const SPEED: int = 60

var direction: int = 1
var slimeName: String 

@onready var ray_cast_right = $RaycastRight
@onready var raycast_bottom_right = $RaycastBottomRight
@onready var ray_cast_left = $RaycastLeft
@onready var raycast_bottom_left = $RaycastBottomLeft

# Called when the node enters the scene tree for the first time.
func _ready():
	slimeName = "%s" %name
	print_identity()

func print_identity():
	var identity: String = "I am %s" %name
	print(identity)
	#print("I am %s" %name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Determine which direction to face
	if ray_cast_right.is_colliding():
		print("%s Raycast_Right Collided" % slimeName)
		direction = -1
	if ray_cast_left.is_colliding():
		print("%s Raycast_Left Collided" % slimeName)
		direction = 1;
	
	# Move in current facing direction
	position.x += (direction * SPEED * delta)
