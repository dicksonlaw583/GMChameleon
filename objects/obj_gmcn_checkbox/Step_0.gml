///@desc Run step hooks
event_inherited();

// Only when enabled
if (enabled) {
	// Process hovering
	hover = gmcn_mouse_meeting();
	if (hover ^^ wasHover) {
		if (hover) {
			theme.checkboxOnHover(id);
		} else {
			theme.checkboxOnUnhover(id);
		}
	}
	wasHover = hover;

	// Process selection
	if (hover && device_mouse_check_button_pressed(0, mb_left)) {
		theme.checkboxOnClick(id);
		if (!onClick()) {
			selected = !selected;
		}
	}
}

// Track selection changes
if (wasSelected ^^ selected) {
	theme.checkboxOnChange(id);
	onChange(selected);
}
wasSelected = selected;

// Run step hooks
theme.checkboxOnStep(id);