extends AudioStreamPlayer
class_name SodaSFX

enum TYPES{UI, GENERAl}
var currentType: TYPES = TYPES.GENERAl

func _ready() -> void:
	connect("finished", audio_finished)

func set_type(type: TYPES) -> void:
	pass
	
func get_type() -> TYPES:
	return currentType
	
func audio_finished() -> void:
	queue_free()
