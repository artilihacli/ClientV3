package ChargeurTransformice_fla.Interface.General {

	import ChargeurTransformice_fla.Keys;
	import ChargeurTransformice_fla.Interface.*;
	import flash.display.*;
	import coms.bit101.components.*;
	import flash.events.*;
	import ui.transformice.*;

	public class StandardMenu extends UI_Element {

		public function StandardMenu() {
			super(360, 185);
			this.set_prep_ui(LayoutDirection.HORIZONTAL);
			CreateLeftMenuStandart();
			CreateRightMenuStandart();
			this.add_ui_element(this.MenuStandartLeft,this.MenuStandartRight);
		}


		public var MenuStandartLeft: Sprite;
		public var CheckBoxTeleport: CheckBox;
		public var CheckBoxFakeTeleport: CheckBox;
		public var CheckBoxQuickTeleport: CheckBox;
		public var CheckBoxFly: CheckBox;
		public var CheckBoxSpFly: CheckBox;
		public var CheckBoxHideCheese: CheckBox;
		public var CheckBoxInstantWin: CheckBox;
		public var CheckBoxImmortal: CheckBox;

		public function CreateLeftMenuStandart(): void {
			MenuStandartLeft = new Sprite();
			var shape: Shape = new Shape();
			shape.graphics.drawRect(0, 0, 150, 185);
			CheckBoxTeleport = new CheckBox(MenuStandartLeft, 5, 5, "Teleport - [F]");
			CheckBoxFakeTeleport = new CheckBox(MenuStandartLeft, 5, 30, "Fake Teleport - [V]");
			CheckBoxQuickTeleport = new CheckBox(MenuStandartLeft, 5, 55, "Quick Teleport - [V]");
			CheckBoxFly = new CheckBox(MenuStandartLeft, 5, 80, "Fly - [W]");
			CheckBoxSpFly = new CheckBox(MenuStandartLeft, 5, 105, "Sp Fly - [Q]");
			CheckBoxHideCheese = new CheckBox(MenuStandartLeft, 5, 130, "Hide/Show Cheese - [H]");
			CheckBoxInstantWin = new CheckBox(MenuStandartLeft, 5, 155, "Instant Win - [X]");
			CheckBoxImmortal = new CheckBox(MenuStandartLeft, 5, 180, "Immortal Mice - [I]");
		}

		public var MenuStandartRight: Sprite;
		public var CheckBoxQuickDeath: CheckBox;
		public var CheckBoxMod: CheckBox;
		public var CheckBoxDieIfAnyoneWins: CheckBox;
		public var CheckBoxChangeRcRoomOnHotkey: CheckBox;
		public var CheckBoxNoGravity: CheckBox;
		public var CheckBoxAttractMiceToGround: CheckBox;
		public var CheckBoxCheckAntiLeve: CheckBox;
		public var CheckBoxPixelReturn: CheckBox;

		public function CreateRightMenuStandart(): void {
			MenuStandartRight = new Sprite();
			var shape: Shape = new Shape();
			shape.graphics.drawRect(150, 0, 180, 185);
			MenuStandartRight.addChild(shape);
			CheckBoxQuickDeath = new CheckBox(MenuStandartRight, 5, 5, "Quick Death(/mort) - [DEL]");
			CheckBoxMod = new CheckBox(MenuStandartRight, 5, 30, "/mod - [END]");
			CheckBoxDieIfAnyoneWins = new CheckBox(MenuStandartRight, 5, 55, "Die If Anyone Wins");
			CheckBoxChangeRcRoomOnHotkey = new CheckBox(MenuStandartRight, 5, 80, "Change Racing Room - [HOME]");
			CheckBoxNoGravity = new CheckBox(MenuStandartRight, 5, 105, "No Gravity - [G]");
			CheckBoxAttractMiceToGround = new CheckBox(MenuStandartRight, 5, 130, "Attract Mice to Ground - [J]");
			CheckBoxCheckAntiLeve = new CheckBox(MenuStandartRight, 5, 155, "Check Anti-Leve");
			CheckBoxPixelReturn = new CheckBox(MenuStandartRight, 5, 180, "Pixel Return - [P]");
		}

	}
}