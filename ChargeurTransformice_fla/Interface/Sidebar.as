package ChargeurTransformice_fla.Interface {

	import ChargeurTransformice_fla.Keys;
	import ChargeurTransformice_fla.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.system.*;
	import flash.display.*;
	import flash.ui.*;
	import coms.bit101.components.*;
	import ui.transformice.*;

	public class Sidebar extends UI_Element {

		public var Farm_Button: Sprite;
		public var Farm_Sprite: UI_Sprite;

		public var Mouse_Button: Sprite;
		public var Mouse_Sprite: UI_Sprite;

		public var Bot_Button: UI_Sprite;
		public var Misc_Button: UI_Sprite;
		public var Super_Button: UI_Sprite;
		public var Inventory_Button: UI_Sprite;
		public var Keys_Button: UI_Sprite;
		public var Settings_Button: UI_Sprite;

		public function Sidebar() {
			super(60, 240);
			this.set_prep_ui(LayoutDirection.VERTICAL);
			//this.Set_Scrollable(true,20);

			this.Farm_Button = DomainManager.getDefinition("$FromageDodue");
			this.Farm_Button.cacheAsBitmap = true;
			this.Farm_Sprite = new UI_Sprite(20, 20);
			this.Farm_Sprite.on_mouse_click(MainMenu.Change_Tab, "farm");
			this.Farm_Sprite.addChild(this.Farm_Button);
			Keys.instance.ui_manager_class[Keys.instance.on_mouse_box](this.Farm_Sprite, "Farm");

			this.Mouse_Button = DomainManager.getDefinition("AnimStatique");//
			this.Mouse_Button.cacheAsBitmap = true;
			this.Mouse_Sprite = new UI_Sprite(20, 20);
			this.Mouse_Sprite.on_mouse_click(MainMenu.Change_Tab, "general");
			this.Mouse_Sprite.addChild(this.Mouse_Button);
			Keys.instance.ui_manager_class[Keys.instance.on_mouse_box](this.Mouse_Sprite, "Mouse");

			this.Bot_Button = new UI_Image((Client.HostURL + "images/bot2.png"), 20, 20);
			this.Bot_Button.on_mouse_click(MainMenu.Change_Tab, "bot");
			Keys.instance.ui_manager_class[Keys.instance.on_mouse_box](this.Bot_Button, "Bot");

			this.Misc_Button = new UI_Image((Client.HostURL + "images/misc.png"), 20, 20);
			this.Misc_Button.on_mouse_click(MainMenu.Change_Tab, "misc");
			Keys.instance.ui_manager_class[Keys.instance.on_mouse_box](this.Misc_Button, "Misc");

			this.Super_Button = new UI_Image((Client.HostURL + "images/super.png"), 20, 20);
			this.Super_Button.on_mouse_click(MainMenu.Change_Tab, "shaman");
			Keys.instance.ui_manager_class[Keys.instance.on_mouse_box](this.Super_Button, "Shaman");

			this.Inventory_Button = new UI_Image((Client.HostURL + "images/defilante.png"), 20, 20);
			this.Inventory_Button.on_mouse_click(MainMenu.Change_Tab, "inventory");
			Keys.instance.ui_manager_class[Keys.instance.on_mouse_box](this.Inventory_Button, "Dress");

			this.Keys_Button = new UI_Image((Client.HostURL + "images/keyboard.png"), 20, 20);
			this.Keys_Button.on_mouse_click(MainMenu.Change_Tab, "keys");
			Keys.instance.ui_manager_class[Keys.instance.on_mouse_box](this.Keys_Button, "Keys");

			this.Settings_Button = new UI_Image((Client.HostURL + "api/get-image2"), 20, 20);
			this.Settings_Button.on_mouse_click(MainMenu.Change_Tab, "settings");
			Keys.instance.ui_manager_class[Keys.instance.on_mouse_box](this.Settings_Button, "Settings");


			// var y = 20;
			// var elements: Array = ["Mouse_Sprite", "Farm_Sprite", "Bot_Button", "Misc_Button", "Super_Button"]; //, "Keys_Button", "Settings_Button"
			// for (var i = 0; i < elements.length; i++) {
			// 	var name = elements[i];
			// 	var name_4 = this[name];
			// 	if (name_4) {
			// 		this.add_ui_element(name_4);
			// 		var name_2 = name.indexOf("_Sprite") != -1;
			// 		name_4.x = name_2 ? 30 : 3;
			// 		if (elements[(i - 1)]) {
			// 			var name_32 = elements[(i - 1)];
			// 			if (name_32.indexOf("_Sprite") != -1) {
			// 				y += ((name_2) ? 15 : -15);
			// 			} else if (name_32.indexOf("_Button") != -1) {
			// 				y += 18;
			// 			};
			// 		};
			// 		name_4.y = y;
			// 		y += 30;
			// 	};
			// };

			// Add elements with manual positioning
			this.add_ui_element(this.Mouse_Sprite);
			this.Mouse_Sprite.x = 30;
			this.Mouse_Sprite.y = 25;//20;

			this.add_ui_element(this.Farm_Sprite);
			this.Farm_Sprite.x = 30;
			this.Farm_Sprite.y = 70;//65;//35

			// trace(Bot_Button.width);
			// Bot_Button.width = 64;
			// Bot_Button.height = 64;
			this.add_ui_element(this.Bot_Button);
			this.Bot_Button.x = -2;//3;
			this.Bot_Button.y = 85;//80; //20
			// Bot_Button.width = 48;
			// Bot_Button.height = 48;

			this.add_ui_element(this.Misc_Button);
			this.Misc_Button.x = 3;
			this.Misc_Button.y = 142;//138;//128//68;

			this.add_ui_element(this.Super_Button);
			this.Super_Button.x = 3;
			this.Super_Button.y = 190;//186;//176//98;
		
			// var t = new Keys.instance.ui_sprite_class(20, 5);
			// this.UI[Keys.instance.add_ui_element](t);
		}

	}

}