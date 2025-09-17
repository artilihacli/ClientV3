package ChargeurTransformice_fla {
	import coms.adobe.serialization.json.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.system.*;
	import flash.display.*;
	import flash.ui.*;
	import ChargeurTransformice_fla.Interface.*;
	import ChargeurTransformice_fla.Packets.*;
	import ui.transformice.*;
	import flash.utils.describeType;


	public class KeyboardHandler {

		
		public static var keyNames:Dictionary = getKeyNames();
		public static var keyCodes:Dictionary = getKeyCodes();
		
		public static function Parse_KeyDown(param1:KeyboardEvent) : void {
			var keyCode:uint = param1.keyCode | (0x0100 * int(param1.ctrlKey)) | (int(param1.shiftKey) * 0x0200) | (int(param1.altKey) * 0x0400);
			//trace("Key Down: " + getKeyCode(getKeyName(keyCode)));
			if(keyCode == Shortcuts.OpenMenu) {
				if (Client.Menu == null) Client.Menu = new MainMenu();
				Client.Menu.Open_Menu();
			} else if (keyCode == Shortcuts.Teleport) {
				Hacks.teleport();
			} else if (keyCode == Shortcuts.FakeTeleport && false) {
				Hacks.fakeTeleport();
			} else if (keyCode == Shortcuts.QuickTeleport) {
				Hacks.quickTeleport();
			} else if (keyCode == Shortcuts.Fly) {
				Hacks.fly();
			} else if (keyCode == Shortcuts.SpFly) {
				Hacks.spFly();
			} else if (keyCode == Shortcuts.HideCheese) {
				Hacks.hideShowCheese();
			}	
		}
	
		public static function Parse_KeyUp(param1:KeyboardEvent) : void {
			
		}


		public static function getKeyCode(param1:String): uint {
			var keyList:Array = param1.split(" ");
			var output:uint = 0;
			var len:int = keyList.length;
			for(var i:int = 0; i < len; i++) {
				output = (keyList[i] == "ALT") ? (output | 0x0400) : output
				output = (keyList[i] == "SHIFT") ? (output | 0x0200) : output
				output = (keyList[i] == "CTRL") ? (output | 0x0100) : output
			}
			output = output | keyCodes[keyList[len - 1]]
			return output;
		}
	
		public static function getKeyName(param1:int) : String {
			var output:String = keyNames[param1 & 0xFF];
			if(output == "CTRL" || output == "SHIFT" || output == "ALT") output = "";
			output = (((param1 & 0x0400) == 0x0400) ? "ALT " : "") + output;
			output = (((param1 & 0x0200) == 0x0200) ? "SHIFT " : "") + output;
			output = (((param1 & 0x0100) == 0x0100) ? "CTRL " : "") + output;
			return output.replace(/^\s+|\s+$/g, "");
		}


		private static function getKeyNames():Dictionary {
			var keyDescription:XML = describeType(Keyboard);
			var keyNames:XMLList = keyDescription..constant.@name;

			var keyboardDict:Dictionary = new Dictionary();

			var len:int = keyNames.length();
			for(var i:int = 0; i < len; i++) {
				if(Keyboard[keyNames[i]] is uint) {
					if(keyNames[i].indexOf("NUMBER_") != -1) {
						keyboardDict[Keyboard[keyNames[i]]] = keyNames[i].substr(7); 
					} else if(keyNames[i] == "ESCAPE") {
						keyboardDict[Keyboard[keyNames[i]]] = "ESC";
					} else if(keyNames[i] == "CONTROL") {
						keyboardDict[Keyboard[keyNames[i]]] = "CTRL";
					} else if(keyNames[i] == "ALTERNATE") {
						keyboardDict[Keyboard[keyNames[i]]] = "ALT";
					} else if(keyNames[i] == "DELETE") {
						keyboardDict[Keyboard[keyNames[i]]] = "DEL";
					} else {
						keyboardDict[Keyboard[keyNames[i]]] = keyNames[i];
					}	
				} else {
					continue;
				}
				
			}

			return keyboardDict;
		}
	
		private static function getKeyCodes():Dictionary {
			var keyboardDict:Dictionary = getKeyNames();
			var keyCodeDict:Dictionary = new Dictionary();
			for (var k:* in keyboardDict) {
				var _value:String = keyboardDict[k];
				keyCodeDict[_value] = k as uint;
			}
			return keyCodeDict;
		}



	}
}