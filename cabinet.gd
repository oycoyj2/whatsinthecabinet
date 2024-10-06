extends Sprite2D

# 상태를 저장할 변수
var is_open = false

# 두 가지 텍스처 로드
var texture_closed : Texture2D
var texture_opened : Texture2D

func _ready():
	# 텍스처 초기화
	texture_closed = preload("res://assets/cabinet/cabinet_closed.png")
	texture_opened = preload("res://assets/cabinet/cabinet_opened.png")
	# 초기 텍스처 설정
	self.texture = texture_closed

	# Area2D 노드 가져오기
	var area = $CabinetArea
	# 입력 이벤트 연결 (Godot 4 방식)
	area.connect("input_event", Callable(self, "_on_CabinetArea_input_event"))

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
	else:
		self.texture = texture_closed
