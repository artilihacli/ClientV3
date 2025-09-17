package ChargeurTransformice_fla.Interface {

	import ChargeurTransformice_fla.Keys;
	import ChargeurTransformice_fla.Interface.*;
	import flash.display.*;
	import flash.events.*;
	import coms.bit101.components.*;
	import ui.transformice.*;
	
	public class BotMenu extends UI_Element {
		
		// Main container
		public var botContainer:UI_Element;
		
		// Checkboxes
		public var autoPlayCheckbox:UI_CheckBox;
		public var adaptivePlayCheckbox:UI_CheckBox;
		public var simulateKeysCheckbox:UI_CheckBox;
		public var bypassLuaCheckbox:UI_CheckBox;
		public var aiBotCheckbox:UI_CheckBox;
		public var aiBot2Checkbox:UI_CheckBox;
		public var stopPlayCheckbox:UI_CheckBox;
		
		// Input fields
		public var reducedDelayContainer:UI_Element;
		public var startDelayContainer:UI_Element;
		public var reducedDelayText:UI_TextField;
		public var startDelayText:UI_TextField;
		public var reducedDelayInput:UI_Input;
		public var startDelayInput:UI_Input;
		
		// Buttons
		public var recButton:UI_Button;
		public var saveButton:UI_Button;
		public var deleteButton:UI_Button;
		public var previewButton:UI_Button;
		public var listMapsButton:UI_Button;
		
		// Status field
		public var statusField:UI_TextField;		
		
		public function BotMenu() {
			super(360, 215);
			this.set_prep_ui(LayoutDirection.VERTICAL);
			this.set_scrollable(true);
			
			this.createBotUI();
		}
		
		
		private function createBotUI():void {
			this.botContainer = new UI_Element(_width, 600);
			this.botContainer.set_prep_ui(LayoutDirection.VERTICAL);
			
			// Autoplay checkbox
			this.autoPlayCheckbox = new UI_CheckBox("Autoplay", _width - 20);
			this.autoPlayCheckbox.check_box_callback(this.onAutoPlayToggle, null, false);
			this.botContainer.add_ui_element(this.autoPlayCheckbox);
			
			// Adaptive Autoplay checkbox
			this.adaptivePlayCheckbox = new UI_CheckBox("Adaptive Autoplay", _width - 20);
			this.adaptivePlayCheckbox.check_box_callback(this.onAdaptivePlayToggle, null, false);
			this.botContainer.add_ui_element(this.adaptivePlayCheckbox);
			
			// Simulate Keys checkbox
			this.simulateKeysCheckbox = new UI_CheckBox("Simulate Keys (WASD)", _width - 20);
			this.simulateKeysCheckbox.check_box_callback(this.onSimulateKeysToggle, null, false);
			this.botContainer.add_ui_element(this.simulateKeysCheckbox);
			
			// Bypass Lua checkbox
			this.bypassLuaCheckbox = new UI_CheckBox("Bypass lua script (require restart)", _width - 20);
			this.bypassLuaCheckbox.check_box_callback(this.onBypassLuaToggle, null, false);
			this.botContainer.add_ui_element(this.bypassLuaCheckbox);
			
			// Reduced Delay input
			this.reducedDelayContainer = new UI_Element(_width, 24);
			this.reducedDelayText = new UI_TextField("Reduced Delay");
			this.reducedDelayInput = new UI_Input(50);
			this.reducedDelayInput.setEnterHandler(this.onReducedDelayChange, null, true);
			this.reducedDelayContainer.add_ui_element(this.reducedDelayText, this.reducedDelayInput);
			this.botContainer.add_ui_element(this.reducedDelayContainer);
			
			// Start Delay input
			this.startDelayContainer = new UI_Element(_width, 24);
			this.startDelayText = new UI_TextField("Start Delay");
			this.startDelayInput = new UI_Input(50);
			this.startDelayInput.setEnterHandler(this.onStartDelayChange, null, true);
			this.startDelayContainer.add_ui_element(this.startDelayText, this.startDelayInput);
			this.botContainer.add_ui_element(this.startDelayContainer);
			
			// AI Bot checkbox
			this.aiBotCheckbox = new UI_CheckBox("AI Bot", _width - 20);
			this.aiBotCheckbox.check_box_callback(this.onAiBotToggle, null, false);
			this.botContainer.add_ui_element(this.aiBotCheckbox);
			
			// AI Bot 2 checkbox
			this.aiBot2Checkbox = new UI_CheckBox("Save fastest record (Ai bot)", _width - 20);
			this.aiBot2Checkbox.check_box_callback(this.onAiBot2Toggle, null, false);
			this.botContainer.add_ui_element(this.aiBot2Checkbox);
			
			// Stop Play checkbox
			this.stopPlayCheckbox = new UI_CheckBox("Stop Play", _width - 20);
			this.stopPlayCheckbox.check_box_callback(this.onStopPlayToggle, null, false);
			this.botContainer.add_ui_element(this.stopPlayCheckbox);
			
			// Status field
			this.statusField = new UI_TextField("Status", _width - 20, 24);
			this.botContainer.add_ui_element(this.statusField);
			
			// Button container
			var buttonContainer:UI_Element = new UI_Element(_width, 24);
			buttonContainer.set_prep_ui(LayoutDirection.HORIZONTAL);
			
			this.recButton = new UI_Button("REC", 40, this.onRecordClick);
			this.saveButton = new UI_Button("SAVE", 45, this.onSaveClick);
			this.deleteButton = new UI_Button("DELETE", 57, this.onDeleteClick);
			this.previewButton = new UI_Button("PREVIEW", 65, this.onPreviewClick);
			
			// Initially disable buttons
			this.disableButtons();
			
			buttonContainer.add_ui_element(this.recButton);
			buttonContainer.add_ui_element(this.saveButton);
			buttonContainer.add_ui_element(this.deleteButton);
			buttonContainer.add_ui_element(this.previewButton);
			this.botContainer.add_ui_element(buttonContainer);
			
			// List Maps button
			this.listMapsButton = new UI_Button("List Maps", 120, this.onListMapsClick);
			this.botContainer.add_ui_element(this.listMapsButton);

		
			this.add_ui_element(this.botContainer);
		}
		
		// Checkbox callback methods
		private function onAutoPlayToggle():void {
			trace("Autoplay toggled:", this.autoPlayCheckbox.getChecked());
		}
		
		private function onAdaptivePlayToggle():void {
			trace("Adaptive play toggled:", this.adaptivePlayCheckbox.getChecked());
		}
		
		private function onSimulateKeysToggle():void {
			trace("Simulate keys toggled:", this.simulateKeysCheckbox.getChecked());
		}
		
		private function onBypassLuaToggle():void {
			trace("Bypass lua toggled:", this.bypassLuaCheckbox.getChecked());
		}
		
		private function onAiBotToggle():void {
			trace("AI bot toggled:", this.aiBotCheckbox.getChecked());
		}
		
		private function onAiBot2Toggle():void {
			trace("AI bot 2 toggled:", this.aiBot2Checkbox.getChecked());
		}
		
		private function onStopPlayToggle():void {
			trace("Stop play toggled:", this.stopPlayCheckbox.getChecked());
		}
		
		// Input callback methods
		private function onReducedDelayChange():void {
			trace("Reduced delay changed:", this.reducedDelayInput.textField.text);
		}
		
		private function onStartDelayChange():void {
			trace("Start delay changed:", this.startDelayInput.textField.text);
		}
		
		// Button callback methods
		private function onRecordClick():void {
			trace("Record button clicked");
		}
		
		private function onSaveClick():void {
			trace("Save button clicked");
		}
		
		private function onDeleteClick():void {
			trace("Delete button clicked");
		}
		
		private function onPreviewClick():void {
			trace("Preview button clicked");
		}
		
		private function onListMapsClick():void {
			trace("List maps button clicked");
		}
		
		// Utility methods
		private function disableButtons():void {
			if (this.recButton) this.recButton.set_button_state(false);
			if (this.saveButton) this.saveButton.set_button_state(false);
			if (this.deleteButton) this.deleteButton.set_button_state(false);
			if (this.previewButton) this.previewButton.set_button_state(false);
		}
		
		private function enableButtons():void {
			if (this.recButton) this.recButton.set_button_state(true);
			if (this.saveButton) this.saveButton.set_button_state(true);
			if (this.deleteButton) this.deleteButton.set_button_state(true);
			if (this.previewButton) this.previewButton.set_button_state(true);
		}
		
		public function setStatus(status:String = "idle"):void {

		}
		
		public function updateAutoPlayText(mapCount:int):void {
			if (this.autoPlayCheckbox) {
				var newText:String = mapCount > 0 ? "Autoplay (" + mapCount + ")" : "Autoplay";
				//this.autoPlayCheckbox.textField.text = newText;
			}
		}
	}
}