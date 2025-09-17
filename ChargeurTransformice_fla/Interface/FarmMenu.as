package ChargeurTransformice_fla.Interface {

	import ChargeurTransformice_fla.Keys;
	import ChargeurTransformice_fla.Interface.*;
	import flash.display.*;
	import ui.transformice.*;
	import flash.events.*;
	import ui.custom.*;
	
	public class FarmMenu extends UI_Element {
		
		public function FarmMenu() {
			super(360, 215);
			//this.set_scrollable(true);

			createFarmMenu();
			createRulesMenu();
			this.add_ui_element(farmMenu);
			this.add_ui_element(rulesMenu);
		}
	

		public var farmMenu:UI_Element;
		public var farmButton:UI_Button;

		public var infoContainer:UI_Element;
		public var winsLabel:UI_TextField;
		public var roundsLabel:UI_TextField;

		public var upperDivider:UI_Element;
		public var lowerDivider:UI_Element;

		public var autoWinContainer:UI_Element;
		public var autoWinCheckBoxContainer:UI_Element;
		public var autoWinCheckBox:UI_CheckButton;
		public var autoWinTimeLabel:UI_TextField;
		public var autoWinTimeInput:UI_Input;
		
		public var autoMortContainer:UI_Element;
		public var autoMortCheckBoxContainer:UI_Element;
		public var autoMortCheckBox:UI_CheckButton;
		public var autoMortTimeLabel:UI_TextField;
		public var autoMortTimeInput:UI_Input;

		public var autoWinShamanMortCheckBox:UI_CheckButton;
		public var autoMortShamanWinCheckBox:UI_CheckButton;	

		public var autoMoveContainer:UI_Element;
		public var autoMoveCheckBox:UI_CheckBox;
		public var autoMoveTimeLabel:UI_TextField;
		public var autoMoveTimeInput:UI_Input;
		public var collectGiftsCheckBox:UI_CheckBox;

		public var shamanLoyaltyContainer:UI_Element;
		public var shamanLoyaltyCheckBox:UI_CheckBox;
		public var shamanLoyaltyInput:UI_Input;

		public function createFarmMenu(): void {
			farmMenu = new UI_Element(196, 0);
			farmMenu.set_prep_ui(LayoutDirection.VERTICAL);

			farmButton = new UI_Button("Start Farm", 100, this.onFarmButtonClicked);

			infoContainer = new UI_Element(0, 20);
			winsLabel = new UI_TextField("Wins: 0", 96);
			roundsLabel = new UI_TextField("Rounds: 0", 96);
			infoContainer.add_ui_element(winsLabel, roundsLabel);
			infoContainer.set_shape(90, 0, false, 20);


			upperDivider = new UI_Element(192, 10);
			upperDivider.set_shape(0, 5, true, 185);


			autoWinContainer = new UI_Element(0, 24);
			autoWinCheckBoxContainer = new UI_Element(90, 0);
			autoWinCheckBox = new UI_CheckButton(this.onAutoWinChecked, null);
			autoWinCheckBox.textField.text = "Auto Win";
			autoWinCheckBoxContainer.add_ui_element(autoWinCheckBox);
			autoWinTimeLabel = new UI_TextField(" Time:", 0);
			autoWinTimeInput = new UI_Input(50);
			autoWinTimeInput.setPlaceholder("5000", false);
			autoWinTimeInput.textField.restrict = "0-9";
			autoWinTimeInput.setChangeHandler(this.onAutoWinTimeChange, null, true);
			autoWinContainer.set_shape(90, 0, false, 20);
			autoWinContainer.add_ui_element(autoWinCheckBoxContainer, autoWinTimeLabel, autoWinTimeInput);
	
			autoMortContainer = new UI_Element(0, 24);
			autoMortCheckBoxContainer = new UI_Element(90, 0);
			autoMortCheckBox = new UI_CheckButton(this.onAutoMortChecked, null);
			autoMortCheckBox.textField.text = "Auto Mort";	
			autoMortCheckBoxContainer.add_ui_element(autoMortCheckBox);
			autoMortTimeLabel = new UI_TextField(" Time:", 0);
			autoMortTimeInput = new UI_Input(50);
			autoMortTimeInput.setPlaceholder("1000", false);
			autoMortTimeInput.textField.restrict = "0-9";
			autoMortTimeInput.setChangeHandler(this.onAutoMortTimeChange, null, true);
			autoMortContainer.set_shape(90, 0, false, 20);
			autoMortContainer.add_ui_element(autoMortCheckBoxContainer, autoMortTimeLabel, autoMortTimeInput);

			autoWinShamanMortCheckBox = new UI_CheckButton(this.onAutoWinShamanMortChecked, null);
			autoWinShamanMortCheckBox.textField.text = "Auto Win + Shaman Mort";
			autoMortShamanWinCheckBox = new UI_CheckButton(this.onAutoMortShamanWinChecked, null);
			autoMortShamanWinCheckBox.textField.text = "Auto Mort + Shaman Win";

			lowerDivider = new UI_Element(192, 10);
			lowerDivider.set_shape(0, 5, true, 185);

			autoMoveContainer = new UI_Element(0, 20);
			autoMoveCheckBox = new UI_CheckBox("Auto Move", 90);
			autoMoveCheckBox.check_box_callback(this.onAutoMoveChecked, null, false);
			autoMoveTimeLabel = new UI_TextField(" Time:", 0);
			autoMoveTimeInput = new UI_Input(50);
			autoMoveTimeInput.setPlaceholder("3000",false);
			autoMoveTimeInput.textField.restrict = "0-9";
			autoMoveTimeInput.setChangeHandler(this.onAutoMoveTimeChange, null, true);
			autoMoveContainer.add_ui_element(autoMoveCheckBox, autoMoveTimeLabel, autoMoveTimeInput);
			autoMoveContainer.set_shape(90, 0, false, 20);

			collectGiftsCheckBox = new UI_CheckBox("Collect Gifts", 0);
			collectGiftsCheckBox.check_box_callback(this.onCollectGiftsChecked, null, false);

			shamanLoyaltyContainer = new UI_Element(0, 24);
			shamanLoyaltyCheckBox = new UI_CheckBox("Shaman Loyalty", 0);
			shamanLoyaltyCheckBox.check_box_callback(this.onShamanLoyaltyChange, null, false);
			shamanLoyaltyInput = new UI_Input(60);
			shamanLoyaltyContainer.add_ui_element(shamanLoyaltyCheckBox, shamanLoyaltyInput);

			farmMenu.add_ui_element(farmButton, infoContainer, upperDivider, autoWinContainer, autoMortContainer, autoWinShamanMortCheckBox, autoMortShamanWinCheckBox, lowerDivider, autoMoveContainer, collectGiftsCheckBox, shamanLoyaltyContainer);
			farmButton.x += 45;
			farmMenu.set_shape(192, 0, false, 245);
		}

		public var rulesMenu:UI_Element;
		public var labelMiceRule:UI_TextField;
		public var upperDividerRules:UI_Element;
		public var lowerDividerRules:UI_Element;
		public var lowestDividerRules:UI_Element;

		public var MinMiceContainer:UI_Element;
		public var MinMiceCheckBox:UI_CheckBox;
		public var MinMiceInput:UI_Input;
		public var MaxMiceContainer:UI_Element;
		public var MaxMiceCheckBox:UI_CheckBox;
		public var MaxMiceInput:UI_Input;
		public var MaxWinContainer:UI_Element;
		public var MaxWinCheckBox:UI_CheckBox;
		public var MaxWinInput:UI_Input;
		public var MaxRoundContainer:UI_Element;
		public var MaxRoundCheckBox:UI_CheckBox;
		public var MaxRoundInput:UI_Input;

		public var StopFarmCheckBox:UI_CheckButton;
		public var ChangeRoomCheckBox:UI_CheckButton;
		public var DisconnectCheckBox:UI_CheckButton;

		public var MortMapContainer:UI_Element;
		public var MortMapCheckBox:UI_CheckBox;
		public var MortMapInput:UI_Input;

		public function createRulesMenu() {
			rulesMenu = new UI_Element(0, 0);
			rulesMenu.set_prep_ui(LayoutDirection.VERTICAL);

			labelMiceRule = new UI_TextField("Farm Rules", 0);
			

			upperDividerRules = new UI_Element(0, 6);
			upperDividerRules.set_shape(0, 3, true, 155);

			MinMiceContainer = new UI_Element(0, 20);
			MinMiceCheckBox = new UI_CheckBox("Min Mice", 100);
			MinMiceCheckBox.check_box_callback(this.onMinRuleChange, null, false);
			MinMiceInput = new UI_Input(50);	
			MinMiceInput.setPlaceholder("0", false);
			MinMiceInput.textField.restrict = "0-9";
			MinMiceInput.setChangeHandler(this.onMinRuleChange, null, true);
			MinMiceContainer.add_ui_element(MinMiceCheckBox, MinMiceInput);

			MaxMiceContainer = new UI_Element(0, 20);
			MaxMiceCheckBox = new UI_CheckBox("Max Mice", 100);
			MaxMiceCheckBox.check_box_callback(this.onMaxRuleChange, null, false);
			MaxMiceInput = new UI_Input(50);
			MaxMiceInput.setPlaceholder("0", false);
			MaxMiceInput.textField.restrict = "0-9";
			MaxMiceInput.setChangeHandler(this.onMaxRuleChange, null, true);
			MaxMiceContainer.add_ui_element(MaxMiceCheckBox, MaxMiceInput);

			MaxWinContainer = new UI_Element(0, 20);
			MaxWinCheckBox = new UI_CheckBox("Max Win", 100);	
			MaxWinCheckBox.check_box_callback(this.onMaxWinRuleChange, null, false);
			MaxWinInput = new UI_Input(50);
			MaxWinInput.setPlaceholder("0", false);
			MaxWinInput.textField.restrict = "0-9";
			MaxWinInput.setChangeHandler(this.onMaxWinRuleChange, null, true);
			MaxWinContainer.add_ui_element(MaxWinCheckBox, MaxWinInput);

			MaxRoundContainer = new UI_Element(0, 20);
			MaxRoundCheckBox = new UI_CheckBox("Max Round", 100);
			MaxRoundCheckBox.check_box_callback(this.onMaxRoundRuleChange, null, false);
			MaxRoundInput = new UI_Input(50);
			MaxRoundInput.setPlaceholder("0", false);
			MaxRoundInput.textField.restrict = "0-9";
			MaxRoundInput.setChangeHandler(this.onMaxRoundRuleChange, null, true);
			MaxRoundContainer.add_ui_element(MaxRoundCheckBox, MaxRoundInput);

			lowerDividerRules = new UI_Element(0, 4);
			lowerDividerRules.set_shape(0, 4, true, 155);	

			StopFarmCheckBox = new UI_CheckButton(this.onStopFarmChecked, null);
			StopFarmCheckBox.textField.text = "Stop Farm";
			ChangeRoomCheckBox = new UI_CheckButton(this.onChangeRoomChecked, null);
			ChangeRoomCheckBox.textField.text = "Change Room";
			DisconnectCheckBox = new UI_CheckButton(this.onDisconnectChecked, null);
			DisconnectCheckBox.textField.text = "Exit Game";

			lowestDividerRules = new UI_Element(0, 5);
			lowestDividerRules.set_shape(0, 5, true, 155);

			MortMapContainer = new UI_Element(0, 20);
			MortMapCheckBox = new UI_CheckBox("Die Maps", 0);
			MortMapCheckBox.check_box_callback(this.onMortMapInputChange, null, false);
			MortMapInput = new KeyInput(80);
			//MortMapInput.setPlaceholder("@12345,", false);
			MortMapInput.setChangeHandler(this.onMortMapInputChange, null, true);
			MortMapContainer.add_ui_element(MortMapCheckBox, MortMapInput);

			rulesMenu.add_ui_element(labelMiceRule, upperDividerRules, MinMiceContainer, MaxMiceContainer, MaxWinContainer, MaxRoundContainer, lowerDividerRules, StopFarmCheckBox, ChangeRoomCheckBox, DisconnectCheckBox, lowestDividerRules, MortMapContainer);
			labelMiceRule.setAlignment("center");
		}


		private function onFarmButtonClicked(): void {
			trace("Farm button clicked");
		}

		private function onAutoWinChecked(param1:Boolean): void {
			trace("Auto Win checked");
		}

		private function onAutoMortChecked(param1:Boolean): void {
			trace("Auto Mort checked");
		}

		private function onAutoWinShamanMortChecked(param1:Boolean): void {
			trace("Auto Win + Shaman Mort checked");
		}

		private function onAutoMortShamanWinChecked(param1:Boolean): void {
			trace("Auto Mort + Shaman Win checked");
		}

		private function onAutoMoveChecked(): void {
			trace("Auto Move checked");
		}

		private function onCollectGiftsChecked(): void {
			trace("Collect Gifts checked");
		}

		private function onShamanLoyaltyChange(): void {
			trace("Shaman Loyalty changed: " + shamanLoyaltyInput.textField.text);
		}

		private function onShamanLoyaltyInputChange(): void {
			trace("Shaman Loyalty Input changed: " + shamanLoyaltyInput.textField.text);
		}

		private function onAutoWinTimeChange(): void {
			trace("Auto Win Time changed: " + autoWinTimeInput.textField.text);
		}

		private function onAutoMortTimeChange(): void {
			trace("Auto Mort Time changed: " + autoMortTimeInput.textField.text);
		}

		private function onAutoMoveTimeChange(): void {
			trace("Auto Move Time changed: " + autoMoveTimeInput.textField.text);
		}

		private function onMinRuleChange(): void {
			trace("Min Rule changed: " + MinMiceInput.textField.text);
		}

		private function onMaxRuleChange(): void {
			trace("Max Rule changed: " + MaxMiceInput.textField.text);
		}

		private function onMaxWinRuleChange(): void {
			trace("Max Win Rule changed: " + MaxWinInput.textField.text);
		}

		private function onMaxRoundRuleChange(): void {
			trace("Max Round Rule changed: " + MaxRoundInput.textField.text);
		}

		private function onStopFarmChecked(param1:Boolean): void {
			trace("Stop Farm checked");
		}

		private function onChangeRoomChecked(param1:Boolean): void {
			trace("Change Room checked");
		}

		private function onDisconnectChecked(param1:Boolean): void {
			trace("Disconnect checked");
		}

		private function onMortMapInputChange(): void {
			trace("Mort Map Input changed: " + MortMapInput.textField.text);
		}




	}

}