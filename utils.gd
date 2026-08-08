class_name Utils

const MagnetScene = preload("res://magnet.tscn")


static func create_wall(x1,y1,x2,y2) -> StaticBody2D:
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


static func rand_pos(vw_size:Vector2) -> Vector2:
	return Vector2(randf_range(0, vw_size.x),randf_range(0, vw_size.y))

static func rand_vel(speed=20) -> Vector2:
	return Vector2(speed,0).rotated(randf_range(0,TAU))

static func create_magnet(vw_size:Vector2) -> Magnet:
	var mag = MagnetScene.instantiate()
	mag.position = rand_pos(vw_size)
	mag.rotation = randf_range(0, TAU)
	mag.linear_velocity = rand_vel()
	mag.angular_velocity = randf_range(-1,1)
	return mag


static func create_magnets(node:Node, vw_size:Vector2, n=1):
	for i in range(n):
		var m = create_magnet(vw_size)
		node.add_child(m)
