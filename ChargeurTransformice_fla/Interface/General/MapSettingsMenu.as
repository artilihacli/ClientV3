package ChargeurTransformice_fla.Interface.General {

	import ChargeurTransformice_fla.Keys;
	import ChargeurTransformice_fla.Interface.*;
	import flash.display.*;
	import coms.bit101.components.*;
	import flash.events.*;
	import ui.transformice.*;

	public class MapSettingsMenu extends UI_Element {

		public var groundsContainer:UI_Element;
		public var saveButton:UI_Button;
		public var editButton:UI_Button; 
		public var deleteButton:UI_Button;
		
		public var softModeCheckbox:UI_CheckBox;

		public var customBackgroundCheckbox:UI_CheckBox;
		public var customBackgroundContainer:UI_Element;
		public var customBackgroundList:UI_List;
		
		public var disableNightModeCheckbox:UI_CheckBox;
		public var forceDodueCheckbox:UI_CheckBox;
		public var replaceWoodCheckbox:UI_CheckBox;
		public var halfFrictionChocolateCheckbox:UI_CheckBox;

		public var slipperyIceSliderContainer:UI_Element;
		public var slipperyIceCheckbox:UI_CheckBox;
		public var slipperyIceSlider:Slider;
		public var slipperyIceSliderLabel:Label;
		
		public var doubleFrictionSliderContainer:UI_Element;
		public var doubleFrictionChocolateCheckbox:UI_CheckBox;
		public var doubleFrictionSlider:Slider;
		public var doubleFrictionSliderLabel:Label;
		
		public var trampForceSliderContainer:UI_Element;
		public var trampForceCheckbox:UI_CheckBox;
		public var trampForceSlider:Slider;
		public var trampForceSliderLabel:Label;

		public function MapSettingsMenu()  {
			super(360, 185);
			this.set_prep_ui(LayoutDirection.VERTICAL);
			this.set_scrollable(true);
			
			this.groundsContainer = new UI_Element(_width, 200);
			this.groundsContainer.set_prep_ui(LayoutDirection.VERTICAL);
			
			this.softModeCheckbox = new UI_CheckBox("Soft Mode (SMC)", _width - 20);
			this.softModeCheckbox.check_box_callback(this.onSoftModeToggle, null, false);
			
			var buttonContainer:UI_Element = new UI_Element(_width, 24);
			buttonContainer.set_prep_ui(LayoutDirection.HORIZONTAL);		
			this.saveButton = new UI_Button("SAVE", 45, this.onSaveSoft);
			this.editButton = new UI_Button("EDIT", 45, this.onEditSoft);
			this.deleteButton = new UI_Button("DELETE", 57, this.onDeleteSoft);			
			buttonContainer.add_ui_element(this.saveButton);
			buttonContainer.add_ui_element(this.editButton);
			buttonContainer.add_ui_element(this.deleteButton);
		
			this.customBackgroundContainer = new UI_Element(_width, 24);
			this.customBackgroundCheckbox = new UI_CheckBox("Custom Background", 140);
			this.customBackgroundCheckbox.check_box_callback(this.onCustomBackgroundToggle, null, false);
			this.customBackgroundList = new UI_List(160);
			
			for each (var option:String in ["None", "Daylight", "Full moon", "Halloween", "Storm clouds", "Storm clouds 2", "Light", "Sport", "Class", "Greek"]) {
				this.customBackgroundList.add_to_list(option, function() {});
			}
			
			this.customBackgroundContainer.add_ui_element(this.customBackgroundCheckbox, this.customBackgroundList);
			
			this.disableNightModeCheckbox = new UI_CheckBox("Disable Night Mode", _width - 20);
			this.disableNightModeCheckbox.check_box_callback(this.onDisableNightModeToggle, null, false);
			
			this.forceDodueCheckbox = new UI_CheckBox("Disable Multi Cheese", _width - 20);
			this.forceDodueCheckbox.check_box_callback(this.onForceDodueToggle, null, false);
			
			this.replaceWoodCheckbox = new UI_CheckBox("Replace Wood with Honey", _width - 20);
			this.replaceWoodCheckbox.check_box_callback(this.onReplaceWoodToggle, null, false);
	
			this.slipperyIceSliderContainer = new UI_Element(_width, 24);
			this.slipperyIceCheckbox = new UI_CheckBox("Slippery Ice", 140);
			this.slipperyIceCheckbox.check_box_callback(this.onSlipperyIceToggle, null, false);
			this.slipperyIceSlider = new Slider("horizontal", this.slipperyIceSliderContainer, 160, 4, this.OnSliderSlipperyIceChanged);
			this.slipperyIceSliderLabel = new Label(this.slipperyIceSlider._handle, 0, -4, 0, -1, 12501444);
			this.slipperyIceSliderContainer.addChild(this.slipperyIceCheckbox);

			this.doubleFrictionSliderContainer = new UI_Element(_width, 24);
			this.doubleFrictionChocolateCheckbox = new UI_CheckBox("Double Friction Chocolate", 140);
			this.doubleFrictionChocolateCheckbox.check_box_callback(this.onDoubleFrictionChocolateToggle, null, false);
			this.doubleFrictionSlider = new Slider("horizontal", this.doubleFrictionSliderContainer, 160, 4, this.OnSliderDoubleFrictionChanged);
			this.doubleFrictionSliderLabel = new Label(this.doubleFrictionSlider._handle, 0, -4, 0, -1, 12501444);
			this.doubleFrictionSliderContainer.addChild(this.doubleFrictionChocolateCheckbox);
			
			this.halfFrictionChocolateCheckbox = new UI_CheckBox("Half Friction Chocolate", _width - 20);
			this.halfFrictionChocolateCheckbox.check_box_callback(this.onHalfFrictionChocolateToggle, null, false);
			
			this.trampForceSliderContainer = new UI_Element(_width, 24);
			this.trampForceCheckbox = new UI_CheckBox("Velocity Trampoline", 140);
			this.trampForceCheckbox.check_box_callback(this.onTrampForceToggle, null, false);
			this.trampForceSlider = new Slider("horizontal", this.trampForceSliderContainer, 160, 4, this.OnSliderTrampForceChanged);
			this.trampForceSliderLabel = new Label(this.trampForceSlider._handle, 0, -4, 0, -1, 12501444);
			this.trampForceSliderContainer.addChild(this.trampForceCheckbox);

			this.groundsContainer.add_ui_element(this.softModeCheckbox, buttonContainer, this.customBackgroundContainer, 
				this.disableNightModeCheckbox, this.forceDodueCheckbox, this.replaceWoodCheckbox, 
				this.slipperyIceSliderContainer, this.doubleFrictionSliderContainer, this.halfFrictionChocolateCheckbox, 
				this.trampForceSliderContainer);
			
			this.add_ui_element(this.groundsContainer);

		};

		private function onSoftModeToggle():void {
			this.setSoftButtonStates(this.softModeCheckbox.isChecked);
			trace("Soft Mode toggled:");
		}

		private function onCustomBackgroundToggle():void {
			trace("Custom Background toggled:");
		}

		private function onDisableNightModeToggle():void {
			trace("Disable Night Mode toggled:");
		}

		private function onForceDodueToggle():void {
			trace("Force Dodue toggled:");
		}

		private function onReplaceWoodToggle():void {
			trace("Replace Wood toggled:");
		}

		private function onSlipperyIceToggle():void {
			trace("Slippery Ice toggled:");
		}

		private function onDoubleFrictionChocolateToggle():void {
			trace("Double Friction Chocolate toggled:");
		}

		private function onHalfFrictionChocolateToggle():void {
			trace("Half Friction Chocolate toggled:");
		}

		private function onTrampForceToggle():void {
			trace("Tramp Force toggled:");
		}

		private function onSaveSoft():void {
			trace("Save Soft button clicked");
		}

		private function onEditSoft():void {
			trace("Edit button clicked");
		}

		private function onDeleteSoft():void {
			trace("Delete Soft button clicked");
		}

		private function setSoftButtonStates(param1:Boolean):void {
			if (this.saveButton) this.saveButton.set_button_state(param1);
			if (this.editButton) this.editButton.set_button_state(param1);
			if (this.deleteButton) this.deleteButton.set_button_state(param1);
		}

		public function OnSliderSlipperyIceChanged(param1:Event):void {
			this.slipperyIceSliderLabel.text = String(int(this.slipperyIceSlider.value*100));
		}

		public function OnSliderDoubleFrictionChanged(param1:Event):void {
			this.doubleFrictionSliderLabel.text = String(int(this.doubleFrictionSlider.value*100));
		}

		public function OnSliderTrampForceChanged(param1:Event):void {
			this.trampForceSliderLabel.text = String(int(this.trampForceSlider.value*100));
		}
	}
}