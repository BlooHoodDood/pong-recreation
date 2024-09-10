extends Area2D
var p1score = 0
var p2score = 0

var rng = RandomNumberGenerator.new()

var direction := Vector2(0,0)
var speed : float = 90

var new_ball_called = 0
func _ready() -> void:
	newball()
	print(hud)
@onready var hud: CanvasLayer = $"../../HUD"
	
func newball():
	new_ball_called = 1
	hud.update_score(p2score)
	hud.update_score2(p1score)
	await get_tree().create_timer(1.0).timeout
	var screen_size := get_viewport_rect().size
	global_position.y = screen_size.y / 2
	global_position.x = screen_size.x / 2 
	direction = Vector2(-1,rng.randf_range(-1,1))
	speed = 90
	new_ball_called = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position += Vector2(speed,speed) * direction * delta
	
	var screen_size := get_viewport_rect().size
	if global_position.y>screen_size.y:
		direction.y *= -1
		global_position.y -= 2
	if global_position.y<0:
		direction.y *= -1
		global_position.y += 2
	
	if global_position.x>screen_size.x+30 and new_ball_called<1:
		speed = 0
		p2score+=1
		newball()
		
		
	if global_position.x<-30 and new_ball_called<1:
		speed = 0
		p1score += 1
		newball()

func _on_area_entered(_area: Area2D) -> void:
	
	direction = Vector2(direction.x*-1, direction.y*randf_range(0.7,1.3))
	
	
	if speed < 200:
		speed *= 1.04
	if speed > 500:
		speed *= 0.7
	else:
		speed *= 1.01
	
