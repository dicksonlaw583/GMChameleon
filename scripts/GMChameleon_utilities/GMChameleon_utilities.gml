///@func gmcn_options_merge(source, incoming)
///@arg {struct} source The current struct
///@arg {struct} incoming The incoming struct with overriding properties
///@desc Merge the incoming struct into the source, and return the source
function gmcn_options_merge(_source, _incoming) {
	if (is_struct(_incoming)) {
		var incomingKeys = variable_struct_get_names(_incoming);
		for (var i = array_length(incomingKeys)-1; i >= 0; --i) {
			var incomingKey = incomingKeys[i];
			var incomingValue = _incoming[$ incomingKey];
			if (variable_struct_exists(_source, incomingKey) && is_struct(_source[$ incomingKey])) {
				gmcn_options_merge(_source[$ incomingKey], incomingValue);
			} else {
				_source[$ incomingKey] = incomingValue;
			}
		}
	}
	return _source;
}

///@func gmcn_draw_reset()
///@desc Convenient drawing reset
function gmcn_draw_reset() {
	gml_pragma("forceinline");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
}

///@func gmcn_draw_set_align(halign, valign)
///@arg halign
///@arg valign
///@desc Convenient combo for horizontal and vertical text align
function gmcn_draw_set_align(_halign, _valign) {
	gml_pragma("forceinline");
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}

///@func gmcn_choose_3state(hover, enabled, hoverActiveChoice, hoverInactiveChoice, disabledChoice)
///@arg hover {bool}
///@arg enabled {bool}
///@arg hoverActiveChoice
///@arg hoverInactiveChoice
///@arg disabledChoice
///@desc Return the correct option given the hover and enabled states
function gmcn_choose_3state(_hover, _enabled, _hoverActiveChoice, _hoverInactiveChoice, _disabledChoice) {
	gml_pragma("forceinline");
	return _enabled ? (_hover ? _hoverActiveChoice : _hoverInactiveChoice) : _disabledChoice;
}

///@func gmcn_mouse_x()
function gmcn_mouse_x() {
	gml_pragma("forceinline");
	return viewDependent ? device_mouse_x(0) : device_mouse_x_to_gui(0);
}

///@func gmcn_mouse_y()
function gmcn_mouse_y() {
	gml_pragma("forceinline");
	return viewDependent ? device_mouse_y(0) : device_mouse_y_to_gui(0);
}

///@func gmcn_mouse_meeting(<subject>)
///@arg <subject> (Optional) The instance or object to check mouse collisions against
function gmcn_mouse_meeting() {
	return position_meeting(gmcn_mouse_x(), gmcn_mouse_y(), (argument_count == 0) ? id : argument[0]);
}

///@func __gmcn_noop__
function __gmcn_noop__() {}
