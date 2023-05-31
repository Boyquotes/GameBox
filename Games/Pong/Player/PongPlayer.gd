extends Node2D

@export var speed = 600
@export var player:int
@export var scoreKeeper:Label
var direction
var screenSize
var height

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = 0
	screenSize = get_viewport_rect().size
	height = $Collision.shape.size.y
	position.y = screenSize.y/2
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction = 0
	if Input.is_action_pressed("Player" + str(player) + "MoveUp"):
		direction -= 1

	if Input.is_action_pressed("Player" + str(player) + "MoveDown"):
		direction += 1
	
	position.y += direction * speed * delta
	position.y = clamp(position.y, 0+(height/2), screenSize.y - (height/2))

func score():
	scoreKeeper.add(1)
	pass
	

