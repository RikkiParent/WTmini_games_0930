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

var METHANE = load("res://Methane.tscn")




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
	var my_random_number = rand.randf_range(-2, 2)
	var vel = (Vector2(my_random_number, -1)).normalized()
	move_and_slide(vel * moveSpeed)



func die():
	var ui = get_node("/root/Level_Biogas/UI")
	var energy = get_node("/root/Level_Biogas/foreground/background_chamber/TextureProgress2")
	#player.give_xp(xpToGive)
	
	# Count number of enemies clicked
	PlayerVariables.EnemiesKilled += 1
	print(PlayerVariables.EnemiesKilled)
	
	ui.update_kill_count(PlayerVariables.EnemiesKilled)
	energy.value += 1
	self.position.x = 1500
	position.y = 0
	input_pickable = false
	$Light2D.hide()
	


func _on_Methane_input_event(viewport, event, shape_idx):
	
	if (event is InputEventMouseButton && event.pressed):
		print("Clicked")
		die()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	

	
	
