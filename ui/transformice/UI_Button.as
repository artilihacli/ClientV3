package ui.transformice
{
    import flash.geom.ColorTransform;
    import flash.display.Sprite;
    import flash.text.TextFormatAlign;
    import flash.text.TextFieldAutoSize;
    import flash.events.MouseEvent;
    import flash.text.TextFormat;
    import flash.events.Event;
    import flash.display.DisplayObject;

    public class UI_Button extends UI_Sprite 
    {

        public static const NORMAL_COLOR_TRANSFORM:ColorTransform = new ColorTransform(); // _SafeStr_11145
        public static const HOVER_COLOR_TRANSFORM:ColorTransform = new ColorTransform(1.1, 1.1, 1.1); // _SafeStr_11146

        public var backgroundSprite:Sprite; // _SafeStr_733
        public var textField:UI_TextField; // _SafeStr_1195
        public var normalTextColor:int; // _SafeStr_2105
        public var hoverTextColor:int; // _SafeStr_2106
        public var currentTextColor:int; // couleurEnCours
        public var isEnabled:Boolean = true; // _SafeStr_2107
        public var shouldChangeTextColor:Boolean = true; // _SafeStr_2108

        public function UI_Button(text:String, width:int=0, onClick:Function=null, onClickParam:Object=null, height:int=0, alpha:Number=1)
        {
            super(0, 0);
            mouseChildren = false;
            cacheAsBitmap = true;
            this.normalTextColor = styleConfig.textColor; //_SafeStr_2029, _SafeStr_429
            this.hoverTextColor = styleConfig.highlightColor; //_SafeStr_2030, _SafeStr_429
            this.currentTextColor = this.normalTextColor;
            this.backgroundSprite = DomainManager.getDefinition(styleConfig.buttonBackgroundAsset); //_SafeStr_2032, _SafeStr_429
            if (styleConfig.defaultFilters) //_SafeStr_2033, _SafeStr_429
            {
                this.backgroundSprite.filters = styleConfig.defaultFilters; //_SafeStr_2033, _SafeStr_429
            };
            this.backgroundSprite.alpha = alpha;
            this.textField = new UI_TextField("", 1, 1);
            this.textField.y = 2;
            this.textField.x = 2;
            this.textField.defaultTextFormat = styleConfig.defaultTextFormat; //_SafeStr_2026, _SafeStr_429
            this.textField.textColor = this.normalTextColor;
            this.setAlignment(TextFormatAlign.CENTER);
            if (width == 0)
            {
                this.textField.autoSize = TextFieldAutoSize.LEFT;
            }
            else
            {
                this.textField.width = (-4 + width);
                this.backgroundSprite.width = width;
            };
            if (height == 0)
            {
                if (DomainManager.isAndroid)
                {
                    this.textField.height = 30;
                    this.backgroundSprite.height = 32;
                }
                else
                {
                    this.textField.height = 20;
                    this.backgroundSprite.height = 22;
                };
                this.textField.height = styleConfig.buttonHeight; //_SafeStr_2034, _SafeStr_429
                this.backgroundSprite.height = (2 + styleConfig.buttonHeight); //_SafeStr_2034, _SafeStr_429
                this.textField.multiline = false;
                this.textField.wordWrap = false;
            }
            else
            {
                this.textField.height = height;
                this.backgroundSprite.height = height;
                this.textField.multiline = true;
                this.textField.wordWrap = true;
            };
            this.textField.htmlText = text;
            if (0 == width)
            {
                this.backgroundSprite.width = (this.textField.width + 20);
                this.textField.x = 10;
            };
            addChild(this.backgroundSprite);
            addChild(this.textField);
            addEventListener(MouseEvent.MOUSE_DOWN, this.onButtonMouseDown);
            addEventListener(MouseEvent.MOUSE_OVER, this.onButtonMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, this.onButtonMouseOut);
            useHandCursor = true;
            buttonMode = true;
            _width = this.backgroundSprite.width;
            _height = this.backgroundSprite.height;
            if (onClick != null)
            {
                on_mouse_click(onClick, onClickParam, false);
            };
        }

        public function set_button_state(_arg_1:Boolean):UI_Button //_SafeStr_2109
        {
            this.isEnabled = _arg_1; //_SafeStr_2107
            if (_arg_1)
            {
                mouseEnabled = true;
                this.textField.textColor = styleConfig.textColor; //_SafeStr_2029, _SafeStr_429
            }
            else
            {
                mouseEnabled = false;
                this.textField.textColor = styleConfig.secondaryColor; //_SafeStr_2031, _SafeStr_429
            };
            set_dimmed((!(_arg_1)), 0.7, false);
            return (this);
        }

        public function getTextField():UI_TextField //_SafeStr_2110
        {
            return (this.textField); //_SafeStr_1195
        }

        public function resize(_arg_1:int, _arg_2:int=0):UI_Button //_SafeStr_1313
        {
            if (0 == _arg_1)
            {
                this.textField.autoSize = TextFieldAutoSize.LEFT; //_SafeStr_1195
            }
            else
            {
                this.textField.width = (-4 + _arg_1); //_SafeStr_1195
                this.backgroundSprite.width = _arg_1; //_SafeStr_733
            };
            if (0 == _arg_2)
            {
                if (DomainManager.isAndroid)
                {
                    this.textField.height = 30; //_SafeStr_1195
                    this.backgroundSprite.height = 32; //_SafeStr_733
                }
                else
                {
                    this.textField.height = 20; //_SafeStr_1195
                    this.backgroundSprite.height = 22; //_SafeStr_733
                };
                this.textField.height = styleConfig.buttonHeight; //_SafeStr_1195, _SafeStr_2034, _SafeStr_429
                this.backgroundSprite.height = (2 + styleConfig.buttonHeight); //_SafeStr_733, _SafeStr_2034, _SafeStr_429
                this.textField.multiline = false; //_SafeStr_1195
                this.textField.wordWrap = false; //_SafeStr_1195
            }
            else
            {
                this.textField.height = _arg_2; //_SafeStr_1195
                this.backgroundSprite.height = _arg_2; //_SafeStr_733
                this.textField.multiline = true; //_SafeStr_1195
                this.textField.wordWrap = true; //_SafeStr_1195
            };
            if (0 == _arg_1)
            {
                this.backgroundSprite.width = (this.textField.width + 5); //_SafeStr_733, _SafeStr_1195
            };
            _width = this.backgroundSprite.width; //_SafeStr_733
            _height = this.backgroundSprite.height; //_SafeStr_733
            return (this);
        }

        public function setAlignment(_arg_1:String):UI_Button
        {
            var _local_2:TextFormat = this.textField.defaultTextFormat; //_SafeStr_1195
            _local_2.align = _arg_1;
            this.textField.defaultTextFormat = _local_2; //_SafeStr_1195
            return (this);
        }

        public function onButtonStateChange(_arg_1:int):void //_SafeStr_2111
        {
        }

        public function getEnabled():Boolean //_SafeStr_2112
        {
            return (this.isEnabled); //_SafeStr_2107
        }

        public function setOnClick(_arg_1:Function=null, _arg_2:Object=null):UI_Button //_SafeStr_2113
        {
            if (_arg_1 != null)
            {
                on_mouse_click(_arg_1, _arg_2, false);
            };
            return (this);
        }

        public function onButtonMouseDown(_arg_1:Event):void //_SafeStr_2114
        {
            this.onButtonStateChange(1); //_SafeStr_2111
        }

        public function setShouldChangeTextColor(_arg_1:Boolean):UI_Button //_SafeStr_2115
        {
            this.shouldChangeTextColor = _arg_1; //_SafeStr_2108
            return (this);
        }

        public function onButtonMouseOut(_arg_1:MouseEvent):void //_SafeStr_2116
        {
            if (((!(this.currentTextColor == this.normalTextColor)) && (this.isEnabled))) //couleurEnCours, _SafeStr_2105, _SafeStr_2107
            {
                this.currentTextColor = this.normalTextColor; //couleurEnCours, _SafeStr_2105
                transform.colorTransform = UI_Button.NORMAL_COLOR_TRANSFORM; //_SafeStr_11145
                if (this.shouldChangeTextColor) //_SafeStr_2108
                {
                    this.textField.textColor = this.normalTextColor; //_SafeStr_1195, _SafeStr_2105
                };
            };
        }

        public function setText(_arg_1:String, _arg_2:Boolean=true):UI_Button //_SafeStr_2117
        {
            if (_arg_2)
            {
                this.textField.htmlText = _arg_1; //_SafeStr_1195
            }
            else
            {
                this.textField.text = _arg_1; //_SafeStr_1195
            };
            return (this);
        }

        public function addIcon(_arg_1:DisplayObject, _arg_2:Boolean=true):UI_Button //_SafeStr_2076
        {
            var _local_3:int;
            var _local_4:int;
            this.textField.width = (this.textField.textWidth + 4); //_SafeStr_1195
            if ((_arg_1 is UI_Sprite))
            {
                _local_3 = UI_Sprite(_arg_1)._width;
                _local_4 = UI_Sprite(_arg_1)._height;
            }
            else
            {
                _local_3 = _arg_1.width;
                _local_4 = _arg_1.height;
            };
            addChild(_arg_1);
            var _local_5:int = ((_local_3 + this.textField.width) + 4); //_SafeStr_1195
            _arg_1.y = int(((-(_local_4) + _height) / 2));
            if (_arg_2)
            {
                _arg_1.x = int(((-(_local_5) + _width) / 2));
                this.textField.x = ((_arg_1.x + _local_3) + 4); //_SafeStr_1195
            }
            else
            {
                _arg_1.x = 4;
                this.textField.x = ((_arg_1.x + _local_3) + 4); //_SafeStr_1195
            };
            return (this);
        }

        public function onButtonMouseOver(_arg_1:MouseEvent):void //_SafeStr_2118
        {
            if (((!(this.currentTextColor == this.hoverTextColor)) && (this.isEnabled))) //couleurEnCours, _SafeStr_2106, _SafeStr_2107
            {
                this.currentTextColor = this.hoverTextColor; //couleurEnCours, _SafeStr_2106
                transform.colorTransform = UI_Button.HOVER_COLOR_TRANSFORM; //_SafeStr_11146
                if (this.shouldChangeTextColor) //_SafeStr_2108
                {
                    this.textField.textColor = this.currentTextColor; //_SafeStr_1195, couleurEnCours
                };
            };
        }


    }
}//package
