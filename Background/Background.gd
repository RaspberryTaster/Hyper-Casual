@tool
extends Sprite2D

func calculate_aspect_ratio():
	material.set("shader_parameter/aspect_ratio" ,scale.y/ scale.x) 


func _on_item_rect_changed():
	calculate_aspect_ratio()


