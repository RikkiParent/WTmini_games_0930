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


func _on_Biogas_mouse_entered():
	#$Control/CenterContainer/VBoxContainer/Biogas.set_scale *= 2
	pass # Replace with function body.
	
func _on_Biogas_pressed():
	get_tree().change_scene("res://Level_Biogas.tscn")
	pass # Replace with function body.


func _on_Biosolid_pressed():
	get_tree().change_scene("res://Level_Biosolids.tscn")
	pass # Replace with function body.


func _on_RecycledWater_pressed():
	get_tree().change_scene("res://Level_WasteWater.tscn")
	pass # Replace with function body.


