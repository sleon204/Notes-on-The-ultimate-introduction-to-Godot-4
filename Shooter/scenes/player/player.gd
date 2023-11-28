extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true
signal laser(pos, direction)
signal grenade(pos, direction)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity =direction * 500
	move_and_slide()
	#rotate player
	look_at(get_global_mouse_position())
	
	
	# laser shooting input
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary_action") and can_laser:
		$GPUParticles2D.emitting = true
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		var pos = selected_laser.global_position
		
		can_laser = false
		$LaserTimer.start()
		laser.emit(pos, player_direction)
		
	# secondary action
	if Input.is_action_pressed("secondary_action") and can_grenade:
		can_grenade = false
		$GrenadeTimer.start()
		var pos = $LaserStartPositions.get_children()[0].global_position
	
		grenade.emit(pos, player_direction)
		

func _on_laser_timer_timeout():	
	can_laser = true
		
func _on_grenade_timer_timeout():
	can_grenade = true




