extends Label
var score:int
@export var scoreLimit:int
# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score >= scoreLimit:
		text = "Win"
	else:
		text = str(score)
	pass

func add(value:int):
	score += value
