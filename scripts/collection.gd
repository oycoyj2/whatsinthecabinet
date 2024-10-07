extends Control

@onready var back_button = $BackButton

func _ready():
	print("CollectionScene이 준비되었습니다.")


func _on_BackButton_pressed():
	get_tree().change_scene_to_file.bind("res://scenes/main_scene.tscn").call_deferred()
  
