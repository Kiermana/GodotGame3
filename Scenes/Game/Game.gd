extends Control

@onready var grid_container: GridContainer = $HB/GridContainer
const MEMORY_TILE = preload("uid://cql5xay1b52lu")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_level_selected.connect(on_level_select)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_level_select(level_setting: LevelSetting) -> void:
	
	var lds: LevelDataSelector = LevelDataSelector.new()
	var selected_images: Array[Texture2D] = lds.get_images_for_level(level_setting)
	var frame_image: Texture2D = ImageManager.get_random_frame_image()
	
	grid_container.columns = level_setting.column_number
	print(level_setting)
	for image in selected_images:
		var memory_tile: MemoryTile = MEMORY_TILE.instantiate() #Memory tile has to be made into a var otherwise add_child doesn't work
		grid_container.add_child(memory_tile)
		memory_tile.setup(image, frame_image)

func _on_exit_button_pressed() -> void:
	for t in grid_container.get_children():
		t.queue_free()
		SignalHub._emit_on_game_exit_pressed()
