///@desc Handle virtual keyboard status
if (async_load[? "event_type"] == "virtual keyboard status") {
	switch (async_load[? "keyboard_status"]) {
		case "hidden":
			focused = false;
		break;
		case "visible":
			// TODO: Handle in better detail
		break;
	}
}
