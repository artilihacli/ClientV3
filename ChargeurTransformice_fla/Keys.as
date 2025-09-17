package ChargeurTransformice_fla {
	import coms.adobe.serialization.json.*;
	import flash.utils.*;
	import flash.system.*;
	import flash.display.*;
	public dynamic
	class Keys {

		public static var instance: Keys = null;

		public static var TFMLoaderInfo: LoaderInfo = null;

		public static var Transformice: * = null;

		public function Keys(param1: String) {
			var KeysJson: Object = JSONE.decode(param1);
			this.ParseKeys(KeysJson);
			instance = this;
		}

		public function ParseKeys(KeysJson: Object) {
			var RegEx: RegExp = /./g;
			if (KeysJson["error"]) {
				trace(KeysJson["error"]);
			} else if (KeysJson["keys"]) {
				for (var key: String in KeysJson["keys"]) {
					var value = KeysJson["keys"][key] || "";
					var AOB = "";
					var isAOB:String = RegEx.exec(value);
					while (isAOB != null) {
						var AOBByte: Number = Number(isAOB) || (isAOB as String).charCodeAt();
						AOB += String.fromCharCode(AOBByte);
						isAOB = RegEx.exec(value);
					}
					var finalValue:String = AOB || value;
					if (key == "premium_level") {
						this[key] = finalValue;
					} else if (key == "discord") {
						this[key] = KeysJson["keys"][key];
					} else if (key == "maps_allowed") {
						this[key] = KeysJson["keys"][key];
					} else if (key == "client_version") {
						this["isOutdated"] = "1.0.0" != value;
					} else if (key == "dc_code") {
						this[key] = KeysJson["keys"][key];
					} else if (key == "token") {
						this[key] = KeysJson["keys"][key];
					} else {
						this[key] = finalValue;
					}
				}
			}

		}

		public function parse_classes(): void {
			var member: * ;
			for (member in this) {
				if (member.indexOf("class_name") > -1) {
					this[member.replace("class_name", "class")] = this.get_class(this[member]);
				};
			};
		}

		private function get_class(_arg1: String): Class {
			if (!_arg1) return null;
			try {
				return (TFMLoaderInfo.applicationDomain.getDefinition(_arg1) as Class);
			} catch (e: Error) {
				trace(String(e));
			};
			return null;
		}

		public function CheckKeys(): void {
			var _classlist: Array = ["ui_element_class", "ui_sprite_class", "domain_manager_class", "ui_manager_class", "ui_sprite2_class", "ui_button_class", "ui_check_button_class", "ui_input_class", "ui_items_list_class", "ui_text_field_class", "prep_ui_class", "main_ui_class", "socket_class", "chat_class", "packet_handler_class", "packet_out_class", "checker_class", "timer_class", "move_class", "mouse_info_class", "anim_class", "command_packet_class", "ui_scoreboard_class", "map_class", "create_class", "chat_class2"];
			var _classid: int;
			var _classnam: String;
			for (_classid = 0; _classid < _classlist.length; _classid++) {
				_classnam = _classlist[_classid];
				if (!this[_classnam]) {
					if (!this[_classnam + "_name"]) {
						trace(_classnam + "_name fail.");
					} else {
						trace(_classnam + " get failed:" + this[_classnam + "_name"]);
						this[_classnam] = this.get_class(this[_classnam + "_name"]);
					}
				}
			}
		}

	}
}