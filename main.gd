extends Node2D

var otherBox
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	otherBox = $CanvasLayer/textBoxes/textBox1/Panel.get_theme_stylebox("panel").duplicate()
	
	otherBox.texture = preload("res://TextBox2.png")
	#$Subtitles.setLine("Marco : dennis is a fool to even attempt to enter my eyeline")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass	


func _on_button_1_pressed() -> void:
	$AnimatedSprite2D.animation = "1"


func _on_button_2_pressed() -> void:
	$AnimatedSprite2D.animation = "2"


func addTextBoxStyle():
	$CanvasLayer/textBoxes/textBox1/Panel.add_theme_stylebox_override("panel", otherBox)
	$CanvasLayer/textBoxes/textBox2/Panel.add_theme_stylebox_override("panel", otherBox)


func removeTextBoxStyle():
	$CanvasLayer/textBoxes/textBox1/Panel.remove_theme_stylebox_override("panel")
	$CanvasLayer/textBoxes/textBox2/Panel.remove_theme_stylebox_override("panel")
