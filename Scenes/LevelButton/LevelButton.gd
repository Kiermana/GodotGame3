extends TextureButton

@export var level_setting: LevelSetting
@onready var label: Label = $Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(level_setting)


func _on_pressed() -> void:
	SignalHub._emit_on_level_select(level_setting)
