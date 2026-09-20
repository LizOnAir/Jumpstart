extends Area2D

@onready var timer: Timer = $"../Timer"
@onready var gameover: AudioStreamPlayer2D = $"../Player/Gameover"

func _on_body_entered(body: Node2D):
	timer.start()
	gameover.play()

func _on_timer_timeout() -> void:
	await gameover.finished
	get_tree().reload_current_scene()
