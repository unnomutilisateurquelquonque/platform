extends KinematicBody2D

onready var anim =$ AnimatedSprite
var speed = 250
var gravity = 1000
var velocity = Vector2()
var impulsion = -600
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_input():
	velocity.x=0
	if Input.is_action_pressed("ui_right") :
		anim.play("moving")
		anim.flip_h =true
		velocity.x += speed
	elif Input.is_action_pressed("ui_left") :
		anim.play("moving")
		anim.flip_h =false
		velocity.x -= speed
	elif Input.is_action_just_pressed("ui_select") and is_on_floor():
		velocity.y = impulsion
	elif  Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_right"):
		anim.play("idle")
	#velocity = velocity.normalized() * speed


func _physics_process(delta):
	get_input()
	velocity.y += delta*gravity
	velocity = move_and_slide(velocity,Vector2(0, -1)) # Move down 1 pixel per physics frame
	#move_and_collide(velocity * delta)

