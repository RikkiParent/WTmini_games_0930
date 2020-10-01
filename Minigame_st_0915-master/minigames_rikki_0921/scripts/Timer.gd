extends Control

signal TimesUp

onready var timer = get_node("timer face/AnimationPlayer")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	timer.play("Start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	emit_signal("TimesUp")
	pass # Replace with function body.
