extends NetworkObject

@export var progressBar: TextureProgressBar

func _ready() -> void:
	progressBar.value = 100

func _on_prefixed_data(_data: String):
	pass