extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_3_button_up():
	$TextureButton3/AnimationPlayer.play_backwards("Pressed")
	await $TextureButton3/AnimationPlayer.animation_finished
	get_tree().quit() 
	


func _on_texture_button_3_button_down():
	$TextureButton3/AnimationPlayer.play("Pressed")
