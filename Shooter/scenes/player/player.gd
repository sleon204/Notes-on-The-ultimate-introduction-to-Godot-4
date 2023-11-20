extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity =direction * 500
	move_and_slide()
	
	# laser shooting input
	if Input.is_action_pressed("primary_action"):
		print("shoot laser")
		
	# secondary action
	if Input.is_action_pressed("secondary_action"):
		print("shoot grenade")
