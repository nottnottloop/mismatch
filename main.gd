extends Node2D

var otherBox
var sub1
var sub2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	otherBox = $CanvasLayer/textBoxes/textBox1/Panel.get_theme_stylebox("panel").duplicate()
	sub1 = $CanvasLayer/textBoxes/textBox1/Panel/MarginContainer/Subtitles
	sub2 = $CanvasLayer/textBoxes/textBox2/Panel/MarginContainer/Subtitles
	otherBox.texture = preload("res://TextBox2.png")
	#$Subtitles.setLine("Marco : dennis is a fool to even attempt to enter my eyeline")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		Engine.time_scale = 10
	else:
		Engine.time_scale = 1



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

func setMusic(s: String):
	if $music.get_stream_playback():
		$music.get_stream_playback().switch_to_clip_by_name(s)

func setSFX(s: String):
	if $SFX.get_stream_playback():
		$SFX.get_stream_playback().switch_to_clip_by_name(s)
var choice1
var choice2
func decision(scene: int):
	if scene == 1:
		addChoices("I love you too","Yeah, that would be nice")
	elif scene == 12:
		addChoices("No, its fine","Love you too!")
	elif scene == 2:
		addChoices("Dont take my money!","Oh im so sorry")
	elif scene == 21:
		addChoices("Give me your money","How about.. NO!")
	elif scene == 3:
		addChoices("It looks rubbish","It looks great!")
	elif scene == 31:
		addChoices("Now it looks great","I think it just needs some improvement")
func addChoices(c1,c2,hover=0):
	var hoverSize = "55"
	choice1 = c1
	choice2 = c2
	if hover == 1:
		sub1.text += '\n [shake  rate=4 level=8][url="'+c1+'"][font_size='+hoverSize+'][color=#808080]' +c1+'[/color][/font_size][/url]\n[url="' +c2+'"]' +c2+'[/url][/shake]'
		sub2.text += '\n [shake  rate=4 level=8][url="'+c1+'"][font_size='+hoverSize+'][color=#808080]' +c1+'[/color][/font_size][/url]\n[url="' +c2+'"]' +c2+'[/url][/shake]'
	elif hover == 2:
		sub1.text += '\n [shake  rate=4 level=8][url="'+c1+'"]' +c1+'[/url]\n[url="' +c2+'"][font_size='+hoverSize+'][color=#808080]' +c2+'[/color][/font_size][/url][/shake]'
		sub2.text += '\n [shake  rate=4 level=8][url="'+c1+'"]' +c1+'[/url]\n[url="' +c2+'"][font_size='+hoverSize+'][color=#808080]' +c2+'[/color][/font_size][/url][/shake]'
	else:
		sub1.text += '\n [url="'+c1+'"]' +c1+'[/url]\n[url="' +c2+'"]' +c2+'[/url]'
		sub2.text += '\n [url="'+c1+'"]' +c1+'[/url]\n[url="' +c2+'"]' +c2+'[/url]'
func _on_subtitles_meta_hover_started(meta: Variant) -> void:
	if choice1 and choice2:
		sub1.text = "[shake  rate=4 level=8]"+sub1.finishedText+"[/shake]"
		sub2.text = "[shake  rate=4 level=8]"+sub2.finishedText+"[/shake]"
		if meta == choice1:
			addChoices(choice1,choice2,1)
		elif meta == choice2:
			addChoices(choice1,choice2,2)
		else:
			addChoices(choice1,choice2)
func _on_subtitles_meta_hover_ended(_meta: Variant) -> void:
	sub1.text = "[shake  rate=4 level=8]"+sub1.finishedText+"[/shake]"
	sub2.text = "[shake  rate=4 level=8]"+sub2.finishedText+"[/shake]"
	if choice1 and choice2:
		addChoices(choice1,choice2)


func _on_subtitles_meta_clicked(meta: Variant) -> void:
	sub1.text = "[shake  rate=4 level=8]"+sub1.finishedText+"[/shake]"
	sub2.text = "[shake  rate=4 level=8]"+sub2.finishedText+"[/shake]"
	if meta == choice1:
		$AnimationPlayer.play(str($AnimationPlayer.get_meta("last"))+"1")
	if meta == choice2:
		$AnimationPlayer.play(str($AnimationPlayer.get_meta("last"))+"2")
	choice1 = null
	choice2 = null


func _on_start_pressed() -> void:
	$AnimationPlayer.play("start")
	$CanvasLayer/CenterContainer/start.hide()
