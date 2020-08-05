extends Camera

var target: Vehicle
var max_distance := 7

func _ready() -> void:
	target = get_node("../vehicle")


func _physics_process(delta: float) -> void:
	var target_pos := target.global_transform.origin
	var self_pos := global_transform.origin
	look_at(target_pos, Vector3.UP)
	target_pos.y = 0
	self_pos.y = 0
	if self_pos.distance_to(target_pos) > max_distance:
		var future_pos := target_pos - (target_pos - self_pos).normalized() * max_distance
		future_pos.y = target.global_transform.origin.y + 5
		global_transform.origin = future_pos
		