///@func gmcn_radio_group_get(name)
///@arg name {string}
///@desc Return the selected value from the group
function gmcn_radio_group_get(_name) {
	with (obj_gmcn_radio) {
		if (selected && name == _name) {
			return value;
		}
	}
	return undefined;
}

///@func gmcn_radio_group_set(name, value)
///@arg values {struct}
///@desc Select the given value in the group (skips if not mentioned)
function gmcn_radio_group_set(_name, _value) {
	with (obj_gmcn_radio) {
		if (name == _name) {
			selected = value == _value;
		}
	}
}
