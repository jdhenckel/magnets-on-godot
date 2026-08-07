class_name Utils

static func create_wall(x1,y1,x2,y2):
	var rect = Rect2(Vector2(x1,y1),Vector2(x2,y2))
	var wall = StaticBody2D.new()
	var shape = CollisionShape2D.new()
	var rect_shape = RectangleShape2D.new()
	rect_shape.size = rect.size
	shape.shape = rect_shape
	wall.position = rect.position
	return wall

static func create_all_walls(node:Node, a=10, b=100):
	# params: node=self, a=inside thickness, b=outside thickness
	var size = node.get_viewport().get_visible_rect().size
	node.add_child(create_wall(-b, -a, size.x + b, b))
	node.add_child(create_wall(-b, size.y - a, size.x + b, b))
	node.add_child(create_wall(-a, -b, b, size.y + b))
	node.add_child(create_wall(size.x - a, -b, b, size.y + b))

static func delete_walls(node:Node):
	for child in node.get_children():
		if child is StaticBody2D:
			child.queue_free()
