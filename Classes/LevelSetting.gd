class_name LevelSetting


extends Resource


@export var row_number: int = 2
@export var column_number: int = 2

var total_tiles: int:
	get: return row_number * column_number

var target_pairs: int:
	get: return total_tiles / 2



func _to_string() -> String:
	return "%dx%d" % [row_number, column_number]
