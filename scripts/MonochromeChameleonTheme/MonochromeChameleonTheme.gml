///@func MonochromeChameleonTheme(foreground, background, foregroundHighlight, backgroundHighlight, foregroundDisabled, backgroundDisabled)
///@arg foreground {colour}
///@arg background {colour}
///@arg foregroundHighlight {colour}
///@arg backgroundHighlight {colour}
///@arg foregroundDisabled {colour}
///@arg backgroundDisabled {colour}
///@desc A very basic theme based on 6 colours
function MonochromeChameleonTheme(_foreground, _background, _foregroundHighlight, _backgroundHighlight, _foregroundDisabled, _backgroundDisabled) : BaseChameleonTheme() constructor {
	mergeConfigs({
		foreground: _foreground,
		background: _background,
		foregroundHighlight: _foregroundHighlight,
		backgroundHighlight: _backgroundHighlight,
		foregroundDisabled: _foregroundDisabled,
		backgroundDisabled: _backgroundDisabled,
		font: fnt_monochrome_chameleon,
	});
	
	static buttonOnCreate = function(_id) { with (_id) {
		textFont = other.getConfig("font", themeOverride);
		textColour = other.getConfig("foreground", themeOverride);
		backColour = other.getConfig("background", themeOverride);
		textColourHighlight = other.getConfig("foregroundHighlight", themeOverride);
		backColourHighlight = other.getConfig("backgroundHighlight", themeOverride);
		textColourDisabled = other.getConfig("foregroundDisabled", themeOverride);
		backColourDisabled = other.getConfig("backgroundDisabled", themeOverride);
	}};
	
	static buttonOnDraw = function(_id) { with (_id) {
		gmcn_draw_set_align(fa_center, fa_middle);
		draw_set_colour(gmcn_choose_3state(hover, enabled, backColourHighlight, backColour, backColourDisabled));
		draw_roundrect(x, y, x+sprite_width, y+sprite_height, false);
		draw_set_colour(gmcn_choose_3state(hover, enabled, textColourHighlight, textColour, textColourDisabled));
		draw_set_font(textFont);
		draw_text(x+sprite_width/2, y+sprite_height/2, label);
		gmcn_draw_reset();
	}};
	
	static checkboxOnCreate = function(_id) { with (_id) {
		textFont = other.getConfig("font", themeOverride);
		textColour = other.getConfig("foreground", themeOverride);
		boxColour = other.getConfig("background", themeOverride);
		textColourHighlight = other.getConfig("foregroundHighlight", themeOverride);
		boxColourHighlight = other.getConfig("backgroundHighlight", themeOverride);
		textColourDisabled = other.getConfig("foregroundDisabled", themeOverride);
		boxColourDisabled = other.getConfig("backgroundDisabled", themeOverride);
	}};
	
	static checkboxOnDraw = function(_id) { with (_id) {
		gmcn_draw_set_align(fa_left, fa_middle);
		draw_set_colour(gmcn_choose_3state(hover, enabled, boxColourHighlight, boxColour, boxColourDisabled));
		draw_rectangle(x, y, x+sprite_width, y+sprite_height, false);
		draw_set_font(textFont);
		draw_text(x+sprite_width, y+sprite_height/2, " " + label);
		if (selected) {
			draw_set_colour(gmcn_choose_3state(hover, enabled, textColourHighlight, textColour, textColourDisabled));
			draw_line_width(x, y, x+sprite_width, y+sprite_height, sprite_width/16);
			draw_line_width(x, y+sprite_height, x+sprite_width, y, sprite_width/16);
		}
		gmcn_draw_reset();
	}};
}
