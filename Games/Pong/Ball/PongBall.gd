extends Node2D
@export var startSpeed:int
@export var speedIncreasePerHit:int
@export var leftPlayer:Node2D
@export var rightPlayer:Node2D
var velo = Vector2.ZERO
var screenSize
var speed
var paused

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size
	speed = startSpeed
	reset()
	pass # Replace with function body.

func reset():
	paused = true
	position.x = screenSize.x/2
	position.y = 0
	velo.x = 0
	velo.y = 0
	speed = startSpeed
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velo * speed * delta
	if position.y < 0 || position.y > screenSize.y:
		velo.y *= -1
	
	if position.x < 0:
		rightPlayer.score()
		reset()
	if position.x > screenSize.x:
		leftPlayer.score()
		reset()
		
	print(speed*velo)
		
	if paused && Input.is_action_pressed("StartBall"):
		paused = false
		velo.x += 1
		velo.y += 1
	pass




func _on_hit(body:Node2D):
	var bodyPos = body.position.y
	var bodySize = body.get_child(0).shape.size.y
	
	if position.y > bodyPos:
		velo.y += randf_range(0.0,0.5)
	if position.y > bodyPos+(bodySize/2):
		velo.y += randf_range(0.5,0.1)
	
	if position.y < bodyPos:
		velo.y -= randf_range(0.0,0.5)
	if position.y < bodyPos-(bodySize/2):
		velo.y -= randf_range(0.5,1.0)
	
	velo.y = clamp(velo.y, -1, 1)
	
	velo.x *= -1
	
	speed += speedIncreasePerHit
	
	pass # Replace with function body.
