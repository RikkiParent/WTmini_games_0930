extends KinematicBody2D

var rand = RandomNumberGenerator.new()
var curHP : int = 5
var maxHP : int = 5

var moveSpeed : int = 100
export var xpToGive : int = 30

var damage : int = 1
var attackRate : float = 1.0
var attackDist : int = 100
var chaseDist : int = 200


#onready var ui = get_node("/root/Level_1/CanvasLayer/UI")



func _ready():

	#ui.update_enemy_counter(PlayerVariables.TotalEnemies)
	#ui.update_kill_count(PlayerVariables.EnemiesKilled)
	#self.connect("input_event", self, "_on_input_event")
	#timer.wait_time = attackRate
	#timer.start()
	#print("Drain: ", target.position)
	pass



func _physics_process(delta):
	rand.randomize()
	#yield(get_tree().create_timer(5), "timeout")
	var my_random_number = rand.randf_range(-1, 1)
	var vel = (Vector2(my_random_number, -1)).normalized()
	move_and_slide(vel * moveSpeed)







func _on_H20_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		print("Clicked")
		die()


func die():
	$AudioStreamPlayer2D.play(0.2)
	yield(get_tree().create_timer(0.2), "timeout")
	$AudioStreamPlayer2D.stop()
	#player.give_xp(xpToGive)
	# Count number of enemies clicked
	#PlayerVariables.EnemiesKilled += 1
	#print(PlayerVariables.EnemiesKilled)
	
	#ui.update_kill_count(PlayerVariables.EnemiesKilled)
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_AudioStreamPlayer2D_finished():
	queue_free()
	pass # Replace with function body.
