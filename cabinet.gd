extends Sprite2D

var is_open = false

var texture_closed : Texture2D
var texture_opened : Texture2D

var total_item_probability : int = 0

var items = [
	{"name": "test_item_common_no1", "texture_path": "res://assets/items/test_item_common_no1.png", "probability": 20},
	{"name": "test_item_common_no2", "texture_path": "res://assets/items/test_item_common_no2.png", "probability": 20},
	{"name": "test_item_common_no3", "texture_path": "res://assets/items/test_item_common_no3.png", "probability": 20},
	{"name": "test_item_common_no4", "texture_path": "res://assets/items/test_item_common_no4.png", "probability": 20},
	{"name": "test_item_common_no5", "texture_path": "res://assets/items/test_item_common_no5.png", "probability": 20},
]

@export var item_drop_chance : int = 20 : set = set_item_drop_chance

@onready var item_sprite = $"../ItemSprite"

func _ready():
	texture_closed = preload("res://assets/cabinet/cabinet_closed.png")
	texture_opened = preload("res://assets/cabinet/cabinet_opened.png")
	self.texture = texture_closed
	
	var area = $CabinetArea
	area.connect("input_event", Callable(self, "_on_CabinetArea_input_event"))
	
	total_item_probability = 0
	for item in items:
		total_item_probability += item.probability
	if total_item_probability > 100:
		push_error("아이템의 총 확률이 100을 초과했습니다.")
		
	item_sprite.visible = false
	print("ItemSprite Visible:", item_sprite.visible)

func set_item_drop_chance(value):
	item_drop_chance = clamp(value, 0, 100)
	
func _on_CabinetArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			toggle_cabinet()
	elif event is InputEventScreenTouch:
		if event.pressed:
			toggle_cabinet()
			
func toggle_cabinet():
	is_open = not is_open
	if is_open:
		self.texture = texture_opened
		try_drop_item()
	else:
		self.texture = texture_closed
		item_sprite.visible = false
		
func try_drop_item():
	var random_chance = randi() % 100
	if random_chance < item_drop_chance:
		var selected_item = select_random_item()
		if selected_item != null:
			display_item(selected_item)
	else:
		print("아이템이 등장하지 않았습니다.")

func select_random_item() -> Dictionary:
	var rand = randi() % 100
	var cumulative = 0
	for item in items:
		cumulative += item.probability
		if rand < cumulative:
			return item
	return {}
	
func display_item(item: Dictionary):
	var texture = load(item.texture_path)
	item_sprite.texture = texture
	item_sprite.scale = Vector2(1, 1)
	item_sprite.visible = true
	print("아이템 획득:", item.name)
	
	
