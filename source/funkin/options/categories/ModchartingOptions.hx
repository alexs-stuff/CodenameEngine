package funkin.options.categories;

#if MODCHARTING_FEATURES
class ModchartingOptions extends OptionsScreen {
	public override function new() {
		super("Modcharting Options", "Customize your modcharting experience.");
		#if MODCHARTING_FEATURES
		add(new NumOption(
			"Hold Subdivitions",
			"Softens the tail/hold/sustain of the arrows by subdividing it, giving them greater quality. By higher the subdivitions number is, performance will be affected.",
			1, // minimum
			128, // maximum
			1, // change
			"hold_subs", // save name or smth
			)); // callback
		#end
	}
}
#end