///@desc Run step hooks
event_inherited();

// Only when enabled
if (enabled) {
	// Process hovering
	hover = gmcn_mouse_meeting();
	if (hover ^^ wasHover) {
		if (hover) {
			theme.buttonOnHover(id);
		} else {
			theme.buttonOnUnhover(id);
		}
	}
	theme.buttonOnStep(id);
	wasHover = hover;

	// Process selection
	if (hover && device_mouse_check_button_pressed(0, mb_left)) {
		theme.buttonOnClick(id);
		onClick();
	}
}
