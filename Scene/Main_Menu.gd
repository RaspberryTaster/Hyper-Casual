extends ParallaxBackground


@onready var Button_Audio :=  $"../Setting_UI/Button_Audio"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_texture_button_button_down():
	$"../Setting_UI/TextureButton/AnimationPlayer".play("Pressed")

func _on_texture_button_button_up():
	$"../Setting_UI/TextureButton/AnimationPlayer".play_backwards("Pressed")
	Button_Audio.play()
	await $"../Setting_UI/TextureButton/AnimationPlayer".animation_finished
	SceneTransition._change_scene("res://Main.tscn")

func _on_texture_button_2_button_down():
	$"../Setting_UI/TextureButton2/AnimationPlayer".play("Pressed")
	
func _on_texture_button_2_button_up():
	$"../Setting_UI/TextureButton2/AnimationPlayer".play_backwards("Pressed")
	Button_Audio.play()
	await $"../Setting_UI/TextureButton2/AnimationPlayer".animation_finished
	$"../Setting_UI/AnimationPlayer".play("Main->Score_Board")


func _on_texture_button_3_button_down():
	$"../Setting_UI/TextureButton3/AnimationPlayer".play("Pressed")
	
func _on_texture_button_3_button_up():
	$"../Setting_UI/TextureButton3/AnimationPlayer".play_backwards("Pressed")
	Button_Audio.play()
	await $"../Setting_UI/TextureButton3/AnimationPlayer".animation_finished
	get_tree().quit() # Replace with function body.	






