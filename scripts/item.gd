extends Resource

class_name Item

# 아이템의 이름
@export var name: String = ""

# 아이템의 텍스처 경로
@export var texture_path: String = ""

# 아이템 드랍 확률 (퍼센트)
@export var probability: int = 0

# 아이템의 설명 (추가적인 속성이 필요할 경우 확장 가능)
@export var description: String = ""

# 아이템의 텍스처를 로드하는 함수
func get_texture() -> Texture2D:
	return load(texture_path)
