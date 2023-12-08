extends Area2D

var velocity = 300
# Called when the node enters the scene tree for the first time.



func _process(delta):
	position.y += velocity * delta
	#print(position)



func _on_body_entered(body):
	if(body.name == "Player"): 
		body.kill()
		queue_free()
