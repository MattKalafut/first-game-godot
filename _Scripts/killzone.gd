extends Area2D

# This can be control + dragged into the script within the Godot editor, but essentially it allows us to reference nodes
# in the tree and assign it to the local variable 'timer'
# The local path for this is $Killzone/Timer, but because we're in the Killzone script we can just use $Timer

# if we wanted to grab something from a different scene it would look like
# $Player/Camera or anything that follows the tree hierarchy of Game -> Player -> Camera or Game -> Killzone -> Timer
@onready var timer = $Timer

#Player enters the killzone, prints a "You died!" message, followed by the timer being started
func _on_body_entered(body):
	print("You died!")
	timer.start()
	
#Once the timer reaches the end of the duration from the inspector
func _on_timer_timeout():
	get_tree().reload_current_scene() #reloads the current scene and resets the game
