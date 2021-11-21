extends Area2D

export var speed = 40
var initial_pos_y
var direction = 1
var mushroom_h

func _ready():
	initial_pos_y = position.y
	mushroom_h = $Sprite.scale.y * $Sprite.texture.get_height() 


func _process(delta):
	var velocity = Vector2()
	velocity.y += direction
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	var screen_size = get_viewport_rect().size
	position += velocity * delta
	position.y = clamp(position.y, 0, screen_size.y)

	if position.y - initial_pos_y > mushroom_h/1.5 or position.y - initial_pos_y < 0:
		direction *= -1
		


func _on_RertractableMushroom_body_entered(body):
	print("ouch... retractable mushroom hit")
