package funkin.menus;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import funkin.backend.system.framerate.Framerate;
import funkin.editors.ui.*;
import funkin.backend.FunkinText;

class BetaWarningState extends UIState {
	var titleAlphabet:Alphabet;
	var disclaimer:FunkinText;

	var transitioning:Bool = false;

	public function new() {
		super();
	}
	public override function create() {
		super.create();

		Framerate.offset.y = 0;
		if (FlxG.state != null && FlxG.state is UIState) {
		FlxG.state.openSubState(new UIWarningSubstate("WARNING!", "This engine is still in a beta state.", [
			{
				label: "I understand",
				color: 0x59D935,
				onClick: function(_) {
					trace("clicked");
				//	FlxG.camera.stopFX(); FlxG.camera.visible = false;
				//	goToTitle();
				}
			}
		]));
	}
		titleAlphabet = new Alphabet(0, 0, "WARNING", true);
		titleAlphabet.screenCenter(X);
		add(titleAlphabet);

		disclaimer = new FunkinText(16, titleAlphabet.y + titleAlphabet.height + 10, FlxG.width - 32, "", 32);
		disclaimer.alignment = CENTER;
		disclaimer.applyMarkup('This engine is still in a *${Main.releaseCycle}* state. That means *majority of the features* are either *buggy* or *non finished*. If you find any bugs, please report them to the Codename Engine GitHub.\n\nPress ENTER to continue',
			[
				new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF4444), "*")
			]
		);
		add(disclaimer);

		var off = Std.int((FlxG.height - (disclaimer.y + disclaimer.height)) / 2);
		disclaimer.y += off;
		titleAlphabet.y += off;

		DiscordUtil.call("onMenuLoaded", ["Beta Warning"]);
	}

	public override function update(elapsed:Float) {
		super.update(elapsed);

		if (controls.ACCEPT && transitioning) {
			FlxG.camera.stopFX(); FlxG.camera.visible = false;
			goToTitle();
		}

		if (controls.ACCEPT && !transitioning) {
			transitioning = true;
			CoolUtil.playMenuSFX(CONFIRM);
			FlxG.camera.flash(FlxColor.WHITE, 1, function() {
				FlxG.camera.fade(FlxColor.BLACK, 2.5, false, goToTitle);
			});
		}
	}

	
	override function destroy() {
		super.destroy();
	}

	private function goToTitle() {
		MusicBeatState.skipTransIn = MusicBeatState.skipTransOut = true;
		FlxG.switchState(new TitleState());
	}
}