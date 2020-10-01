extends Node2D


onready var TIMER = load("res://Timer.tscn")
onready var COUNTER = load("res://UI.tscn")


onready var glow_house = get_node("foreground/background_houses/Light2D")
onready var glow_WTP = get_node("foreground/background_treatmentplant/Light2D")

onready var camera = get_node("Camera2D")
#var v0 = get_viewport_rect().size
var pos_1 : Vector2 = Vector2(0,0)
onready var pos_house : Vector2 = $foreground/background_houses/Position_House.global_position
onready var pos_WTP : Vector2 = $foreground/background_treatmentplant/Position_WTP.global_position

onready var energy = $foreground/background_chamber/TextureProgress2


func _ready():
	
	PlayerVariables.EnemiesKilled = 0
	
	var counter = COUNTER.instance()
	var timer = TIMER.instance()
	add_child(counter)
	add_child(timer)
	
	print("Viewport Resolution is: ",get_viewport_rect().size)
	
	camera.limit_left = 0
	camera.limit_top = 0
	camera.limit_bottom = 1080
	camera.limit_right = 1920
	
	var TIMESUP = get_tree().get_root().find_node("Timer", true, false)
	TIMESUP.connect("TimesUp", self, "handle_TimesUp")



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func handle_TimesUp():
	$YouLose.show()
	yield(get_tree().create_timer(5.0), "timeout")
	get_tree().change_scene("res://MainMenu.tscn")


func _on_Area2D_input_event(viewport, event, shape_idx):
	#if (event is InputEventMouseButton && event.button_index == BUTTON_RIGHT && event.pressed):
		#camera.zoom_out(pos_1)
		pass



func _on_Area_House_input_event(viewport, event, shape_idx):
	
	glow_house.show()
	
	if (event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed):
		
		#camera.zoom_in_1(pos_house)
		
		var toiletFlush = get_node("foreground/background_houses/AudioStreamPlayer2D")
		toiletFlush.volume_db = -10
		toiletFlush.play()
		$foreground/background_houses/TextureProgress.value += 1



func _on_Area_WTP_input_event(viewport, event, shape_idx):
	
	if $foreground/background_houses/TextureProgress.value > 0:
		glow_WTP.show()
		
		if (event is InputEventMouseButton && event.button_index == BUTTON_LEFT && event.pressed):
			var WTP = get_node("foreground/background_treatmentplant/AnimationPlayer")
			WTP.play("shake")
			$foreground/background_houses/TextureProgress.value -= 1
			var spawn_point = get_node("foreground/background_digester/Position_digester")
			#camera.zoom_in_1( pos_WTP )
			spawn_point.spawn_gas()
			spawn_point.spawn_gas()
			spawn_point.spawn_gas()



func _on_Area_House_mouse_exited():
	glow_house.hide()


func _on_Area_WTP_mouse_exited():
	glow_WTP.hide()
	


func _on_TextureProgress2_value_changed(value):
	
	if value == 10:
		
		var ui = $UI
		var timer = $Timer
		
		$YouWin.show()
		ui.queue_free()
		timer.queue_free()
		
		yield(get_tree().create_timer(5.0), "timeout")
		get_tree().change_scene("res://MainMenu.tscn")

