extends Control


@onready var body: TextureRect = %Body
@onready var expression: TextureRect = %Expression


@onready var next_button: Button = %NextButton
@onready var next_button_2: Button = %NextButton2

@onready var rich_text_label: RichTextLabel = %RichTextLabel
@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer



#var dialogue_items: Array[String] = [

	#"Roses are red",
	#"Violets are blue",
	#"our game developer",
	#"has decided to finally",
	#"get his hands dirty",
	#"and get more practical",
	#"because time is flying by",
	#"and he has yet to create",
	#"any of his games yet...",
	#"tis the end of April 2026",
	#"tired of waiting for shit to change",
	#"years unemployed because i won't",
	#"get milked by consulting scams",
	#"body shops or fraud groups",
	#"or play to be a kiss ass,",
	#"put others under the bus",
	#"so my group and I stay ahead",
	#"but my pride would never let me",
	#"in an ocean of sheeps",
	#"surrounding this whole damn field",
	#"my passion, hunger and innovation",
	#"all got consumed by dogma",
	#"but got to keep my head down",
	#"stick to the plan",
	#"because your life",
	#"is your journey",
	#"...make it count",
	#"...no more delegating for later"
#]

var expressions := {
	"happy": preload("res://assets/emotion_happy.png"),
	"regular": preload("res://assets/emotion_regular.png"),
	"sad": preload("res://assets/emotion_sad.png"),
}

var dialogue_items: Array[Dictionary] = [
{
		"expression": expressions["regular"],
		"text": "Roses are red",
	},
	{
		"expression": expressions["sad"],
		"text": "Violets are blue",
	},
	{
		"expression": expressions["happy"],
		"text": "our game developer",
	},
	{
		"expression": expressions["regular"],
		"text": "has decided to finally",
	},
	{
		"expression": expressions["sad"],
		"text": "get his hands dirty",
	},
	{
		"expression": expressions["happy"],
		"text": "and get more practical",
	},
	{
		"expression": expressions["regular"],
		"text": "because time is flying by",
	},
	{
		"expression": expressions["sad"],
		"text": "and he has yet to create",
	},
	{
		"expression": expressions["happy"],
		"text": "any of his games yet...",
	},
	{
		"expression": expressions["regular"],
		"text": "tis the end of April 2026",
	},
	{
		"expression": expressions["sad"],
		"text": "tired of waiting for shit to change",
	},
	{
		"expression": expressions["happy"],
		"text": "years unemployed because i won't",
	},
	{
		"expression": expressions["regular"],
		"text": "get milked by consulting scams",
	},
	{
		"expression": expressions["sad"],
		"text": "body shops or fraud groups",
	},
	{
		"expression": expressions["happy"],
		"text": "or play to be a kiss ass,",
	},
	{
		"expression": expressions["regular"],
		"text": "put others under the bus",
	},
	{
		"expression": expressions["sad"],
		"text": "so my group and I stay ahead",
	},
	{
		"expression": expressions["happy"],
		"text": "but my pride would never let me",
	},
	{
		"expression": expressions["regular"],
		"text": "in an ocean of sheeps",
	},
	{
		"expression": expressions["sad"],
		"text": "surrounding this whole damn field",
	},
	{
		"expression": expressions["happy"],
		"text": "my passion, hunger and innovation",
	},
	{
		"expression": expressions["regular"],
		"text": "all got consumed by dogma",
	},
	{
		"expression": expressions["sad"],
		"text": "but got to keep my head down",
	},
	{
		"expression": expressions["happy"],
		"text": "stick to the plan",
	},
	{
		"expression": expressions["regular"],
		"text": "because your life",
	},
	{
		"expression": expressions["sad"],
		"text": "is your journey",
	},
	{
		"expression": expressions["happy"],
		"text": "...make it count",
	},
	{
		"expression": expressions["regular"],
		"text": "...no more delegating for later",
	}
]


var current_item_index = 0


func show_text() -> void:
	var current_item := dialogue_items[current_item_index]
	#rich_text_label.text = current_item
	rich_text_label.text = current_item["text"]
	expression.texture = current_item["expression"]
	
	rich_text_label.visible_ratio = 0.0
	
	
	var tween := create_tween()
	var text_appearing_duration := 1.2
	tween.tween_property(rich_text_label, "visible_ratio", 1.0, text_appearing_duration)

	var sound_max_offset := audio_stream_player.stream.get_length() - text_appearing_duration

	var sound_start_position := randf() * sound_max_offset
	audio_stream_player.play(sound_start_position)
	
	tween.finished.connect(audio_stream_player.stop)

	
func _ready() -> void:
	show_text()
	next_button.pressed.connect(advance)
	next_button_2.pressed.connect(previous)

	
func advance() -> void:
	current_item_index += 1	
	if current_item_index == dialogue_items.size():
		#get_tree().quit() #exits the game
		current_item_index = 0 #loop back to start
		#show_text()
	#else:
	show_text() #once if outside the loops

func previous() -> void:
	current_item_index -= 1	
	if current_item_index < 0:
		current_item_index = dialogue_items.size() -1 #end of array go to the Last index
	show_text()
