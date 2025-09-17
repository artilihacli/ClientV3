package ChargeurTransformice_fla.Interface {

	import ChargeurTransformice_fla.Keys;
	import ChargeurTransformice_fla.Interface.*;
	import flash.display.*;
	import ui.transformice.*;
	
	public class ShamanMenu extends UI_Element {
		
		public static const left_width:int = 200;
		public static const right_width:int = 200;
		public var shamanContainer:UI_Element;

		public var shamanLabelContainer:UI_Element;
		public var shamanLabel:UI_TextField;
		public var sectionDivider:UI_Element;
		public var superDivider:UI_Element;

		public var superLabel:UI_TextField;
		public var superMenu:SuperMenu;

		public function ShamanMenu() {
			super(360, 235);
			this.set_prep_ui(LayoutDirection.VERTICAL);
			this.set_scrollable(true);

			superDivider = new UI_Element(_width, 0);
			superLabel = new UI_TextField("Super Items", 0);
			superDivider.add_ui_element(superLabel);
			superLabel.x = (superDivider._width - superLabel.width)/2 - 10;
			superDivider.set_shape(0, superDivider._height, true, _width - 5);

			superMenu = new SuperMenu();

			shamanLabelContainer = new UI_Element(_width, 25);
			shamanLabel = new UI_TextField("Shaman Hacks", 0);
			shamanLabelContainer.add_ui_element(shamanLabel);
			shamanLabel.x = (shamanLabelContainer._width - shamanLabel.width)/2 - 10;
			shamanLabel.y = shamanLabelContainer._height - shamanLabel.height;
			shamanLabelContainer.set_shape(0, 0, true, _width - 5);

			sectionDivider = new UI_Element(0, 10);
			sectionDivider.set_shape(0, 5, true, _width - 5);

			shamanContainer = new UI_Element(0, 0);
			CreateLeftMenu();
			CreateRightMenu();
			shamanContainer.add_ui_element(leftMenu, rightMenu);
	

			
			this.add_ui_element(superDivider, superMenu, shamanLabelContainer, sectionDivider, shamanContainer);
			superMenu.x -= 15;
		}




		public var leftMenu:UI_Element;
		public var rocketMouseCheckBox:UI_CheckBox;
		public var fastBalloonCheckBox:UI_CheckBox;
		public var fastCreateCheckBox:UI_CheckBox;
		public var wingsCheckBox:UI_CheckBox;
		public var shaMeowCheckBox:UI_CheckBox;

		public function CreateLeftMenu(): void {
			leftMenu = new UI_Element(left_width, _height);
			leftMenu.set_prep_ui(LayoutDirection.VERTICAL);

			rocketMouseCheckBox = new UI_CheckBox("Rocket Mouse", left_width - 20);
			rocketMouseCheckBox.check_box_callback(this.onRocketMouseChecked, null, false);

			fastBalloonCheckBox = new UI_CheckBox("Fast Balloon", left_width - 20);
			fastBalloonCheckBox.check_box_callback(this.onFastBalloonChecked, null, false);

			fastCreateCheckBox = new UI_CheckBox("Fast Create", left_width - 20);
			fastCreateCheckBox.check_box_callback(this.onFastCreateChecked, null, false);

			wingsCheckBox = new UI_CheckBox("Wings", left_width - 20);
			wingsCheckBox.check_box_callback(this.onWingsChecked, null, false);

			shaMeowCheckBox = new UI_CheckBox("Sha Meow", left_width - 20);
			shaMeowCheckBox.check_box_callback(this.onShaMeowChecked, null, false);

			leftMenu.add_ui_element(rocketMouseCheckBox, fastBalloonCheckBox, fastCreateCheckBox, wingsCheckBox, shaMeowCheckBox);
		}


		public var rightMenu:UI_Element;
		public var divineCheckBox:UI_CheckBox;
		public var conjurationCheckBox:UI_CheckBox;
		public var portalCheckBox:UI_CheckBox;
		public var hideSurvivorCheckBox:UI_CheckBox;
		public var killAllMiceButton:UI_Button;

		public function CreateRightMenu(): void {
			rightMenu = new UI_Element(right_width, _height);
			rightMenu.set_prep_ui(LayoutDirection.VERTICAL);

			divineCheckBox = new UI_CheckBox("Divine", right_width - 20);
			divineCheckBox.check_box_callback(this.onDivineChecked, null, false);

			conjurationCheckBox = new UI_CheckBox("Conjuration", right_width - 20);
			conjurationCheckBox.check_box_callback(this.onConjurationChecked, null, false);

			portalCheckBox = new UI_CheckBox("Portal", right_width - 20);
			portalCheckBox.check_box_callback(this.onPortalChecked, null, false);

			hideSurvivorCheckBox = new UI_CheckBox("Hide Survivor", right_width - 20);
			hideSurvivorCheckBox.check_box_callback(this.onHideSurvivorChecked, null, false);

			killAllMiceButton = new UI_Button("Kill All Mice", 70, this.onKillAllMiceClicked);

			rightMenu.add_ui_element(divineCheckBox, conjurationCheckBox, portalCheckBox, hideSurvivorCheckBox, killAllMiceButton);
		}

		public function onRocketMouseChecked(): void {
			trace("Rocket Mouse checked: " + rocketMouseCheckBox.getChecked());
		}

		public function onFastBalloonChecked(): void {
			trace("Fast Balloon checked: " + fastBalloonCheckBox.getChecked());
		}

		public function onFastCreateChecked(): void {
			trace("Fast Create checked: " + fastCreateCheckBox.getChecked());
		}

		public function onWingsChecked(): void {
			trace("Wings checked: " + wingsCheckBox.getChecked());
		}

		public function onShaMeowChecked(): void {
			trace("Sha Meow checked: " + shaMeowCheckBox.getChecked());
		}

		public function onDivineChecked(): void {
			trace("Divine checked: " + divineCheckBox.getChecked());
		}

		public function onConjurationChecked(): void {
			trace("Conjuration checked: " + conjurationCheckBox.getChecked());
		}

		public function onPortalChecked(): void {
			trace("Portal checked: " + portalCheckBox.getChecked());
		}

		public function onHideSurvivorChecked(): void {
			trace("Hide Survivor checked: " + hideSurvivorCheckBox.getChecked());
		}

		public function onKillAllMiceClicked(): void {
			trace("Kill All Mice button clicked");
		}

	
	}

}