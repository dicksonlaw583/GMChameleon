///@desc Run step hooks
event_inherited();

// Only when enabled
if (enabled) {
	// Process hovering
	hover = gmcn_mouse_meeting();
	if (hover ^^ wasHover) {
		if (hover) {
			theme.textFieldOnHover(id);
		} else {
			theme.textFieldOnUnhover(id);
		}
	}
	wasHover = hover;

	// Process selection
	if (device_mouse_check_button_pressed(0, mb_left)) {
		if (hover) {
			theme.textFieldOnClick(id);
			if (!onClick()) {
				focused = true;
			}
		} else {
			focused = false;
		}
	}
	
	// Process focusing
	if (focused ^^ wasFocused) {
		if (focused) {
			keyboard_string = value;
			theme.textFieldOnFocus(id);
			keyboard_virtual_show(kbv_type_default, kbv_returnkey_default, kbv_autocapitalize_none, false);
		} else {
			theme.textFieldOnUnfocus(id);
			keyboard_virtual_hide();
		}
	}
	wasFocused = focused;
	
	// If focused, process keyboard input
	if (focused) {
		value = keyboard_string;
		theme.textFieldOnChange(id);
		if (onChange()) {
			value = previousValue;
		}
		previousValue = value;
	}
} else {
	focused = false;
	wasFocused = false;
}

// Run step hook
theme.textFieldOnStep(id);
