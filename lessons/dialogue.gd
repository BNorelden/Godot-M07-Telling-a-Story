extends Control

@onready var next_button: Button = %NextButton
@onready var next_button_2: Button = %NextButton2

@onready var rich_text_label: RichTextLabel = %RichTextLabel

var dialogue_items: Array[String] = [
	"Roses are red",
	"Violets are blue",
	"our game developer",
	"has decided to finally",
	"get his hands dirty",
	"and get more practical",
	"because time is flying by",
	"and he has yet to create",
	"any of his games yet...",
	"tis the end of April 2026",
	"tired of waiting for shit to change",
	"years unemployed because i won't",
	"get milked by consulting scams",
	"body shops or fraud groups",
	"or play to be a kiss ass,",
	"put others under the bus",
	"so my group and I stay ahead",
	"but my pride would never let me",
	"in an ocean of sheeps",
	"surrounding this whole damn field",
	"my passion, hunger and innovation",
	"all got consumed by dogma",
	"but got to keep my head down",
	"stick to the plan",
	"because your life",
	"is your journey",
	"...make it count",
	"...no more delegating for later"
]

var current_item_index = 0


func show_text() -> void:
	var current_item := dialogue_items[current_item_index]
	rich_text_label.text = current_item
	
	#current_item = (current_item.to_int() + 1).to_string()
	
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
