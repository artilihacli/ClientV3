package ui.transformice
{
    import flash.display.Sprite;
    import flash.text.TextFieldType;
    import flash.events.KeyboardEvent;
    import flash.events.FocusEvent;
    import flash.events.Event;
    import flash.text.TextFormat;
	import flash.events.*;
	import flash.utils.*;
	import flash.system.*;
	import flash.display.*;
	import flash.ui.*;
    import flash.filters.BevelFilter;

    public class UI_Input extends UI_Sprite 
    {

        public var textField:UI_TextField; // _SafeStr_1067
        public var placeholderField:UI_TextField; // _SafeStr_2057
        public var backgroundSprite:Sprite; // _SafeStr_733
        public var isPasswordField:Boolean = false; // _SafeStr_2058
        public var nextInput:UI_Input; // _SafeStr_2059
        public var onEnterHandler:Function; // _SafeStr_2060
        public var onEnterParam:Object; // _SafeStr_2061
        public var onChangeHandler:Function; // _SafeStr_2062
        public var onChangeParam:Object; // _SafeStr_2063
        public var hasPlaceholder:Boolean = false; // _SafeStr_2064
        public var placeholderText:String = ""; // _SafeStr_2065
        public var backgroundColorValue:int; // _SafeStr_2066
        public var backgroundAlphaValue:Number; // _SafeStr_2067
        public var isPlaceholderAutoRemove:Boolean = false; // _SafeStr_2068

        public function UI_Input(_arg_1:int=100, _arg_2:int=20, _arg_3:Boolean=true)
        {
            super(_arg_1, _arg_2);
            this.textField = new UI_TextField("", 1, 1, styleConfig.altTextFormat);
            this.textField.selectable = true;
            this.textField.mouseEnabled = true;
            this.textField.type = TextFieldType.INPUT;
            this.textField.x = 1;
            this.textField.y = 1;
            this.textField.width = _arg_1;
            this.textField.height = _arg_2;
            addChild(this.textField);
            if (_arg_3)
            {
                this.setBackgroundColor(styleConfig.primaryColor);
            };
        }

        public function removeBackground():void // _SafeStr_2069
        {
            if (((this.backgroundSprite) && (this.backgroundSprite.parent)))
            {
                removeChild(this.backgroundSprite);
                this.backgroundSprite = null;
            };
        }

        public function setEnterHandler(_arg_1:Function, _arg_2:Object=null, _arg_3:Boolean=false):UI_Input // _SafeStr_2070
        {
            this.onEnterHandler = _arg_1;
            this.onEnterParam = _arg_2;
            this.textField.addEventListener(KeyboardEvent.KEY_DOWN, this.handleKeyDown);
            if (_arg_3)
            {
                this.textField.addEventListener(FocusEvent.FOCUS_OUT, this.handleFocusOut);
            };
            return (this);
        }

        public function setChangeHandler(_arg_1:Function, _arg_2:Object=null, _arg_3:Boolean=true):UI_Input // _SafeStr_2071
        {
            this.onChangeHandler = ((_arg_3) ? _arg_1 : null);
            this.onChangeParam = ((_arg_3) ? _arg_2 : null);
            if (_arg_3)
            {
                this.textField.addEventListener(Event.CHANGE, this.handleTextChange);
            }
            else
            {
                this.textField.removeEventListener(Event.CHANGE, this.handleTextChange);
            };
            return (this);
        }

        public function setNextInput(_arg_1:UI_Input):UI_Input // _SafeStr_2072
        {
            this.nextInput = _arg_1;
            this.textField.addEventListener(KeyboardEvent.KEY_DOWN, this.handleKeyDown);
            return (this);
        }

        public function setTextColor(_arg_1:int):UI_Input
        {
            this.textField.textColor = _arg_1;
            return (this);
        }

        public function removePlaceholder():void // _SafeStr_2073
        {
            this.hasPlaceholder = false;
            this.textField.removeEventListener(Event.CHANGE, this.handlePlaceholderChange);
            this.textField.removeEventListener(FocusEvent.FOCUS_IN, this.handlePlaceholderChange);
            if (((this.placeholderField) && (this.placeholderField.parent)))
            {
                this.placeholderField.parent.removeChild(this.placeholderField);
            };
            if (this.isPasswordField)
            {
                this.textField.displayAsPassword = true;
            };
        }

        public function handleKeyDown(_arg_1:KeyboardEvent):void // _SafeStr_2074
        {
            if (!stage)
            {
                return;
            };
            if (((_arg_1.keyCode == Keyboard.ENTER) && (!(this.onEnterHandler == null))))
            {
                if (this.onEnterParam)
                {
                    this.onEnterHandler(this.onEnterParam);
                }
                else
                {
                    this.onEnterHandler();
                };
                DomainManager.stage.focus = DomainManager.tfm;
                return;
            };
            if (((_arg_1.keyCode == Keyboard.TAB) && (!(this.nextInput == null))))
            {
                stage.focus = this.nextInput.textField;
                this.nextInput.textField.setSelection(0, this.nextInput.textField.text.length);
                return;
            };
        }

        public function handleTextChange(_arg_1:Event):void // _SafeStr_2075
        {
            if (!stage)
            {
                return;
            };
            if (Boolean(this.onChangeHandler))
            {
                callFunction(this.onChangeHandler, this.onChangeParam);
            };
        }

        public function setIcon(_arg_1:Sprite):UI_Input // _SafeStr_2076
        {
            var _local_3:Number;
            _arg_1.cacheAsBitmap = true;
            _arg_1.mouseChildren = false;
            _arg_1.mouseEnabled = false;
            var _local_2:int = (-4 + _height);
            if (_arg_1.height > _local_2)
            {
                _local_3 = (_local_2 / _arg_1.height);
                _arg_1.height = (_local_3 * _arg_1.height);
                _arg_1.width = (_arg_1.width * _local_3);
            };
            _arg_1.x = 2;
            _arg_1.y = 2;
            addChild(_arg_1);
            this.textField.x = ((_arg_1.x + _arg_1.width) + 2);
            this.textField.width = (-(this.textField.x) + _width);
            return (this);
        }

        public function focus():void // _SafeStr_2077
        {
            if (stage)
            {
                stage.focus = this.textField;
            };
        }

        public function setAlignment(_arg_1:String):UI_Input
        {
            var _local_2:TextFormat = this.textField.defaultTextFormat;
            _local_2.align = _arg_1;
            this.textField.defaultTextFormat = _local_2;
            return (this);
        }

        public function setPlaceholder(_arg_1:String, _arg_2:Boolean=true, _arg_3:Boolean=true):UI_Input // _SafeStr_2078
        {
            var _local_4:TextFormat;
            this.removePlaceholder();
            this.hasPlaceholder = true;
            this.isPlaceholderAutoRemove = _arg_2;
            if (_arg_2)
            {
                _arg_3 = false;
            };
            if (this.isPlaceholderAutoRemove)
            {
                this.textField.displayAsPassword = false;
                this.textField.text = _arg_1;
                this.textField.addEventListener(FocusEvent.FOCUS_IN, this.handlePlaceholderChange);
            }
            else
            {
                this.textField.text = "";
                this.textField.addEventListener(Event.CHANGE, this.handlePlaceholderChange);
                if (!this.placeholderField)
                {
                    this.placeholderField = new UI_TextField("", 1, 1);
                    this.placeholderField.mouseEnabled = false;
                };
                _local_4 = this.textField.defaultTextFormat;
                //_local_4.color = ColorUtil.blendColors(int(_local_4.color), 0, 0.45, 0.9);
                this.placeholderField.setTextFormat(_local_4);
                this.placeholderField.text = _arg_1;
                this.placeholderField.type = this.textField.type;
                this.placeholderField.x = this.textField.x;
                this.placeholderField.y = this.textField.y;
                this.placeholderField.width = this.textField.width;
                this.placeholderField.height = this.textField.height;
                addChildAt(this.placeholderField, (this.textField.parent.getChildIndex(this.textField) + 1));
            };
            if (_arg_3)
            {
                this.placeholderText = _arg_1;
                this.textField.addEventListener(Event.CHANGE, this.handlePlaceholderRestore);
            }
            else
            {
                this.placeholderText = "";
                this.textField.removeEventListener(Event.CHANGE, this.handlePlaceholderRestore);
            };
            return (this);
        }

        public function getHasPlaceholder():Boolean // _SafeStr_2079
        {
            return (this.hasPlaceholder);
        }

        public function setBackgroundColor(_arg_1:int, _arg_2:Number=1):void // _SafeStr_2080
        {
            this.backgroundColorValue = _arg_1;
            this.backgroundAlphaValue = _arg_2;
            if (!this.backgroundSprite)
            {
                this.backgroundSprite = new Sprite();
                this.backgroundSprite.graphics.beginFill(_arg_1, _arg_2);
                this.backgroundSprite.graphics.drawRoundRect(0, 0, _width, (_height + 1), 6);
                this.backgroundSprite.graphics.endFill();
                this.backgroundSprite.filters = new Array(new BevelFilter(1, 45, 0, 1, 0xFFFFFF, 0.5, 1, 1));
            };
            addChildAt(this.backgroundSprite, 0);
        }

        public function handleFocusOut(_arg_1:Event=null):void // _SafeStr_2081
        {
            if (this.onEnterHandler != null)
            {
                if (this.onEnterParam)
                {
                    this.onEnterHandler(this.onEnterParam);
                }
                else
                {
                    this.onEnterHandler();
                };
            };
        }

        public function handlePlaceholderChange(_arg_1:Event):void // _SafeStr_2082
        {
            this.removePlaceholder();
            if (_arg_1.type == FocusEvent.FOCUS_IN)
            {
                this.textField.text = "";
            };
        }

        public function setText(_arg_1:String):UI_Input // _SafeStr_1205
        {
            this.textField.text = _arg_1;
            return (this);
        }

        public function handlePlaceholderRestore(_arg_1:Event):void // _SafeStr_2083
        {
            if (0 == this.textField.length)
            {
                this.setPlaceholder(this.placeholderText, this.isPlaceholderAutoRemove, true);
            };
        }

        public function setPasswordMode(_arg_1:Boolean):UI_Input // _SafeStr_2084
        {
            this.isPasswordField = _arg_1;
            if (!this.hasPlaceholder)
            {
                this.textField.displayAsPassword = _arg_1;
            };
            return (this);
        }

        public function resize(_arg_1:int, _arg_2:int=20):void // _SafeStr_1313
        {
            _width = _arg_1;
            _height = _arg_2;
            this.textField.width = _arg_1;
            this.textField.height = _arg_2;
            if (this.backgroundSprite)
            {
                if (this.backgroundSprite.parent)
                {
                    removeChild(this.backgroundSprite);
                };
                this.backgroundSprite = null;
                this.setBackgroundColor(this.backgroundColorValue, this.backgroundAlphaValue);
            };
        }


    }
}
