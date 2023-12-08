extends Control

var scoreLine = preload("res://ScoreBoard/score_line.tscn")

# Called when the node enters the scene tree for the first time.
var sw_result:Dictionary


func _ready():
	update_board()
	
	
func update_board():
	for n in $VBoxContainer.get_children():
		$VBoxContainer.remove_child(n)
		n.queue_free()
	
	var index = 1
	sw_result = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	print(sw_result)
	for s in sw_result["scores"]:
		var x = scoreLine.instantiate()
		x.get_node("strPosition").text = str(index) + "."
		x.get_node("strName").text = s.player_name
		
		x.get_node("strScore").text = str(s.score)
		$VBoxContainer.add_child(x)
		index += 1
		
func _on_back_button_button_down():
	$Back_Button/AnimationPlayer.play("Pressed")


func _on_back_button_button_up():
	$Back_Button/AnimationPlayer.play_backwards("Pressed")
	$"../Button_Audio".play()
	await $Back_Button/AnimationPlayer.animation_finished
	var ani = $"../AnimationPlayer"
	if(ani != null):
		ani.play_backwards("Main->Score_Board")
