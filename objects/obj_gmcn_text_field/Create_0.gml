///@desc Setup
event_inherited();
theme.textFieldOnCreate(id);
hover = false;
wasHover = false;
focused = false;
wasFocused = false;
previousValue = value;
textSurface = surface_create(sprite_width, sprite_height);
