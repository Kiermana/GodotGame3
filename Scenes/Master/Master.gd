extends Control

@onready var main: Control = $Main
@onready var game: Control = $Game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_game(false)
	SignalHub.on_level_selected.connect(on_level_select)
	SignalHub.on_game_exit_pressed.connect(on_game_exit_pressed)
	on_game_exit_pressed()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_level_select(level_setting: LevelSetting) -> void:
	show_game(true)
	


func show_game(shown: bool):
	game.visible = shown
	main.visible = !shown


func on_game_exit_pressed() -> void:
	show_game(false)
