extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity =direction * 500
	move_and_slide()
	
	# laser shooting input
	if Input.is_action_pressed("primary_action") and can_laser:
		print("shoot laser")
		can_laser = false
		$LaserTimer.start()
		
	# secondary action
	if Input.is_action_pressed("secondary_action") and can_grenade:
		print("shoot grenade")
		can_grenade = false
		$GrenadeTimer.start()


func _on_grenade_timer_timeout():
	if !can_grenade:
		can_grenade = true


func _on_laser_timer_timeout():	
	if !can_laser:
		can_laser = true
	pass # Replace with function body.
