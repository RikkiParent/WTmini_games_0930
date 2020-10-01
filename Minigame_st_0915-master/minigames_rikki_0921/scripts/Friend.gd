extends KinematicBody2D

# constants cannot be reset
const GRAVITY = 10
const JUMP_POWER = -550
const FLOOR = Vector2(0, -1)
const followDist = 250

# variables can be reset
var vel = Vector2()
var SPEED = 100

var on_ground = false
var is_attacking = false
var is_landing = false

onready var player = get_node("../Player")
#onready var friend2 = get_node("../Friend2")

func _ready():
	$AnimationPlayer.play("BobbingIdle")


# physics_process happens every frame
func _physics_process(_delta):
	var dist = position.distance_to(player.position)
	var vel2 = (player.position - position).normalized()
	var playerPosX = player.position.x 
	var selfPosX = self.position.x
	#print("player: ", playerPosX)
	#print("self: ", selfPosX)
		
	add_collision_exception_with(player)
	#add_collision_exception_with(friend2)
	
	# Horizontal movement
	if playerPosX > selfPosX + followDist:     # if player is right of friend
		if is_attacking == false:
			vel.x = SPEED                              # move friend right
			$AnimatedSprite.play("RunR")                # play 'run' animation
			if sign($Position2D.position.x) == -1:       # if was facing left
				$Position2D.position.x *= -1             # turn around
			
	elif playerPosX < selfPosX - followDist:   # elif player is left of friend
		if is_attacking == false:
			vel.x = -SPEED                             # move friend left
			$AnimatedSprite.play("RunL")
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
			
	else:
		vel.x = 0
		if on_ground == true && is_attacking == false:
			if sign($Position2D.position.x) == 1:
				$AnimatedSprite.play("IdleR")
			else:
				$AnimatedSprite.play("IdleL")
		
	# Vertical movement
	if player.position.y < self.position.y - followDist/2:     # if player is above self
		if is_attacking == false:
			if on_ground == true:
				vel.y = JUMP_POWER
				on_ground = false
	
#	# Attack when player attacks
#	if player.is_attacking == true:
#		$AnimatedSprite.play("Whistle")
#		var whistle = WHISTLE.instance()
#		if sign($Position2D.position.x) == 1:
#			whistle.set_whistle_dir(1)
#		else:
#			whistle.set_whistle_dir(-1)
#		get_parent().add_child(whistle)
#		whistle.position = $Position2D.global_position
	
	# Add gravity always
	vel.y += GRAVITY


	if is_on_floor():
		on_ground = true
		if is_landing == true:                         
			$AnimatedSprite.play("Splat")
	else:
		if is_attacking == false:
			on_ground = false
			if vel.y < 0:
				if sign($Position2D.position.x) == 1:
					$AnimatedSprite.play("JumpR")
				else:
					$AnimatedSprite.play("JumpR")
			else:
				if sign($Position2D.position.x) == 1:
					$AnimatedSprite.play("FallR")
				else:
					$AnimatedSprite.play("FallL")
	
	
	vel = move_and_slide(vel, FLOOR) 


func _on_AnimatedSprite_animation_finished():
	is_attacking = false
