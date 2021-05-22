///@func gmcn_test_classes()
function gmcn_test_classes() {
	var fixture;
	
	// BaseChameleonTheme.getConfig(configKey, override)
	fixture = new BaseChameleonTheme();
	fixture.configs.foo = "bar";
	assert_equal(fixture.getConfig("foo"), "bar", "BaseChameleonTheme.getConfig failed simple");
	assert_equal(fixture.getConfig("foo", { foo: "baz" }), "baz", "BaseChameleonTheme.getConfig failed override 1");
	assert_equal(fixture.getConfig("foo", { goo: "baz" }), "bar", "BaseChameleonTheme.getConfig failed override 2");
	
	// BaseChameleonTheme.mergeConfigs(incoming)
	fixture = new BaseChameleonTheme();
	fixture.configs.foo = "FOO";
	fixture.configs.bar = "BAR";
	fixture.mergeConfigs(undefined);
	assert_equal(fixture.configs, { foo: "FOO", bar: "BAR" }, "BaseChameleonTheme.mergeConfigs failed undefined");
	fixture.mergeConfigs({ bar: "B A R", baz: "BAZ" });
	assert_equal(fixture.configs, { foo: "FOO", bar: "B A R", baz: "BAZ" }, "BaseChameleonTheme.mergeConfigs failed extension");
}
