extends Area2D

@onready var timer: Timer = $Timer
@onready var gameover: AudioStreamPlayer = $"../../GameOver"

func _on_body_entered(_body: Node2D):
	if _body.name == "Player":
		gameover.play()
		NewAutoloadScript.playeralive = false
		timer.start()

func _on_timer_timeout() -> void:
	NewAutoloadScript.playeralive = true
	get_tree().reload_current_scene()
		
