extends Node2D
@onready var pause_menu = $PauseMenu
@onready var audioStream: AudioStreamPlayer = $AudioStreamPlayer
@onready var ending_screen = $EndingScreen



# Called when the node enters the scene tree for the first time.
func _enter_tree():
	Singleton.main_node = self


func _ready():
	audioStream.play()


func _process(_delta):
	if Singleton.gameOver == true:
		ending_screen.visible = true
	
	if Input.is_action_just_pressed("ui_cancel"):
		pause_menu.visible = true
		get_tree().paused = true

func _on_audio_stream_player_finished():
	audioStream.play()
