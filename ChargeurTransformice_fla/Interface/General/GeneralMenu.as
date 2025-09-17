package ChargeurTransformice_fla.Interface.General {

	import ChargeurTransformice_fla.Keys;
	import ChargeurTransformice_fla.Interface.*;
	import flash.display.*;
	import coms.bit101.components.*;
	import flash.events.*;
	import ui.transformice.*;

	public class GeneralMenu extends UI_Element {

		public var StandardPage:UI_Element;
		public var MenuStandard:StandardMenu;
		public var MenuGenetic:GeneticMenu;
		public var MenuMapSettings:MapSettingsMenu;
		
		public var Header: Sprite;
		public var ButtonStandard: PushButton;
		public var ButtonGenetic: PushButton;
		public var ButtonMapSettings: PushButton;

		public function GeneralMenu() {
			super(360, 215);
			this.set_prep_ui(LayoutDirection.VERTICAL);
			
			this.StandardPage = new UI_Element(360, 185);
			this.StandardPage.set_prep_ui(LayoutDirection.HORIZONTAL);
			this.MenuStandard = new StandardMenu();
			this.MenuGenetic = new GeneticMenu();
			this.MenuMapSettings = new MapSettingsMenu();

			CreateHeader();
			this.set_shape(0, 30, true, 360);
			this.StandardPage.add_ui_element(this.MenuStandard);
			this.add_ui_element(this.Header, this.StandardPage);
		}

		public function CreateHeader(): void {
			Header = new Sprite();
			var shape: Shape = new Shape();
			shape.graphics.drawRect(0, 0, 308, 30);
			Header.addChild(shape);
			ButtonStandard = new PushButton(Header, 5, 0, "Standard", this.HandleButtonStandard);
			ButtonGenetic = new PushButton(Header, 110, 0, "Genetic", this.HandleButtonGenetic);
			ButtonMapSettings = new PushButton(Header, 215, 0, "Map Settings", this.HandleButtonMapSettings);
		}

		public function HandleButtonStandard(param1: Event): void {
			ButtonStandard.basili2 = true;
			ButtonGenetic.basili2 = false;
			ButtonMapSettings.basili2 = false;
			this.StandardPage.reset_ui();
			this.StandardPage.add_ui_element(this.MenuStandard);
		}

		public function HandleButtonGenetic(param1: Event): void {
			ButtonStandard.basili2 = false;
			ButtonGenetic.basili2 = true;
			ButtonMapSettings.basili2 = false;
			this.StandardPage.reset_ui();
			this.StandardPage.add_ui_element(this.MenuGenetic);
		}

		public function HandleButtonMapSettings(param1: Event): void {
			ButtonStandard.basili2 = false;
			ButtonGenetic.basili2 = false;
			ButtonMapSettings.basili2 = true;
			this.StandardPage.reset_ui();
			this.StandardPage.add_ui_element(this.MenuMapSettings);
		}

	}
}