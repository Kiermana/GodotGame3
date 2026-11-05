extends Control

const MEMORY_TILE = preload("uid://cql5xay1b52lu")
@onready var grid_container: GridContainer = $HB/GridContainer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_select)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_level_select(level_setting: LevelSetting) -> void:
	grid_container.columns = level_setting.column_number
	print(level_setting)
	for i in range(level_setting.total_tiles):
		var memory_tile: MemoryTile = MEMORY_TILE.instantiate() #Memory tile has to be made into a var otherwise add_child doesn't work
		grid_container.add_child(memory_tile)


func _on_exit_button_pressed() -> void:
	for t in grid_container.get_children():
		t.queue_free()
		SignalHub._emit_on_game_exit_pressed()
