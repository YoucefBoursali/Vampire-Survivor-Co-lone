extends Node
class_name State
signal Transitioned(states: State, new_state_name: String)

@onready var player: Player
@onready var skeleton: Skeleton = get_owner()
func _ready() -> void:
	skeleton.hurt.connect(on_hurt)
func enter() -> void:
	pass

func exit() -> void:
	pass

func state_process(delta: float) -> void:
	pass

func state_physics(delta: float) -> void:
	pass
func on_hurt() -> void:
	Transitioned.emit(self, "Hurt")
