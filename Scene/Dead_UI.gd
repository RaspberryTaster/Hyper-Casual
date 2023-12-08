extends Control

@onready var Button_Audio = $Button_Audio
@onready var Submit_Audio = $Submit_Audio
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Final Score: \n" + str(ScoreManager.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_retry_button_button_down():
	$Retry_Button/AnimationPlayer.play("Pressed")


func _on_retry_button_button_up():
	$Retry_Button/AnimationPlayer.play_backwards("Pressed")
	Button_Audio.play()
	await $Retry_Button/AnimationPlayer.animation_finished
	SceneTransition._change_scene("res://Main.tscn")


func _on_menu_button_button_down():
	$Menu_Button/AnimationPlayer.play("Pressed")


func _on_menu_button_button_up():
	$Menu_Button/AnimationPlayer.play_backwards("Pressed")
	Button_Audio.play()
	await $Menu_Button/AnimationPlayer.animation_finished
	SceneTransition._change_scene("res://Main_Menu.tscn")



func _on_score_board_button_button_down():
	$Score_Board_Button/AnimationPlayer.play("Pressed")



func _on_score_board_button_button_up():
	$Score_Board_Button/AnimationPlayer.play_backwards("Pressed")
	Button_Audio.play()
	await $Score_Board_Button/AnimationPlayer.animation_finished
	$AnimationPlayer.play("Main->Score_Board")



func _on_quit_button_button_down():
	$Quit_Button/AnimationPlayer.play("Pressed")



func _on_quit_button_button_up():
	$Quit_Button/AnimationPlayer.play_backwards("Pressed")
	Button_Audio.play()
	await $Quit_Button/AnimationPlayer.animation_finished
	get_tree().quit()


func _on_submit_button_button_down():
	$Submit_Button/AnimationPlayer.play(("Pressed"))


func _on_submit_button_button_up():
	$Submit_Button/AnimationPlayer.play_backwards("Pressed")
	Submit_Audio.play()
	await $Submit_Button/AnimationPlayer.animation_finished
	var n = $LineEdit.text
	if(n != ""):
		ScoreManager.Send_Score(n)
		$Score_Board.update_board()
