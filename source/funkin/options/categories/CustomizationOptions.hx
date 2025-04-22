package funkin.options.categories;

class CustomizationOptions extends OptionsScreen {

	public override function new() {
		super("Engine Customization", "Change Engine Customization options such as Icon Bops...");
		add(new Checkbox(
			"Directional Camera",
			"If checked, the camera moves based on the note direction.",
			"directionalCamera"));
		add(new Checkbox(
			"Colored Healthbar",
			"If unchecked, the game will use the orginal red/green health bar from the week 6 fnf game.",
			"colorHealthBar"));
	}

}