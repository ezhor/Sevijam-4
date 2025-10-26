class_name PlayerDamage
extends NetworkObject

func damage(identity: int):
	send_data_immediate(str(identity))


func _on_prefixed_data(data: String):
	var identity: int = int(data.split("@")[2])
	if identity == IdentityManager.identity:
		IdentityManager.health.damage()