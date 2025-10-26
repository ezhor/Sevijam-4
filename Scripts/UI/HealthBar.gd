extends NetworkObject

@export var progressBar: TextureProgressBar

func _ready() -> void:
	super._ready()
	progressBar.value = 20

func _on_prefixed_data(_data: String):
	pass