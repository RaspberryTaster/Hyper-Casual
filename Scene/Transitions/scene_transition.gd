extends CanvasLayer

@onready var anim = get_node("AnimationPlayer")

func _change_scene(target: String):
	anim.play("In")
	await anim.animation_finished
	get_tree().change_scene_to_file(target)
	anim.play_backwards("In")
	await anim.animation_finished
	anim.play_backwards("RESET")
