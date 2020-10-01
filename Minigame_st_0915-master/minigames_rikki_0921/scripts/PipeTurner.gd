extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass





func _on_Area_1_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$pipe_1.rotation_degrees += 90
		if $pipe_1.rotation_degrees == 360:
			$pipe_1.rotation_degrees = 0
		get_parent().check_win()


func _on_Area_2_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$pipe_2.rotation_degrees += 90
		if $pipe_2.rotation_degrees == 360:
			$pipe_2.rotation_degrees = 0
		get_parent().check_win()


func _on_Area_3_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$pipe_3.rotation_degrees += 90
		if $pipe_3.rotation_degrees == 360:
			$pipe_3.rotation_degrees = 0

		get_parent().check_win()


func _on_Area_4_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$pipe_4.rotation_degrees += 90
		if $pipe_4.rotation_degrees == 360:
			$pipe_4.rotation_degrees = 0
		get_parent().check_win()
	
	
func _on_Area_5_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$pipe_5.rotation_degrees += 90
		if $pipe_5.rotation_degrees == 360:
			$pipe_5.rotation_degrees = 0
		get_parent().check_win()


func _on_Area_6_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$pipe_6.rotation_degrees += 90
		if $pipe_6.rotation_degrees == 360:
			$pipe_6.rotation_degrees = 0
		get_parent().check_win()


func _on_Area_7_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$pipe_7.rotation_degrees += 90
		if $pipe_7.rotation_degrees == 360:
			$pipe_7.rotation_degrees = 0
		get_parent().check_win()


func _on_Area_8_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$pipe_8.rotation_degrees += 90
		if $pipe_8.rotation_degrees == 360:
			$pipe_8.rotation_degrees = 0
		get_parent().check_win()


func _on_Area_9_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$pipe_9.rotation_degrees += 90
		if $pipe_9.rotation_degrees == 360:
			$pipe_9.rotation_degrees = 0
		get_parent().check_win()


func _on_Area_soccer_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$pipe_soccer.rotation_degrees += 90
		if $pipe_soccer.rotation_degrees == 360:
			$pipe_soccer.rotation_degrees = 0
		get_parent().check_win()


func _on_Area_ocean_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$pipe_ocean.rotation_degrees += 90
		if $pipe_ocean.rotation_degrees == 360:
			$pipe_ocean.rotation_degrees = 0
		get_parent().check_win()


func _on_Area_forest_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$pipe_forest.rotation_degrees += 90
		if $pipe_forest.rotation_degrees == 360:
			$pipe_forest.rotation_degrees = 0
		get_parent().check_win()
