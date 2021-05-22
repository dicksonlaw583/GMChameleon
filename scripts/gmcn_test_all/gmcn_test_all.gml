///@func gmcn_test_all()
function gmcn_test_all() {
	global.__test_fails__ = 0;
	var timeA, timeB;
	timeA = current_time;
	
	/* v Tests here v */
	gmcn_test_utilities();
	gmcn_test_classes();
	/* ^ Tests here ^ */
	
	timeB = current_time;
	show_debug_message("GMChameleon tests done in " + string(timeB-timeA) + "ms.");
	return global.__test_fails__ == 0;
}
