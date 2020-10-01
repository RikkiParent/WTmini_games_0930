extends Node2D

onready var TIMER = load("res://Timer.tscn")

onready var glow_house = get_node("foreground/background_houses/Light2D")
onready var glow_WTP = get_node("foreground/background_treatmentplant/Light2D")
onready var glow_digester = get_node("foreground/background_digester/Light2D")
onready var glow_truck = get_node("foreground/biosolid_truck/Light2D")
onready var glow_forest = get_node("forest/Forest/Light2D")
onready var glow_garden = get_node("garden/Light2D")

onready var waste = get_node("foreground/background_houses/TextureProgress")
onready var energy = get_node("foreground/background_digester/TextureProgress")
onready var mulchEnergy = get_node("foreground/MulchTextureProgress")


func _ready():
	
	PlayerVariables.EnemiesKilled = 0
	
	var timer = TIMER.instance()
	add_child(timer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_House_input_event(viewport, event, shape_idx):
	
	glow_house.show()
	
	if (event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed):
		#camera.zoom_in_1(pos_house)
		$foreground/background_houses/AudioStreamPlayer2D.play()
		waste.value += 1

func _on_Area_House_mouse_exited():
	glow_house.hide()


func _on_Area_WTP_input_event(viewport, event, shape_idx):
	
	if waste.value > 0:
		glow_WTP.show()
		
		if (event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed):
			
			var spawn_point = get_node("foreground/background_digester/Position_digester")
			var WTPshake = get_node("foreground/background_treatmentplant/AnimationPlayer")
			waste.value -= 1
			WTPshake.play("Shake2")
			spawn_point.spawn_biosolid()

func _on_Area_WTP_mouse_exited():
	glow_WTP.hide()


func _on_Area_digester_input_event(viewport, event, shape_idx):
	if energy.value == 10:
		glow_digester.show()
		
		if (event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed):
			energy.value = 0
			mulchEnergy.value += 4
			glow_digester.hide()
			var digester_spawner = get_node("foreground/background_digester/Position_digester")
			var spawn_point = get_node("foreground/biosolid_truck/Position_truck")
			for child in digester_spawner.get_children():
				child.queue_free()
			spawn_point.spawn_compost()
			
		#Cannot load truck untill biosolids are turned to compost (truck has own meter to fill)
	


func _on_Area_digester_mouse_exited():
	glow_digester.hide()
	pass


func _on_Area_Truck_input_event(viewport, event, shape_idx):
	if mulchEnergy.value == 4:
		glow_truck.show()



func _on_Area_Truck_mouse_exited():
	glow_truck.hide()




func _on_TextureProgress_value_changed(value):
#	if value == 10:
#		glow_truck.show()
	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Deliver_Forest":
		mulchEnergy.value = 0
		var truck_spawner = get_node("foreground/biosolid_truck/Position_truck")
		for child in truck_spawner.get_children():
			child.queue_free()
		$foreground/biosolid_truck.flip_v = true
		$foreground/biosolid_truck/AnimationPlayer.play_backwards("Deliver_Forest")
		yield(get_tree().create_timer(10.0), "timeout")
		$foreground/biosolid_truck/AnimationPlayer.stop()
	elif anim_name == "Deliver_Garden":
		mulchEnergy.value = 0
		var truck_spawner = get_node("foreground/biosolid_truck/Position_truck")
		for child in truck_spawner.get_children():
			child.queue_free()
		$foreground/biosolid_truck.flip_v = true
		$foreground/biosolid_truck/AnimationPlayer.play_backwards("Deliver_Garden")
		yield(get_tree().create_timer(9.0), "timeout")
		$foreground/biosolid_truck/AnimationPlayer.stop()
		


func _on_MulchTextureProgress_value_changed(value):
	if value == 4:
		glow_forest.show()
		glow_garden.show()
	pass # Replace with function body.


func _on_Garden_input_event(viewport, event, shape_idx):
	if mulchEnergy.value == 4:
		if (event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed):
			$foreground/biosolid_truck/AnimationPlayer.play("Deliver_Garden")
	

func _on_Forest_input_event(viewport, event, shape_idx):
	if mulchEnergy.value == 4:
		if (event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed):
			$foreground/biosolid_truck/AnimationPlayer.play("Deliver_Forest")


