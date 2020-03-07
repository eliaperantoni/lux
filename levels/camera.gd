extends Camera2D

export (NodePath) var player_path
onready var player: RigidBody2D = get_node(player_path)

func _process(_delta):
	position = player.position
