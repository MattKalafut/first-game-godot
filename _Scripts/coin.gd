extends Area2D;

@onready var game_manager = %GameManager;

#func _ready():
#	print("I am a coin")

func _on_body_entered(body):
	#print("+1 coin!")
	game_manager.add_point();
	queue_free(); #queues the node (and all children) to be deleted at the end of the current frame.
