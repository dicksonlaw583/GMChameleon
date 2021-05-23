///@desc Run draw hook if view-independent
if (!viewDependent) {
	if (!surface_exists(textSurface)) {
		textSurface = surface_create(sprite_width, sprite_height);
	}
	theme.textFieldOnDraw(id);
}
