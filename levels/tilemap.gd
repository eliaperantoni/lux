extends TileMap

var lights = []

var on = false

func _input(_ev):
	if Input.is_action_just_pressed("toggle_light"):
		if on:
			turn_off()
		else:
			turn_on()
		on = not on

func _ready():
	var cell_positions = get_used_cells()
	for pos in cell_positions:
		var tile_id = get_cellv(pos)
		var tile_name = get_tileset().tile_get_name(tile_id)
		if tile_name == "light":
			var light = Light2D.new()
			light.texture = preload("res://tiles/tile02.png")
			# huh?
			light.position = Vector2(pos[0]*16+8, pos[1]*16+8)
			light.energy = 2
			
			var body = StaticBody2D.new()
			body.friction = 0
			var shape = CollisionShape2D.new()
			var rectangle_shape = RectangleShape2D.new()
			# I have no idea why 0.8 is the correct value *shrug*
			shape.scale = Vector2(0.8, 0.8)
			shape.shape = rectangle_shape
			
			body.add_child(shape)
			light.add_child(body)
			
			lights.append(light)

func turn_on():
	for light in lights:
		add_child(light)
			
func turn_off():
	for light in lights:
		remove_child(light)
