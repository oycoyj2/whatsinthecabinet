extends Control

@onready var grid_container = $ScrollContainer/GridContainer
@onready var back_button = $BackButton

func _ready():
	display_collected_items()
	print("CollectionScene이 준비되었습니다.")

func display_collected_items():
	var items = CollectionManager.get_collected_items()
	print("수집된 아이템 수:", items.size())
	for item in items:
		var texture_button = TextureButton.new()
		var texture = load(item.texture_path)
		if texture:
			texture_button.texture_normal = texture
			texture_button.texture_hover = texture
			texture_button.texture_pressed = texture
		else:
			print("Error: 아이템 텍스처를 로드할 수 없습니다:", item.texture_path)
			continue  # 텍스처 로드 실패 시 해당 아이템을 건너뜁니다.

		# 버튼 크기 및 설정 조정
		texture_button.size = Vector2(2, 2) # 원하는 크기로 조정
		texture_button.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED

		# 아이템 클릭 시 동작을 정의할 수 있습니다 (예: 상세보기)

		# GridContainer에 버튼 추가
		grid_container.add_child(texture_button)
		print("컬렉션에 아이템 추가:", item.name)

func _on_ItemButton_pressed(item: Dictionary):
	# 아이템을 클릭했을 때의 동작을 정의합니다.
	# 예를 들어, 아이템의 상세 정보를 표시하는 팝업을 열 수 있습니다.
	print("아이템 클릭됨:", item.name)
	# 추가적인 UI 요소를 통해 상세 정보를 표시할 수 있습니다.
	# 예: 상세 정보 팝업 열기
	# var popup = preload("res://scenes/ItemDetailPopup.tscn").instantiate()
	# add_child(popup)
	# popup.show_item_details(item)

func _on_BackButton_pressed():
	get_tree().change_scene_to_file.bind("res://scenes/main_scene.tscn").call_deferred()
  
