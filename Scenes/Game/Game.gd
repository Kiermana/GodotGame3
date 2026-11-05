extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_select)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_level_select(level_setting: LevelSetting) -> void:
	print(level_setting)
	
