extends Node


func vw_size() -> Vector2:
	return get_viewport().get_visible_rect().size

func _ready() -> void:
	Utils.create_all_walls(self)
	Utils.create_magnets(self, vw_size(), 10)

func _process(delta: float) -> void:
	pass
