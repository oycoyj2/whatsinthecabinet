extends CanvasLayer

# CollectionButton 노드 참조
@onready var collection_button = $CollectionButton


func _ready():
	# CollectionButton의 pressed 시그널을 함수에 연결
	collection_button.pressed.connect(Callable(self, "_on_CollectionButton_pressed"))
	print("UI 스크립트가 준비되었습니다.")

func _on_CollectionButton_pressed():
	
	# 씬 변경
	get_tree().change_scene_to_file.bind("res://scenes/collection_scene.tscn").call_deferred()
	print("CollectionButton이 눌려 컬렉션 씬으로 전환됩니다.")
