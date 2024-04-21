extends Node2D
@onready var pause_menu = $PauseMenu
@onready var audioStream: AudioStreamPlayer = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _enter_tree():
	Singleton.main_node = self

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		pause_menu.visible = true
		get_tree().paused = true

func _on_audio_stream_player_finished():
	audioStream.play()
