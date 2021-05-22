///@func gmcn_checkbox_group_get(name)
///@arg name {string}
///@desc Return a struct of values and whether they are checked
function gmcn_checkbox_group_get(_name) {
	var results = {};
	with (obj_gmcn_checkbox) {
		if (name == _name) {
			results[$ value] = selected;
		}
	}
	return results;
}

///@func gmcn_checkbox_group_set(name, values)
///@arg values {struct}
///@desc Set the given values for the checkbox group (unmentioned values are untouched)
function gmcn_checkbox_group_set(_name, _values) {
	var ks = variable_struct_get_names(_values);
	for (var i = array_length(ks)-1; i >= 0; --i) {
		var k = ks[i];
		with (obj_gmcn_checkbox) {
			if (name == _name && value == k) {
				selected = _values[$ k];
				break;
			}
		}
	}
}
