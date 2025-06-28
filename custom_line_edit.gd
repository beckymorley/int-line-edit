@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("IntLineEdit", "LineEdit", preload("int_line_edit.gd"), preload("icon.svg"))


func _exit_tree() -> void:
	remove_custom_type("IntLineEdit")
