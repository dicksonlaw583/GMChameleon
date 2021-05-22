///@desc Run step hooks
event_inherited();

// Only when enabled
if (enabled) {
	// Process hovering
	hover = gmcn_mouse_meeting();
	if (hover ^^ wasHover) {
		if (hover) {
			theme.radioOnHover(id);
		} else {
			theme.radioOnUnhover(id);
		}
	}
	wasHover = hover;

	// Process selection
	if (hover && device_mouse_check_button_pressed(0, mb_left)) {
		theme.radioOnClick(id);
		if (!onClick()) {
			with (obj_gmcn_radio) if (name == other.name) {
				selected = false;
			}
			selected = true;
		}
	}
}

// Track selection changes
if (wasSelected ^^ selected) {
	theme.radioOnChange(id);
	onChange(selected);
}
wasSelected = selected;

// Run step hooks
theme.radioOnStep(id);