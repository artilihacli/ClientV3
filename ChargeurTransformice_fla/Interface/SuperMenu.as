package ChargeurTransformice_fla.Interface {

	import ChargeurTransformice_fla.Keys;
    import ChargeurTransformice_fla.Hacks;
	import ChargeurTransformice_fla.Interface.*;
	import flash.display.*;
	import ui.transformice.*;
	import ChargeurTransformice_fla.*
	import coms.bit101.components.*;
    import flash.geom.ColorTransform;
	import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;
	import flash.ui.*
	import flash.text.*;
	
	public class SuperMenu extends Sprite {
		
        public var super_sprite:Sprite;
        public var preview_rect:Sprite;
        public var superitem_array2:Sprite;
        public var superitem_array3:Sprite;
        public var superitem_array1:Sprite;
        public var angle_label:Label;
        public var angle_value_label:Label;
        public var item_label:Label;
        public var item_value_label:Label;
        public var superitem_x_pos:int = 20;
        public var superitem_sprite_id:int = 0;
        public var item_preview:Sprite;
        public var rotating_box:Sprite;
        public var transparent_checkbox:CheckBox;
        public var hold_on_checkbox:CheckBox;
        public var auto_checkbox:CheckBox;
        public var skills_button:PushButton;
        public var inventory_super_button:PushButton;
        public var standart_button:PushButton;

        public var balloon_sprite:Sprite;
        public var balloon_box:Sprite;
        public var smallbox_sprite:Sprite;
        public var smallbox_box:Sprite;
        public var largebox_sprite:Sprite;
        public var largebox_box:Sprite;
        public var anvil_sprite:Sprite;
        public var anvil_box:Sprite;
        public var smallplank_sprite:Sprite;
        public var smallplank_box:Sprite;
        public var largeplank_sprite:Sprite;
        public var largeplank_box:Sprite;
        public var drag_sprite:Sprite;
        public var drag_box:Sprite;
        public var tramp_sprite:Sprite;
        public var tramp_box:Sprite;


        public var is_holding_on:Boolean = false;
        public var smallboxId:int = 100;
        public var largeboxId:int = 200;
        public var smallplankId:int = 300;
        public var largeplankId:int = 400;
        public var ballId:int = 601;
        public var trampId:int = 700;
        public var anvilId:int = 1001;
        public var dragId:int = 1700;
        public var balloonId:int = 2800;

		public function SuperMenu() {
            super(); 
            this.super_sprite = new Sprite();
            this.addChild(this.super_sprite);
            this.super_sprite.y = -10;
            this.x -= 15;
            this.generate_super_menu();
            this.preview_rect = new Sprite();
            this.preview_rect.graphics.lineStyle(2, 0xFFFFFF);
            this.preview_rect.graphics.drawRect(0, 0, 36, 36);
		}

        public function create_shaman_object(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=0, _arg_5:Number=0, _arg_6:Number=0, _arg_7:Boolean=true) : void
        {
            Hacks.create_shaman_object(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7);
        }

		public function get_selected_itemid() : int
		{
			var _text:int = int(this.item_value_label.text);
			if(_text == -1)
			{
				return -1;
			}
			else if(_text == 0)
			{
				return 24;
			}
			else if(_text == 1)
			{
				//this.balloonId = this.balloonId < 2844 ? this.balloonId + 1 : 2801;
                _text = this.balloonId == 2800 ? 28 : this.balloonId;
                rotateBalloonId();
				return _text;
			}
			else if(_text == 2)
			{
				return 32;
			}
			else if(_text == 3)
			{
                _text = this.smallboxId == 100 ? 1 : this.smallboxId;
                if(auto_checkbox.selected) rotateSmallBoxId();
				return _text;
			}
			else if(_text == 4)
			{
                _text = this.largeboxId == 200 ? 2 : this.largeboxId;
                if(auto_checkbox.selected) rotateLargeBoxId();
				return _text;
			}
			else if(_text == 5)
			{
                _text = this.anvilId == 1001 ? 10 : this.anvilId;
                if(auto_checkbox.selected) rotateAnvilId();
				return _text;
			}
			else if(_text == 6)
			{
                _text = this.smallplankId == 300 ? 3 : this.smallplankId;
                if(auto_checkbox.selected) rotateSmallPlankId();
				return _text;
			}
			else if(_text == 7)
			{
                _text = this.largeplankId == 400 ? 4 : this.largeplankId;
                if(auto_checkbox.selected) rotateLargePlankId();
				return _text;
			}
			else if(_text == 8)
			{
                _text = this.dragId == 1700 ? 17 : this.dragId;
                if(auto_checkbox.selected) rotateDragId();
				return _text;
			}
			else if(_text == 9)
			{
                _text = this.trampId == 700 ? 7 : this.trampId;
                if(auto_checkbox.selected) rotateTrampId();
				return _text;
			}
			else if(_text == 10)
			{
				return 26;
			}
			else if(_text == 11)
			{
				return 27;
			}
			else if(_text == 21)
			{
				if(auto_checkbox.selected) { 
                    ++this.ballId;
                    if(this.ballId == 616)
                    {
                    this.ballId = 601;
                    }
                }
				return this.ballId;
			}
			return -1;
		}

		public function create_selected_object(param1:int, param2:int) : *
		{
			 var _text:int = int(this.item_value_label.text);
			 var _id:int = int(this.angle_value_label.text);
			 if(_text == -1)
			 {
				return;
			 }
			 this.create_shaman_object(this.get_selected_itemid(),param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 if(_text == 22)
			 {
				this.create_shaman_object(39,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 33)
			 {
				this.create_shaman_object(40,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 26)
			 {
				this.create_shaman_object(45,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 25)
			 {
				this.create_shaman_object(46,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 24)
			 {
				this.create_shaman_object(57,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 23)
			 {
				this.create_shaman_object(59,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 28)
			 {
				this.create_shaman_object(60,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 27)
			 {
				this.create_shaman_object(61,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 32)
			 {
				this.create_shaman_object(62,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 29)
			 {
				this.create_shaman_object(67,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 31)
			 {
				this.create_shaman_object(68,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 30)
			 {
				this.create_shaman_object(69,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 12)
			 {
				this.create_shaman_object(33,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 19)
			 {
				this.create_shaman_object(34,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 14)
			 {
				this.create_shaman_object(63,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 18)
			 {
				this.create_shaman_object(65,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 16)
			 {
				this.create_shaman_object(80,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 15)
			 {
				this.create_shaman_object(89,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 17)
			 {
				this.create_shaman_object(95,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 20)
			 {
				this.create_shaman_object(90,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
			 if(_text == 13)
			 {
				this.create_shaman_object(97,param1,param2,_id,0,0,!this.transparent_checkbox.selected);
			 }
		}

        public function get_object_sprite(_arg_1:int=-1):Sprite
        {
            var _local_2:Sprite;
            var _local_3:int;
            _local_3 = _arg_1;
            if (_arg_1 == -1)
            {
                _local_3 = this.superitem_sprite_id;
            };
            if (_local_3 == 0)
            {
                _local_2 = addCustomObject(24);
            };
            if (_local_3 == 1)
            {
                _local_2 = addCustomObject(28);
				_local_2.scaleX = _local_2.scaleY = 0.6;
            };
            if (_local_3 == 2)
            {
                _local_2 = addCustomObject(32);
				_local_2.scaleX = _local_2.scaleY = 0.8;
			}
            if (_local_3 == 3)
            {
                _local_2 = addCustomObject(1);
				_local_2.scaleX = _local_2.scaleY = 0.8;
            };
            if (_local_3 == 4)
            {
                _local_2 = addCustomObject(2);
				_local_2.scaleX = _local_2.scaleY = 0.5;
            };
            if (_local_3 == 5)
            {
                _local_2 = addCustomObject(10);
				_local_2.scaleX = _local_2.scaleY = 0.6;
            };
            if (_local_3 == 6)
            {
                _local_2 = addCustomObject(3);
				_local_2.scaleX = 0.3;
				_local_2.scaleY = 0.4;
            };
            if (_local_3 == 7)
            {
                _local_2 = addCustomObject(4);
				_local_2.scaleX = 0.15;
				_local_2.scaleY = 0.25;
            };
            if (_local_3 == 8)
            {
                _local_2 = addCustomObject(17);
				_local_2.scaleX = _local_2.scaleY = 0.6;
            };
            if (_local_3 == 9)
            {
                _local_2 = addCustomObject(7);
				_local_2.scaleX = 0.35;
				_local_2.scaleY = 0.5;
            };
            if (_local_3 == 10)
            {
                _local_2 = addCustomObject(26);
				_local_2.scaleX = _local_2.scaleY = 0.6;
            };
            if (_local_3 == 11)
            {
                _local_2 = addCustomObject(27);
				_local_2.scaleX = _local_2.scaleY = 0.6;
            };
            if (_local_3 == 12)
            {
                _local_2 = addCustomObject(33);
            };
            if (_local_3 == 13)
            {
                _local_2 = addCustomObject(97);
            };
            if (_local_3 == 14)
            {
                _local_2 = addCustomObject(63);
				_local_2.scaleX = _local_2.scaleY = 0.8;
            };
            if (_local_3 == 15)
            {
                _local_2 = addCustomObject(89);
            };
            if (_local_3 == 16)
            {
                _local_2 = addCustomObject(80);
				_local_2.scaleX = _local_2.scaleY = 0.8;
            };
            if (_local_3 == 17)
            {
                _local_2 = addCustomObject(95);
            };
            if (_local_3 == 18)
            {
                _local_2 = addCustomObject(65);
            };
            if (_local_3 == 19)
            {
                _local_2 = addCustomObject(34);
            };
            if (_local_3 == 20)
            {
                _local_2 = addCustomObject(90);
				_local_2.scaleX = _local_2.scaleY = 0.6;
            };
            if (_local_3 == 21)
            {
                _local_2 = addCustomObject(6);
				_local_2.scaleX = _local_2.scaleY = 0.8;
            };
            if (_local_3 == 22)
            {
                _local_2 = addCustomObject(39);
				_local_2.scaleX = _local_2.scaleY = 0.9; //apple
            };
            if (_local_3 == 23)
            {
                _local_2 = addCustomObject(59);
				_local_2.scaleX = _local_2.scaleY = 0.6;
            };
            if (_local_3 == 24)
            {
                _local_2 = addCustomObject(57);
				_local_2.scaleX = _local_2.scaleY = 0.4;
            };
            if (_local_3 == 25)
            {
                _local_2 = addCustomObject(46);
				_local_2.scaleX = 0.3;
				_local_2.scaleY = 0.4;
            };
            if (_local_3 == 26)
            {
                _local_2 = addCustomObject(45);
				_local_2.scaleX = 0.3;
				_local_2.scaleY = 0.4;
            };
            if (_local_3 == 27)
            {
                _local_2 = addCustomObject(61);
				_local_2.scaleX = _local_2.scaleY = 0.6;
            };
            if (_local_3 == 28)
            {
                _local_2 = addCustomObject(60);
				_local_2.scaleX = _local_2.scaleY = 0.6;
            };
            if (_local_3 == 29)
            {
                _local_2 = addCustomObject(67);
				_local_2.scaleX = 0.1;
				_local_2.scaleY = 0.25;
            };
            if (_local_3 == 30)
            {
                _local_2 = addCustomObject(69);
				_local_2.scaleX = _local_2.scaleY = 0.4;
            };
            if (_local_3 == 31)
            {
                _local_2 = addCustomObject(68);
				_local_2.scaleX = _local_2.scaleY = 0.4;
            };
            if (_local_3 == 32)
            {
                _local_2 = addCustomObject(62);
				_local_2.scaleX = _local_2.scaleY = 0.8;
            };
            if (_local_3 == 33)
            {
                _local_2 = addCustomObject(40);
				_local_2.scaleX = _local_2.scaleY = 0.6;
            };
            if (_arg_1 == -1)
            {
                this.superitem_sprite_id++;
            };
            if (_local_2 == null)
            {
                return (new Sprite());
            };
			_local_2.x = 18;
			_local_2.y = 18;
            return (_local_2);
        }

        public function add_superitem_sprite(param1:Sprite, param2:int=20, param3:int=20):Sprite
        {
            var var_379:Sprite = new Sprite();
            var superspriteid:int;
            var var_288:Sprite = new Sprite();
            var_379.addChild(var_288);
            param1.addChild(var_379);
            var_288.graphics.beginFill(4808566);
            var_288.graphics.drawRect(0, 0, 36, 36);
            var_288.graphics.endFill();
            var_379.x = this.superitem_x_pos;
            var_379.y = param3;
            var var_208:Sprite = this.get_object_sprite();
            var_379.addChild(var_208);
            this.superitem_x_pos = (this.superitem_x_pos + 42);
            Style.effetLumiere(var_379, true, true);
            superspriteid = (this.superitem_sprite_id - 1);
            var_379.addEventListener(MouseEvent.CLICK, function (e:Event):*
            {
                e.stopPropagation();
                var _local_2:int;
                try
                {
                    if (rotating_box.numChildren > 0)
                    {
                        _local_2 = 0;
                        while (_local_2 < rotating_box.numChildren)
                        {
                            rotating_box.removeChildAt(_local_2);
                            _local_2++;
                        };
                    };
                }
                catch(E:Error)
                {
                };
                var _local_1:* = get_object_sprite(superspriteid);
                if (var_379.contains(preview_rect))
                {
                    item_value_label.text = "-1";
                    var_379.removeChild(preview_rect);
                    Keys.Transformice.removeEventListener(MouseEvent.CLICK, eventMouseClick);
                    Keys.Transformice.removeEventListener(MouseEvent.MOUSE_DOWN, eventMouseDown);
                    Keys.Transformice.removeEventListener(MouseEvent.MOUSE_UP, eventMouseUp);
                }
                else
                {
                    rotating_box.addChild(_local_1);
                    item_value_label.text = superspriteid.toString();
                    var_379.addChild(preview_rect);
                    Keys.Transformice.addEventListener(MouseEvent.CLICK, eventMouseClick);
                    Keys.Transformice.addEventListener(MouseEvent.MOUSE_DOWN, eventMouseDown);
                    Keys.Transformice.addEventListener(MouseEvent.MOUSE_UP, eventMouseUp);
                };
                _local_1.x = 18;
                _local_1.y = 18;
            });

            return (var_288);
        }




        public static function addCustomObject(param1:int): MovieClip
        {
            //trace("Adding custom object with ID: " + param1);
            var obj:MovieClip = DomainManager.getDefinition("$Objet_" + param1);
            var _local_5:DisplayObject;
            //var _local_6:int;
            var _local_7:int;
            for(var _local_2:int = 0; _local_2 < obj.numChildren; _local_2++)
            {
                _local_5 = obj.getChildAt(_local_2);
                if (_local_5.name.indexOf("Couleur") == 0 && _local_5.name.length > 7)
                {
                    //_local_6 = int(_local_5.name.charAt(7));
                    _local_7 = int("0x" + _local_5.name.split("_")[1]);
                    _local_5.transform.colorTransform = new ColorTransform(((_local_7 >> 16) & 0xFF) / 128, ((_local_7 >> 8) & 0xFF) / 128, (_local_7 & 0xFF) / 128);
                }
            }
            return obj;
        }

        public function add_superitem_collections(): void
        {
            this.superitem_array1 = new Sprite();
            this.super_sprite.addChild(this.superitem_array1);
            this.add_superitem_sprite(this.superitem_array1, 210, 20);
            this.add_balloon_sprite();
            //this.add_superitem_sprite(this.superitem_array1, 210, 20);
            this.add_superitem_sprite(this.superitem_array1, 210, 20);
            this.add_smallbox_sprite();
            this.add_largebox_sprite();
            this.add_anvil_sprite();
            //this.add_superitem_sprite(this.superitem_array1, 210, 20);
            //this.add_superitem_sprite(this.superitem_array1, 210, 20);
            //this.add_superitem_sprite(this.superitem_array1, 210, 20);
            this.superitem_x_pos = 20;
            this.add_smallplank_sprite();
            this.add_largeplank_sprite();
            this.add_drag_sprite();
            this.add_tramp_sprite();
            //this.add_superitem_sprite(this.superitem_array1, 210, 62);
            //this.add_superitem_sprite(this.superitem_array1, 210, 62);
            //this.add_superitem_sprite(this.superitem_array1, 210, 62);
            //this.add_superitem_sprite(this.superitem_array1, 210, 62);
            this.add_superitem_sprite(this.superitem_array1, 210, 62);
            this.add_superitem_sprite(this.superitem_array1, 210, 62);
            this.superitem_array2 = new Sprite();
            this.super_sprite.addChild(this.superitem_array2);
            this.superitem_x_pos = 20;
            this.add_superitem_sprite(this.superitem_array2, 210, 20);
            this.add_superitem_sprite(this.superitem_array2, 210, 20);
            this.add_superitem_sprite(this.superitem_array2, 210, 20);
            this.add_superitem_sprite(this.superitem_array2, 210, 20);
            this.add_superitem_sprite(this.superitem_array2, 210, 20);
            this.add_superitem_sprite(this.superitem_array2, 210, 20);
            this.superitem_x_pos = 20;
            this.add_superitem_sprite(this.superitem_array2, 210, 62);
            this.add_superitem_sprite(this.superitem_array2, 210, 62);
            this.add_superitem_sprite(this.superitem_array2, 210, 62);
            this.add_superitem_sprite(this.superitem_array2, 210, 62);
            this.superitem_array2.visible = false;
            this.superitem_array3 = new Sprite();
            this.super_sprite.addChild(this.superitem_array3);
            this.superitem_x_pos = 20;
            this.add_superitem_sprite(this.superitem_array3, 210, 20);
            this.add_superitem_sprite(this.superitem_array3, 210, 20);
            this.add_superitem_sprite(this.superitem_array3, 210, 20);
            this.add_superitem_sprite(this.superitem_array3, 210, 20);
            this.add_superitem_sprite(this.superitem_array3, 210, 20);
            this.add_superitem_sprite(this.superitem_array3, 210, 20);
            this.superitem_x_pos = 20;
            this.add_superitem_sprite(this.superitem_array3, 210, 62);
            this.add_superitem_sprite(this.superitem_array3, 210, 62);
            this.add_superitem_sprite(this.superitem_array3, 210, 62);
            this.add_superitem_sprite(this.superitem_array3, 210, 62);
            this.add_superitem_sprite(this.superitem_array3, 210, 62);
            this.add_superitem_sprite(this.superitem_array3, 210, 62);
            this.superitem_array3.visible = false;
        }

        public function draw_super_back():*
        {
            var _local_1:Sprite = new Sprite();
            this.addChild(_local_1);
            _local_1.graphics.beginFill(1520181);
            _local_1.graphics.drawRect(0, 0, 10, 10);
            _local_1.graphics.endFill();
            _local_1.width = 370;
            _local_1.height = 2;
            _local_1.x = 10;
            _local_1.y = 145;
            var _local_2:Sprite = new Sprite();
            this.addChild(_local_2);
            _local_2.graphics.beginFill(1520181);
            _local_2.graphics.drawRect(0, 0, 10, 10);
            _local_2.graphics.endFill();
            _local_2.width = 2;
            _local_2.height = 148;
            _local_2.x = 270;
            _local_2.y = -3;
        }

        public function handle_hold_on():*
        {
            if (!this.is_holding_on)
            {
                return;
            };
            try
            {
                //this.create_selected_object(this.main_instance.getMouseLOC(true), this.main_instance.getMouseLOC(false));
                this.create_selected_object(Hacks.mouseX, Hacks.mouseY);
                setTimeout(this.handle_hold_on, 200);
            }
            catch(error:Error)
            {
            };
        }

        public function generate_super_menu(): void
        {
            this.add_superitem_collections();
            var var_379:Sprite = new Sprite();
            this.item_preview = new Sprite();
            this.rotating_box = new Sprite();
            var_379.addChild(this.item_preview);
            this.item_preview.addChild(this.rotating_box);
            this.super_sprite.addChild(var_379);
            this.item_preview.graphics.beginFill(4808566);
            this.item_preview.graphics.drawRect(0, 0, 100, 100);
            this.item_preview.graphics.endFill();
            var_379.x = 275;
            var_379.y = 15;
            Style.effetLumiere(var_379, true, true);
            this.angle_label = new Label(this, 290, 110, "Angle:");
            this.angle_value_label = new Label(this, (290 + this.angle_label.width), 110, "0");
            this.item_label = new Label(this, 290, 125, "Item:");
            this.item_value_label = new Label(this, (290 + this.item_label.width), 125, "-1");
            this.rotating_box.x = 50;
            this.rotating_box.y = 50;
            var_379.addEventListener(MouseEvent.CLICK, function (_arg_1:MouseEvent):*
            {
                rotating_box.rotation = 0;
                angle_value_label.text = rotating_box.rotation.toString();
            });
            this.item_preview.addEventListener(MouseEvent.MOUSE_WHEEL, function (_arg_1:MouseEvent):*
            {
                if (_arg_1.delta < 0)
                {
                    rotating_box.rotation = (rotating_box.rotation + 15);
                }
                else
                {
                    rotating_box.rotation = (rotating_box.rotation - 15);
                };
                angle_value_label.text = rotating_box.rotation.toString();
            });
            this.draw_super_back();
            this.skills_button = new PushButton(this.super_sprite, 15, 105, "Skills", function ():*
            {
                superitem_array2.visible = false;
                superitem_array1.visible = false;
                superitem_array3.visible = true;
                skills_button.basili2 = true;
                inventory_super_button.basili2 = false;
                standart_button.basili2 = false;
            });
            this.inventory_super_button = new PushButton(this.super_sprite, 141, 105, "Inventory", function ():*
            {
                superitem_array1.visible = false;
                superitem_array3.visible = false;
                superitem_array2.visible = true;
                skills_button.basili2 = false;
                inventory_super_button.basili2 = true;
                standart_button.basili2 = false;
            });
            this.standart_button = new PushButton(this.super_sprite, 15, 130, "Standard", function ():*
            {
                superitem_array2.visible = false;
                superitem_array3.visible = false;
                superitem_array1.visible = true;
                skills_button.basili2 = false;
                inventory_super_button.basili2 = false;
                standart_button.basili2 = true;
            });
            this.skills_button.width = (this.skills_button.width + 22);
            this.inventory_super_button.width = (this.inventory_super_button.width + 22);
            this.standart_button.width = 248;
            this.standart_button.basili = true;
            this.skills_button.basilikal1 = true;
            this.inventory_super_button.basilikal1 = true;
            this.standart_button.basilikal1 = true;
            this.transparent_checkbox = new CheckBox(this.super_sprite, 15, 165, "Transparent");
            this.hold_on_checkbox = new CheckBox(this.super_sprite, ((this.transparent_checkbox.width + this.transparent_checkbox.x) + 20), 165, "HoldOn");
            this.auto_checkbox = new CheckBox(this.super_sprite, ((this.hold_on_checkbox.width + this.hold_on_checkbox.x) + 20), 165, "Auto Change");

            try // BURAYA BAKILACAK
            {
                // Keys.Transformice.addEventListener(MouseEvent.CLICK, this.eventMouseClick);
                // Keys.Transformice.addEventListener(MouseEvent.MOUSE_DOWN, this.eventMouseDown);
                // Keys.Transformice.addEventListener(MouseEvent.MOUSE_UP, this.eventMouseUp);
            }
            catch(E:Error)
            {
                trace(E.toString());
            };
        }

        public function eventMouseClick(e:Event): void {
            if (!hold_on_checkbox.selected)
            {
                //trace(e.target.stage);
                is_holding_on = true;
                handle_hold_on();
                is_holding_on = false;
            };
        }

        public function eventMouseDown(e:Event): void {
            if (hold_on_checkbox.selected)
            {
                is_holding_on = true;
                handle_hold_on();
            };
        }

        public function eventMouseUp(e:Event): void {
            is_holding_on = false;
        }

        public function add_balloon_sprite():Sprite
        {
            balloon_box = new Sprite();
            balloon_box.graphics.beginFill(4808566);
            balloon_box.graphics.drawRect(0, 0, 36, 36);
            balloon_box.graphics.endFill();
            balloon_box.x = this.superitem_x_pos;
            balloon_box.y = 20;
            this.superitem_array1.addChild(balloon_box);

            balloon_sprite = this.get_object_sprite();
            var superspriteid:int = 1;
            balloon_box.addChild(balloon_sprite);
            this.superitem_x_pos += 42;
            Style.effetLumiere(balloon_box, true, true);

            balloon_box.addEventListener(MouseEvent.CLICK, function (e:Event):*
            {
                e.stopPropagation();
                var _local_2:int;
                try
                {
                    if (rotating_box.numChildren > 0)
                    {
                        _local_2 = 0;
                        while (_local_2 < rotating_box.numChildren)
                        {
                            rotating_box.removeChildAt(_local_2);
                            _local_2++;
                        };
                    };
                }
                catch(E:Error)
                {
                };
                var _local_1:* = addCustomObject(balloonId == 2800 ? 28 : balloonId);
                if (balloon_box.contains(preview_rect))
                {
                    item_value_label.text = "-1";
                    balloon_box.removeChild(preview_rect);
                }
                else
                {
                    rotating_box.addChild(_local_1);
                    item_value_label.text = superspriteid.toString();
                    balloon_box.addChild(preview_rect);
                };
                _local_1.scaleX = 0.6;
                _local_1.scaleY = 0.6;
                _local_1.x = 18;
                _local_1.y = 18;
            });
            balloon_box.addEventListener(MouseEvent.MOUSE_WHEEL, this.rotateBalloonId);
            return balloon_box;
        }

        public function rotateBalloonId(e:MouseEvent=null)
        {
            if(balloon_box.contains(balloon_sprite)) {balloon_box.removeChild(balloon_sprite);}
            balloonId = (e && e.delta < 0) ? (balloonId > 2800 ? balloonId - 1 : 2844) : (balloonId < 2844 ? balloonId + 1 : 2800);
            balloon_sprite = addCustomObject(balloonId == 2800 ? 28 : balloonId);
            balloon_sprite.scaleX = 0.6;
            balloon_sprite.scaleY = 0.6;
            balloon_box.addChild(balloon_sprite);
            balloon_sprite.x = 17;
            balloon_sprite.y = 17;
        }

        public function add_smallbox_sprite():Sprite
        {
            smallbox_box = new Sprite();
            smallbox_box.graphics.beginFill(4808566);
            smallbox_box.graphics.drawRect(0, 0, 36, 36);
            smallbox_box.graphics.endFill();
            smallbox_box.x = this.superitem_x_pos;
            smallbox_box.y = 20;
            this.superitem_array1.addChild(smallbox_box);

            smallbox_sprite = this.get_object_sprite();
            var superspriteid:int = 3;
            smallbox_box.addChild(smallbox_sprite);
            this.superitem_x_pos += 42;
            Style.effetLumiere(smallbox_box, true, true);

            smallbox_box.addEventListener(MouseEvent.CLICK, function (e:Event):*
            {
                e.stopPropagation();
                var _local_2:int;
                try
                {
                    if (rotating_box.numChildren > 0)
                    {
                        _local_2 = 0;
                        while (_local_2 < rotating_box.numChildren)
                        {
                            rotating_box.removeChildAt(_local_2);
                            _local_2++;
                        };
                    };
                }
                catch(E:Error)
                {
                };
                var _local_1:* = addCustomObject(smallboxId == 100 ? 1 : smallboxId);
                if (smallbox_box.contains(preview_rect))
                {
                    item_value_label.text = "-1";
                    smallbox_box.removeChild(preview_rect);
                }
                else
                {
                    rotating_box.addChild(_local_1);
                    item_value_label.text = superspriteid.toString();
                    smallbox_box.addChild(preview_rect);
                };
                _local_1.scaleX = 0.6;
                _local_1.scaleY = 0.6;
                _local_1.x = 18;
                _local_1.y = 18;
            });
            smallbox_box.addEventListener(MouseEvent.MOUSE_WHEEL, this.rotateSmallBoxId);
            return smallbox_box;
        }

        public function rotateSmallBoxId(e:MouseEvent=null)
        {
            if(smallbox_box.contains(smallbox_sprite)) {smallbox_box.removeChild(smallbox_sprite);}
            smallboxId = (e && e.delta < 0) ? (smallboxId > 100 ? smallboxId - 1 : 142) : (smallboxId < 142 ? smallboxId + 1 : 100);
            smallbox_sprite = addCustomObject(smallboxId == 100 ? 1 : smallboxId);
            smallbox_sprite.scaleX = 0.8;
            smallbox_sprite.scaleY = 0.8;
            smallbox_box.addChild(smallbox_sprite);
            smallbox_sprite.x = 18;
            smallbox_sprite.y = 18;
        }

        public function add_largebox_sprite():Sprite
        {
            largebox_box = new Sprite();
            largebox_box.graphics.beginFill(4808566);
            largebox_box.graphics.drawRect(0, 0, 36, 36);
            largebox_box.graphics.endFill();
            largebox_box.x = this.superitem_x_pos;
            largebox_box.y = 20;
            this.superitem_array1.addChild(largebox_box);

            largebox_sprite = this.get_object_sprite();
            var superspriteid:int = 4;
            largebox_box.addChild(largebox_sprite);
            this.superitem_x_pos += 42;
            Style.effetLumiere(largebox_box, true, true);

            largebox_box.addEventListener(MouseEvent.CLICK, function (e:Event):*
            {
                e.stopPropagation();
                var _local_2:int;
                try
                {
                    if (rotating_box.numChildren > 0)
                    {
                        _local_2 = 0;
                        while (_local_2 < rotating_box.numChildren)
                        {
                            rotating_box.removeChildAt(_local_2);
                            _local_2++;
                        };
                    };
                }
                catch(E:Error)
                {
                };
                var _local_1:* = addCustomObject(largeboxId == 200 ? 2 : largeboxId);
                if (largebox_box.contains(preview_rect))
                {
                    item_value_label.text = "-1";
                    largebox_box.removeChild(preview_rect);
                }
                else
                {
                    rotating_box.addChild(_local_1);
                    item_value_label.text = superspriteid.toString();
                    largebox_box.addChild(preview_rect);
                };
                _local_1.scaleX = 0.5;
                _local_1.scaleY = 0.5;
                _local_1.x = 22;
                _local_1.y = 22;
            });
            largebox_box.addEventListener(MouseEvent.MOUSE_WHEEL, this.rotateLargeBoxId);
            return largebox_box;
        }

        public function rotateLargeBoxId(e:MouseEvent=null)
        {
            if(largebox_box.contains(largebox_sprite)) {largebox_box.removeChild(largebox_sprite);}
            largeboxId = (e && e.delta < 0) ? (largeboxId > 200 ? largeboxId - 1 : 245) : (largeboxId < 245 ? largeboxId + 1 : 200);
            largebox_sprite = addCustomObject(largeboxId == 200 ? 2 : largeboxId);
            largebox_sprite.scaleX = 0.5;
            largebox_sprite.scaleY = 0.5;
            largebox_box.addChild(largebox_sprite);
            largebox_sprite.x = 18;
            largebox_sprite.y = 18;
        }

        public function add_anvil_sprite():Sprite
        {
            anvil_box = new Sprite();
            anvil_box.graphics.beginFill(4808566);
            anvil_box.graphics.drawRect(0, 0, 36, 36);
            anvil_box.graphics.endFill();
            anvil_box.x = this.superitem_x_pos;
            anvil_box.y = 20;
            this.superitem_array1.addChild(anvil_box);

            anvil_sprite = this.get_object_sprite();
            var superspriteid:int = 5;
            anvil_box.addChild(anvil_sprite);
            this.superitem_x_pos += 42;
            Style.effetLumiere(anvil_box, true, true);

            anvil_box.addEventListener(MouseEvent.CLICK, function (e:Event):*
            {
                e.stopPropagation();
                var _local_2:int;
                try
                {
                    if (rotating_box.numChildren > 0)
                    {
                        _local_2 = 0;
                        while (_local_2 < rotating_box.numChildren)
                        {
                            rotating_box.removeChildAt(_local_2);
                            _local_2++;
                        };
                    };
                }
                catch(E:Error)
                {
                };
                var _local_1:* = addCustomObject(anvilId == 1001 ? 10 : anvilId);
                if (anvil_box.contains(preview_rect))
                {
                    item_value_label.text = "-1";
                    anvil_box.removeChild(preview_rect);
                }
                else
                {
                    rotating_box.addChild(_local_1);
                    item_value_label.text = superspriteid.toString();
                    anvil_box.addChild(preview_rect);
                };
                _local_1.scaleX = 0.6;
                _local_1.scaleY = 0.6;
                _local_1.x = 18;
                _local_1.y = 18;
            });
            anvil_box.addEventListener(MouseEvent.MOUSE_WHEEL, this.rotateAnvilId);
            return anvil_box;
        }

        public function rotateAnvilId(e:MouseEvent=null)
        {
            if(anvil_box.contains(anvil_sprite)) {anvil_box.removeChild(anvil_sprite);}
            anvilId = (e && e.delta < 0) ? (anvilId > 1001 ? anvilId - 1 : 1021) : (anvilId < 1021 ? anvilId + 1 : 1001);
            anvil_sprite = addCustomObject(anvilId == 1001 ? 10 : anvilId);
            anvil_sprite.scaleX = 0.6;
            anvil_sprite.scaleY = 0.6;
            anvil_box.addChild(anvil_sprite);
            anvil_sprite.x = 18;
            anvil_sprite.y = 18;
        }

        public function add_smallplank_sprite():Sprite
        {
            smallplank_box = new Sprite();
            smallplank_box.graphics.beginFill(4808566);
            smallplank_box.graphics.drawRect(0, 0, 36, 36);
            smallplank_box.graphics.endFill();
            smallplank_box.x = this.superitem_x_pos;
            smallplank_box.y = 62;
            this.superitem_array1.addChild(smallplank_box);

            smallplank_sprite = this.get_object_sprite();
            var superspriteid:int = 6;
            smallplank_box.addChild(smallplank_sprite);
            this.superitem_x_pos += 42;
            Style.effetLumiere(smallplank_box, true, true);

            smallplank_box.addEventListener(MouseEvent.CLICK, function (e:Event):*
            {
                e.stopPropagation();
                var _local_2:int;
                try
                {
                    if (rotating_box.numChildren > 0)
                    {
                        _local_2 = 0;
                        while (_local_2 < rotating_box.numChildren)
                        {
                            rotating_box.removeChildAt(_local_2);
                            _local_2++;
                        };
                    };
                }
                catch(E:Error)
                {
                };
                var _local_1:* = addCustomObject(smallplankId == 300 ? 3 : smallplankId);
                if (smallplank_box.contains(preview_rect))
                {
                    item_value_label.text = "-1";
                    smallplank_box.removeChild(preview_rect);
                }
                else
                {
                    rotating_box.addChild(_local_1);
                    item_value_label.text = superspriteid.toString();
                    smallplank_box.addChild(preview_rect);
                };
                _local_1.scaleX = 0.5;
                _local_1.scaleY = 0.5;
                _local_1.x = 0;
                _local_1.y = 25;
            });
            smallplank_box.addEventListener(MouseEvent.MOUSE_WHEEL, this.rotateSmallPlankId);
            return smallplank_box;
        }

        public function rotateSmallPlankId(e:MouseEvent=null)
        {
            if(smallplank_box.contains(smallplank_sprite)) {smallplank_box.removeChild(smallplank_sprite);}
            smallplankId = (e && e.delta < 0) ? (smallplankId > 300 ? smallplankId - 1 : 340) : (smallplankId < 340 ? smallplankId + 1 : 300);
            smallplank_sprite = addCustomObject(smallplankId == 300 ? 3 : smallplankId);
            smallplank_sprite.scaleX = 0.3;
            smallplank_sprite.scaleY = 0.4;
            smallplank_box.addChild(smallplank_sprite);
            smallplank_sprite.x = 18;
            smallplank_sprite.y = 18;
        }

        public function add_largeplank_sprite():Sprite
        {
            largeplank_box = new Sprite();
            largeplank_box.graphics.beginFill(4808566);
            largeplank_box.graphics.drawRect(0, 0, 36, 36);
            largeplank_box.graphics.endFill();
            largeplank_box.x = this.superitem_x_pos;
            largeplank_box.y = 62;
            this.superitem_array1.addChild(largeplank_box);

            largeplank_sprite = this.get_object_sprite();
            var superspriteid:int = 7;
            largeplank_box.addChild(largeplank_sprite);
            this.superitem_x_pos += 42;
            Style.effetLumiere(largeplank_box, true, true);

            largeplank_box.addEventListener(MouseEvent.CLICK, function (e:Event):*
            {
                e.stopPropagation();
                var _local_2:int;
                try
                {
                    if (rotating_box.numChildren > 0)
                    {
                        _local_2 = 0;
                        while (_local_2 < rotating_box.numChildren)
                        {
                            rotating_box.removeChildAt(_local_2);
                            _local_2++;
                        };
                    };
                }
                catch(E:Error)
                {
                };
                var _local_1:* = addCustomObject(largeplankId == 400 ? 4 : largeplankId);
                if (largeplank_box.contains(preview_rect))
                {
                    item_value_label.text = "-1";
                    largeplank_box.removeChild(preview_rect);
                }
                else
                {
                    rotating_box.addChild(_local_1);
                    item_value_label.text = superspriteid.toString();
                    largeplank_box.addChild(preview_rect);
                };
                _local_1.scaleX = 0.35;
                _local_1.scaleY = 0.35;
                _local_1.x = 0;
                _local_1.y = 25;
            });
            largeplank_box.addEventListener(MouseEvent.MOUSE_WHEEL, this.rotateLargePlankId);
            return largeplank_box;
        }

        public function rotateLargePlankId(e:MouseEvent=null)
        {
            if(largeplank_box.contains(largeplank_sprite)) {largeplank_box.removeChild(largeplank_sprite);}
            largeplankId = (e && e.delta < 0) ? (largeplankId > 400 ? largeplankId - 1 : 443) : (largeplankId < 443 ? largeplankId + 1 : 400);
            largeplank_sprite = addCustomObject(largeplankId == 400 ? 4 : largeplankId);
            largeplank_sprite.scaleX = 0.15;
            largeplank_sprite.scaleY = 0.25;
            largeplank_box.addChild(largeplank_sprite);
            largeplank_sprite.x = 18;
            largeplank_sprite.y = 18;
        }

        public function add_drag_sprite():Sprite
        {
            drag_box = new Sprite();
            drag_box.graphics.beginFill(4808566);
            drag_box.graphics.drawRect(0, 0, 36, 36);
            drag_box.graphics.endFill();
            drag_box.x = this.superitem_x_pos;
            drag_box.y = 62;
            this.superitem_array1.addChild(drag_box);

            drag_sprite = this.get_object_sprite();
            var superspriteid:int = 8;
            drag_box.addChild(drag_sprite);
            this.superitem_x_pos += 42;
            Style.effetLumiere(drag_box, true, true);

            drag_box.addEventListener(MouseEvent.CLICK, function (e:Event):*
            {
                e.stopPropagation();
                var _local_2:int;
                try
                {
                    if (rotating_box.numChildren > 0)
                    {
                        _local_2 = 0;
                        while (_local_2 < rotating_box.numChildren)
                        {
                            rotating_box.removeChildAt(_local_2);
                            _local_2++;
                        };
                    };
                }
                catch(E:Error)
                {
                };
                var _local_1:* = addCustomObject(dragId == 1700 ? 17 : dragId);
                if (drag_box.contains(preview_rect))
                {
                    item_value_label.text = "-1";
                    drag_box.removeChild(preview_rect);
                }
                else
                {
                    rotating_box.addChild(_local_1);
                    item_value_label.text = superspriteid.toString();
                    drag_box.addChild(preview_rect);
                };
                _local_1.scaleX = 0.6;
                _local_1.scaleY = 0.6;
                _local_1.x = 0;
                _local_1.y = 25;
            });
            drag_box.addEventListener(MouseEvent.MOUSE_WHEEL, this.rotateDragId);
            return drag_box;
        }

        public function rotateDragId(e:MouseEvent=null)
        {
            if(drag_box.contains(drag_sprite)) {drag_box.removeChild(drag_sprite);}
            dragId = (e && e.delta < 0) ? (dragId > 1700 ? dragId - 1 : 1735) : (dragId < 1735 ? dragId + 1 : 1700);
            drag_sprite = addCustomObject(dragId == 1700 ? 17 : dragId);
            drag_sprite.scaleX = 0.6;
            drag_sprite.scaleY = 0.6;
            drag_box.addChild(drag_sprite);
            drag_sprite.x = 18;
            drag_sprite.y = 18;
        }

        public function add_tramp_sprite():Sprite
        {
            tramp_box = new Sprite();
            tramp_box.graphics.beginFill(4808566);
            tramp_box.graphics.drawRect(0, 0, 36, 36);
            tramp_box.graphics.endFill();
            tramp_box.x = this.superitem_x_pos;
            tramp_box.y = 62;
            this.superitem_array1.addChild(tramp_box);

            tramp_sprite = this.get_object_sprite();
            var superspriteid:int = 9;
            tramp_box.addChild(tramp_sprite);
            this.superitem_x_pos += 42;
            Style.effetLumiere(tramp_box, true, true);

            tramp_box.addEventListener(MouseEvent.CLICK, function (e:Event):*
            {
                e.stopPropagation();
                var _local_2:int;
                try
                {
                    if (rotating_box.numChildren > 0)
                    {
                        _local_2 = 0;
                        while (_local_2 < rotating_box.numChildren)
                        {
                            rotating_box.removeChildAt(_local_2);
                            _local_2++;
                        };
                    };
                }
                catch(E:Error)
                {
                };
                var _local_1:* = addCustomObject(trampId == 700 ? 7 : trampId);
                if (tramp_box.contains(preview_rect))
                {
                    item_value_label.text = "-1";
                    tramp_box.removeChild(preview_rect);
                }
                else
                {
                    rotating_box.addChild(_local_1);
                    item_value_label.text = superspriteid.toString();
                    tramp_box.addChild(preview_rect);
                };
                _local_1.scaleX = 0.6;
                _local_1.scaleY = 0.6;
                _local_1.x = 0;
                _local_1.y = 25;
            });
            tramp_box.addEventListener(MouseEvent.MOUSE_WHEEL, this.rotateTrampId);
            return tramp_box;
        }

        public function rotateTrampId(e:MouseEvent=null)
        {
            if(tramp_box.contains(tramp_sprite)) {tramp_box.removeChild(tramp_sprite);}
            trampId = (e && e.delta < 0) ? (trampId > 700 ? trampId - 1 : 709) : (trampId < 709 ? trampId + 1 : 700);
            tramp_sprite = addCustomObject(trampId == 700 ? 7 : trampId);
            tramp_sprite.scaleX = 0.35;
            tramp_sprite.scaleY = 0.5;
            tramp_box.addChild(tramp_sprite);
            tramp_sprite.x = 18;
            tramp_sprite.y = 18;
        }



	}

}