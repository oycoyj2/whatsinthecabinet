extends Node

# 수집된 아이템을 저장할 배열
var collected_items = []

# 아이템을 추가하는 함수
func add_item(item: Dictionary):
	collected_items.append(item)
	print("아이템이 컬렉션에 추가되었습니다:", item.name)

# 모든 수집된 아이템을 반환하는 함수
func get_collected_items() -> Array:
	return collected_items
