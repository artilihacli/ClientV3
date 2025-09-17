package ChargeurTransformice_fla.Interface {

	import ChargeurTransformice_fla.Keys;
	import ChargeurTransformice_fla.Interface.*;
	import ChargeurTransformice_fla.Interface.General.*;
	import flash.display.*;
	import ui.transformice.*;


	public class MainMenu extends UI_Element {

		public static var instance:MainMenu;
		
		public var sidebar:Sidebar;
		
		public var General:GeneralMenu;
		public var Farm:FarmMenu;
		public var Bot:BotMenu;
		public var Misc:MiscMenu;
		public var Shaman:ShamanMenu;
		public var KeyMenu:KeyboardMenu;
		public var Options:SettingsMenu;
		
		public var FormsContainer:UI_Element;
		
		public var SettingsSprite:*;
		public var SettingsButton:*;
		
		public function MainMenu() {
			super(430, 240);
			instance = this;
			this.set_prep_ui(LayoutDirection.HORIZONTAL, 30);
			this.x = 200;
			this.y = 105;
			this.set_box("Menu", this.Close_Menu, 11);
			
			this.sidebar = new Sidebar();
			this.FormsContainer = new UI_Element(360, 215);
			this.add_ui_element(this.sidebar, this.FormsContainer);
			this.FormsContainer.x -= 20;
			
			this.set_draggable();
			this.set_shape(62, 0, false, 240);
			
			this.General = new GeneralMenu();
			this.Farm = new FarmMenu();
			this.Bot = new BotMenu();
			this.Misc = new MiscMenu();
			this.Shaman = new ShamanMenu();
			this.KeyMenu = new KeyboardMenu();
			this.Options = new SettingsMenu();
			
			this.SettingsButton = Keys.instance.domain_manager_class[Keys.instance.get_definition]("$Menu_5");
			this.SettingsButton.cacheAsBitmap = true;
			this.SettingsSprite = new Keys.instance.ui_sprite_class(20, 20);
			this.SettingsSprite[Keys.instance.on_mouse_click](MainMenu.Change_Tab, "options");
			this.SettingsSprite.addChild(this.SettingsButton);
			Keys.instance.ui_manager_class[Keys.instance.on_mouse_box](this.SettingsSprite, "Options");
			this.addChild(SettingsSprite);
			this.SettingsSprite.x = 387;
			this.SettingsSprite.y = -30;
			
		}
	
		public function Close_Menu() : void {
			if(this.parent) {
				this.parent.removeChild(this);
			}
		}
	
		public static function Change_Tab(param1: String) {
			instance.FormsContainer.reset_ui();
			if(param1 == "general") {
				instance.FormsContainer.add_ui_element(instance.General);
			} else if(param1 == "farm") {
				instance.FormsContainer.add_ui_element(instance.Farm);
			} else if(param1 == "bot") {
				instance.FormsContainer.add_ui_element(instance.Bot);
			} else if(param1 == "misc") {
				instance.FormsContainer.add_ui_element(instance.Misc);
			} else if(param1 == "shaman") {
				instance.FormsContainer.add_ui_element(instance.Shaman);
			} else if(param1 == "keyboard") {
				instance.FormsContainer.add_ui_element(instance.KeyMenu);
			} else if(param1 == "options") {
				instance.FormsContainer.add_ui_element(instance.Options);
			}
		}
	
		public function Open_Menu() : void {
			Keys.instance.main_ui_class[Keys.instance.add_ui](this);
		}	

	}

}