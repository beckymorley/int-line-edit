@tool
extends LineEdit

var old_value : String = ""

signal value_changed(value : int)

func _enter_tree() -> void:
	text_changed.connect(_on_text_changed)
	text_submitted.connect(_on_text_submitted)

func _exit_tree() -> void:
	text_changed.disconnect(_on_text_changed)
	text_submitted.disconnect(_on_text_submitted)

func _ready() -> void:
	text = old_value

func _on_text_changed(value : String) -> void:
	if value.is_valid_int() or value == "":
		old_value = text
		return
	text = old_value
	caret_column = text.length()

func _on_text_submitted(text: String) -> void:
	value_changed.emit(text.to_int())
