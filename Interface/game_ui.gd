extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_settings_2_button_down():
	$Settings2/AnimationPlayer.play("Pressed")


func _on_settings_2_button_up():
	$Settings2/AnimationPlayer.play_backwards("Pressed")
	await  $Settings2/AnimationPlayer.animation_finished
	#SceneTransition._change_scene("res://Interface/Settings_Menu.tscn")



func _on_settings_button_down():
	$Settings/AnimationPlayer.play("Pressed")


func _on_settings_button_up():
	$Settings/AnimationPlayer.play_backwards("Pressed")
	await  $Settings/AnimationPlayer.animation_finished
	SceneTransition._change_scene("res://Interface/Settings_Menu.tscn")
