if (gmcn_test_all()) {
	room_goto(rm_gmchameleon_menu);
} else {
	layer_background_blend(layer_background_get_id(layer_get_id("Background")), c_red);
}
