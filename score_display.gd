extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_score(1) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func update_score(score):
	$ScoreLabel.text = str(score)

func update_score2(score):
	$ScoreLabel2.text = str(score)
