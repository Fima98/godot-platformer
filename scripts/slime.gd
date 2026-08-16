extends Node2D


var direction : int = 1

@onready var killzone = $Killzone
@onready var ray_cast_v = $Vertical
@onready var ray_cast_h = $Horizontal
@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	killzone.body_entered.connect(_on_body_entered)

func _process(delta: float) -> void:
	if not ray_cast_v.is_colliding() or ray_cast_h.is_colliding():
		change_direction()
	position.x += 30 * delta * direction


func _on_body_entered(body: Node2D) -> void:
	change_direction()


func change_direction() -> void:
	direction *= -1
	
	ray_cast_v.position.x *= -1
	ray_cast_h.target_position.x *= -1
	
	animated_sprite.flip_h = direction < 0
