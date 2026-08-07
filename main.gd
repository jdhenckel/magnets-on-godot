extends Node


func _ready() -> void:
	Utils.create_all_walls(self)

func _process(delta: float) -> void:
	pass
