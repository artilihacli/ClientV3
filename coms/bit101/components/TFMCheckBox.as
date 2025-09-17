package coms.bit101.components
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.filters.BevelFilter;
    import flash.text.TextFieldAutoSize;
    import flash.geom.ColorTransform;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.utils.Dictionary;

    public class TFMCheckBox extends Sprite 
    {

        public static const overTransform:ColorTransform = new ColorTransform(1.3, 1.3, 1.3);
        public static const outTransform:ColorTransform = new ColorTransform();
        public static const transformDict:Dictionary = new Dictionary();
		public static var _font:String = "Verdana";
		public static var _embed:Boolean = false;

        public var _back:Sprite;
        public var _button:Sprite;
        public var _textfield:TextField;
        public var _func:Function;
        public var _funcvar:Object;
        public var _selected:Boolean = false;

        public function TFMCheckBox(_arg_1:Function=null, _arg_2:Object=null)
        {
            this._func = _arg_1;
            this._funcvar = _arg_2;
            mouseChildren = false;
            this._back = new Sprite();
            this._back.y = 3;
            this._back.graphics.beginFill(2306616);
            this._back.graphics.drawCircle(6, 6, 6);
            this._back.graphics.endFill();
            this._back.filters = new Array(new BevelFilter(1, 45, 0, 1, 6325657, 1, 1, 1, 1, 3));
            this._button = new Sprite();
            this._button.graphics.beginFill(11059144);
            this._button.graphics.drawCircle(6, 6, 3);
            this._button.y = 3;
            addChild(this._back);
            graphics.beginFill(0, 0);
            graphics.drawRect(0, 0, 40, 18);
            graphics.endFill();
            this._textfield = getTextField();
            this._textfield.autoSize = TextFieldAutoSize.LEFT;
            this._textfield.embedFonts = _embed;
            this._textfield.x = 15;
            addChild(this._textfield);
            addEventListener(MouseEvent.MOUSE_DOWN, this.onClick);
            setMouseHover(this, true, true);
        }

        public function setState(_arg_1:Boolean):void
        {
            this._selected = _arg_1;
            if (this._selected)
            {
                addChild(this._button);
            }
            else
            {
                if (this._button.parent)
                {
                    this._button.parent.removeChild(this._button);
                };
            };
        }

        public function onClick(_arg_1:Event):void
        {
            this.setState((!(this._selected)));
            if (this._func != null)
            {
                if (this._funcvar !== null)
                {
                    this._func(this._selected, this._funcvar);
                }
                else
                {
                    this._func(this._selected);
                };
            };
        }

        public function adjustForText():void
        {
            this._back.y = (-5 + (this._textfield.textHeight / 2));
            this._button.y = this._back.y;
        }


        public static function getTextField():TextField
        {
            var _local_2:TextFormat;
            var _local_1:TextField = new $TexteVerda().getChildByName("_T") as TextField;//new TextField();//(_SafeStr_13288._SafeStr_649("$TexteVerda").getChildByName("_T") as TextField);
            if (!_embed)
            {
                _local_2 = _local_1.defaultTextFormat;
                _local_1.embedFonts = false;
                _local_2.font = _font
                _local_1.defaultTextFormat = _local_2;
            };
            return (_local_1);
        }
		
		
        public static function onMouseOut(_arg_1:MouseEvent):void
        {
            var _local_2:Sprite = (_arg_1.currentTarget as Sprite);
            _local_2.transform.colorTransform = (transformDict[_local_2] ? transformDict[_local_2] : outTransform);
        }

        public static function onMouseOver(_arg_1:MouseEvent):void
        {
            var _local_2:Sprite = (_arg_1.currentTarget as Sprite);
            _local_2.transform.colorTransform = overTransform;
        }

        public static function setMouseHover(_arg_1:Sprite, _arg_2:Boolean=true, _arg_3:Boolean=true):void
        {
            if (_arg_2)
            {
                transformDict[_arg_1] = _arg_1.transform.colorTransform;
                _arg_1.mouseEnabled = true;
                _arg_1.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
                _arg_1.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
                if (_arg_3)
                {
                    _arg_1.useHandCursor = true;
                    _arg_1.buttonMode = true;
                };
            }
            else
            {
                _arg_1.mouseEnabled = false;
                _arg_1.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
                _arg_1.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
                _arg_1.transform.colorTransform = (transformDict[_arg_1] ? transformDict[_arg_1] : outTransform);
                _arg_1.useHandCursor = false;
                _arg_1.buttonMode = false;
                delete transformDict[_arg_1];
            };
        }

    }
}