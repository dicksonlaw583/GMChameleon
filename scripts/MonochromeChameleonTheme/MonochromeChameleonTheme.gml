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
	
	static radioOnCreate = function(_id) { with (_id) {
		textFont = other.getConfig("font", themeOverride);
		textColour = other.getConfig("foreground", themeOverride);
		boxColour = other.getConfig("background", themeOverride);
		textColourHighlight = other.getConfig("foregroundHighlight", themeOverride);
		boxColourHighlight = other.getConfig("backgroundHighlight", themeOverride);
		textColourDisabled = other.getConfig("foregroundDisabled", themeOverride);
		boxColourDisabled = other.getConfig("backgroundDisabled", themeOverride);
	}};
	
	static radioOnDraw = function(_id) { with (_id) {
		gmcn_draw_set_align(fa_left, fa_middle);
		draw_set_colour(gmcn_choose_3state(hover, enabled, boxColourHighlight, boxColour, boxColourDisabled));
		draw_ellipse(x, y, x+sprite_width, y+sprite_height, false);
		draw_set_font(textFont);
		draw_text(x+sprite_width, y+sprite_height/2, " " + label);
		if (selected) {
			draw_set_colour(gmcn_choose_3state(hover, enabled, textColourHighlight, textColour, textColourDisabled));
			draw_ellipse(x+sprite_width*0.2, y+sprite_height*0.2, x+sprite_width*0.8, y+sprite_height*0.8, false);
		}
		gmcn_draw_reset();
	}};

	static textFieldOnCreate = function(_id) { with (_id) {
		textFont = other.getConfig("font", themeOverride);
		textColour = other.getConfig("foreground", themeOverride);
		backColour = other.getConfig("background", themeOverride);
		backColourHighlight = other.getConfig("backgroundHighlight", themeOverride);
		textColourDisabled = other.getConfig("foregroundDisabled", themeOverride);
		backColourDisabled = other.getConfig("backgroundDisabled", themeOverride);
	}};
	
	static textFieldOnDraw = function(_id) { with (_id) {
		draw_set_colour(gmcn_choose_3state(hover || focused, enabled, backColourHighlight, backColour, backColourDisabled));
		draw_rectangle(x, y, x+sprite_width, y+sprite_height, false);
		draw_set_colour(gmcn_choose_3state(hover || focused, enabled, textColour, textColour, textColourDisabled));
		draw_set_font(textFont);
		var stringWidth = string_width(value);
		var caretWidth = string_width("|");
		surface_set_target(textSurface);
		draw_clear_alpha(c_black, 0);
		if (stringWidth+caretWidth > sprite_width) {
			gmcn_draw_set_align(fa_right, fa_middle);
			draw_text(sprite_width, sprite_height/2, (focused && current_time mod 500 < 250) ? "|" : "");
			draw_text(sprite_width-caretWidth, sprite_height/2, value);
		} else {
			gmcn_draw_set_align(fa_left, fa_middle);
			draw_text(0, sprite_height/2, value + ((focused && current_time mod 500 < 250) ? "|" : ""));
		}
		surface_reset_target();
		draw_surface(textSurface, x, y);
		gmcn_draw_reset();
	}};
}
