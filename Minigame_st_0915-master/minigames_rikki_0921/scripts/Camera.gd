extends Camera2D


# This script assumes that the zoom.x and zoom.y are always the same.

var current_zoom
var max_zoom # corresponds to zoom_out
var min1_zoom # zoom for object 1
var zoom1_factor = 0.25 # < 1 = zoom_in; > 1 = zoom_out
var transition_time = 0.5

func _ready():
	max_zoom = zoom.x
	min1_zoom = max_zoom * zoom1_factor



func zoom_in_1(new_offset):
	transition_camera(Vector2(min1_zoom, min1_zoom), new_offset)
	print(new_offset)


func zoom_out(new_offset):
	transition_camera(Vector2(max_zoom, max_zoom), new_offset)


func transition_camera(new_zoom, new_offset):
	if new_zoom != current_zoom:
		current_zoom = new_zoom
		$Tween.interpolate_property(self, "zoom", get_zoom(), current_zoom, transition_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.interpolate_property(self, "offset", get_offset(), new_offset, transition_time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
