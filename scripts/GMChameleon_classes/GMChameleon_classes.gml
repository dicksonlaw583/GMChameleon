///@func BaseChameleonTheme()
///@desc Base of all GMChameleon themes
function BaseChameleonTheme() constructor {
	configs = {};
	
	///@func getConfig(configKey, override)
	///@arg configKey {string} The configuration key to get
	///@arg override {struct|undefined} The overriding values
	///@desc Return the given configuration value, favouring the override's value if present as a key there
	static getConfig = function(_configKey, _override) {
		return (is_struct(_override) && variable_struct_exists(_override, _configKey)) ? _override[$ _configKey] : configs[$ _configKey];
	};
	
	///@func mergeConfigs(incoming)
	///@arg incoming {struct|undefined} The incoming additional configurations
	///@desc Merge the incoming configurations into the current theme's configurations
	static mergeConfigs = function(_incoming) {
		gmcn_options_merge(configs, _incoming);
	};
	
	/* Button triggers */
	static buttonOnCreate = __gmcn_noop__;
	static buttonOnStep = __gmcn_noop__;
	static buttonOnDraw = __gmcn_noop__;
	static buttonOnDestroy = __gmcn_noop__;
	static buttonOnHover = __gmcn_noop__;
	static buttonOnUnhover = __gmcn_noop__;
	static buttonOnClick = __gmcn_noop__;
	
	/* Checkbox triggers */
	static checkboxOnCreate = __gmcn_noop__;
	static checkboxOnStep = __gmcn_noop__;
	static checkboxOnDraw = __gmcn_noop__;
	static checkboxOnDestroy = __gmcn_noop__;
	static checkboxOnHover = __gmcn_noop__;
	static checkboxOnUnhover = __gmcn_noop__;
	static checkboxOnClick = __gmcn_noop__;
	static checkboxOnChange = __gmcn_noop__;
	
	/* Radio triggers */
	static radioOnCreate = __gmcn_noop__;
	static radioOnStep = __gmcn_noop__;
	static radioOnDraw = __gmcn_noop__;
	static radioOnDestroy = __gmcn_noop__;
	static radioOnHover = __gmcn_noop__;
	static radioOnUnhover = __gmcn_noop__;
	static radioOnClick = __gmcn_noop__;
	static radioOnChange = __gmcn_noop__;
	
	/* Text field triggers */
	static textFieldOnCreate = __gmcn_noop__;
	static textFieldOnStep = __gmcn_noop__;
	static textFieldOnDraw = __gmcn_noop__;
	static textFieldOnDestroy = __gmcn_noop__;
	static textFieldOnHover = __gmcn_noop__;
	static textFieldOnUnhover = __gmcn_noop__;
	static textFieldOnFocus = __gmcn_noop__;
	static textFieldOnUnfocus = __gmcn_noop__;
	static textFieldOnClick = __gmcn_noop__;
	static textFieldOnChange = __gmcn_noop__;
}
