extends KinematicBody2D


const GRAVITY = 10
const FLOOR = Vector2(0, -1)

var vel = Vector2()
var SPEED = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	vel.y += GRAVITY
	
	vel = move_and_slide(vel, FLOOR) 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func turn_into_mulch():
	
	#var ui = get_node("/root/Level_Biosolids/UI")
	var energy = get_node("/root/Level_Biosolids/foreground/background_digester/TextureProgress")
	#player.give_xp(xpToGive)
	# Count number of enemies clicked
	PlayerVariables.EnemiesKilled += 1
	print(PlayerVariables.EnemiesKilled)
	
	#ui.update_kill_count(PlayerVariables.EnemiesKilled)
	energy.value += 1
	$AnimatedSprite.play("mulch")
	$CollisionShape2D.scale.y *= .3
	$CollisionShape2D.position.y += 20
	$Light2D.hide()
	
#func load_truck():
#
#	var mulch_energy = get_node("/root/Level_Biosolids/foreground/background_digester/TextureProgress")
#	var mulch_loaded = get_node("/root/Level_Biosolids/foreground/MulchTextureProgress")
#
##	if mulch_energy.value == 10:
#	mulch_energy.value -= 1
#	mulch_loaded.value += 1
#	self.position.x = 1400
#	position.y = 0
#	input_pickable = false
##	$Light2D.hide()




func _on_Biosolid_input_event(viewport, event, shape_idx):
	
	if (event is InputEventMouseButton && event.pressed):
		
		if $AnimatedSprite.animation == "default": 
			print("Clicked")
			turn_into_mulch()
#		elif $AnimatedSprite.animation == "mulch":
#			load_truck()
