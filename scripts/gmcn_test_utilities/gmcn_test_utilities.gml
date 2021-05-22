///@func gmcn_test_utilities()
function gmcn_test_utilities() {
	var expected, actual;
	
	// gmcn_options_merge(source, incoming)
	expected = { a: 3, b: "foo", c: "bar", d: { e: "baz", f: "qux", g: "waahoo" } };
	actual = { a: 2, c: "bar", d: { e: "BAZ", f: "qux" } };
	assert_is(gmcn_options_merge(actual, { a: 3, b: "foo", d: { e: "baz", g: "waahoo" } }), actual, "gmcn_options_merge failed identity");
	assert_equal(actual, expected, "gmcn_options_merge failed content");
}
