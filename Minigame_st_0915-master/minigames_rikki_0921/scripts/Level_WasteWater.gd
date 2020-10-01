extends Node2D


onready var TIMER = load("res://Timer.tscn")

onready var house_glow = get_node("foreground/background_houses/Light2D")
onready var water = get_node("foreground/background_treatmentplant/WaterProgress")
onready var tween = get_node("foreground/background_treatmentplant/WaterProgress/Tween")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var timer = TIMER.instance()
	add_child(timer)
	
	for pipe in $Pipes.get_children():
		randomize()
		var rand = randi()%4+1 # returns an int from 1 to 4
		print(rand)
		if rand == 1:
			pipe.rotation_degrees = 0
		elif rand == 2:
			pipe.rotation_degrees = 90
		elif rand == 3:
			pipe.rotation_degrees = 180
		elif rand == 4:
			pipe.rotation_degrees = 270
	pass # Replace with function body.
	
	
	var TIMESUP = get_tree().get_root().find_node("Timer", true, false)
	TIMESUP.connect("TimesUp", self, "handle_TimesUp")



func handle_TimesUp():
	$YouLose.show()
	yield(get_tree().create_timer(5.0), "timeout")
	get_tree().change_scene("res://MainMenu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	
func check_win():
	print("checking for Win")

	if $Pipes/pipe_3.rotation_degrees == 0 and $Pipes/pipe_4.rotation_degrees == 0 \
	and $Pipes/pipe_5.rotation_degrees == 90 and $Pipes/pipe_6.rotation_degrees == 270 \
	and $Pipes/pipe_soccer.rotation_degrees == 90 and $Pipes/pipe_forest.rotation_degrees == 90:
		if $Pipes/pipe_1.rotation_degrees == 0 or $Pipes/pipe_1.rotation_degrees == 180:
			if $Pipes/pipe_2.rotation_degrees == 0 or $Pipes/pipe_2.rotation_degrees == 180:
				if $Pipes/pipe_7.rotation_degrees == 0 or $Pipes/pipe_7.rotation_degrees == 180:
					if $Pipes/pipe_8.rotation_degrees == 0 or $Pipes/pipe_8.rotation_degrees == 180:
						if $Pipes/pipe_9.rotation_degrees == 0 or $Pipes/pipe_9.rotation_degrees == 180:
							if $Pipes/pipe_ocean.rotation_degrees == 90 or $Pipes/pipe_ocean.rotation_degrees == 270:
								if water.value > 0:
									$Particles.show()
									yield(get_tree().create_timer(3.0), "timeout")
									$YouWin.show()
									yield(get_tree().create_timer(5.0), "timeout")
									get_tree().change_scene("res://MainMenu.tscn")


func _on_Area_House_input_event(viewport, event, shape_idx):
	house_glow.show()
	check_win()
	
	if (event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed):
		water.value += 1
		tween.interpolate_property(water, "value", 200, 0, 10.0, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
		tween.start()
		yield(tween, "tween_completed")
	pass # Replace with function body.


func _on_Area_House_mouse_exited():
	house_glow.hide()
	pass # Replace with function body.
