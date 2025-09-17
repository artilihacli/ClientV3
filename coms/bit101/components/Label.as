package coms.bit101.components
{
    import flash.text.TextField;
    import flash.text.TextFormatAlign;
    import flash.display.DisplayObjectContainer;
    import flash.text.TextFormat;
    import flash.text.TextFieldAutoSize;
    import flash.events.Event;
    import flash.text.StyleSheet;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class Label extends Component 
    {

        protected var _autoSize:Boolean = true;
        protected var _text:String = "";
        public var _tf:TextField;
        protected var _align:String;
        private var _html:Boolean = false;
        protected var _backgroundColor:int;
        protected var _fontColor:int;

        public function Label(_arg_1:DisplayObjectContainer=null, _arg_2:Number=0, _arg_3:Number=0, _arg_4:*="", _arg_5:int=-1, _arg_6:int=-1, _arg_7:String="")
        {
            this._backgroundColor = _arg_5;
            this._fontColor = _arg_6;
            this.text = String(_arg_4);
            this._align = ((_arg_7 == "") ? TextFormatAlign.LEFT : _arg_7);
            super(_arg_1, _arg_2, _arg_3);
        }

        public function formatage(_arg_1:TextFormat):void
        {
            this._tf.defaultTextFormat = _arg_1;
        }

        override protected function init():void
        {
            super.init();
            mouseEnabled = false;
            mouseChildren = false;
        }

        override protected function addChildren():void
        {
            _height = 18;
            this._tf = new TextField();
            this._tf.height = _height;
            this._tf.embedFonts = Style.embedFonts;
            this._tf.selectable = false;
            this._tf.mouseEnabled = false;
            var _local_1:* = new TextFormat(Style.x_policeInterface, Style.fontSize, ((this._fontColor == -1) ? Style.COULEUR_TEXTE_DEFAUT : this._fontColor));
            _local_1.align = this._align;
            this._tf.defaultTextFormat = _local_1;
            if (this._html)
            {
                this._tf.htmlText = this._text;
            }
            else
            {
                this._tf.text = this._text;
            };
            addChild(this._tf);
            this.draw();
        }

        override public function draw():void
        {
            super.draw();
            if (this._backgroundColor != -1)
            {
                graphics.clear();
                graphics.beginFill(this._backgroundColor);
                graphics.drawRect(0, 0, width, height);
                graphics.endFill();
            };
            if (this._html)
            {
                this._tf.htmlText = this._text;
            }
            else
            {
                this._tf.text = this._text;
            };
            if (this._autoSize)
            {
                this._tf.autoSize = TextFieldAutoSize.LEFT;
                _width = this._tf.width;
                dispatchEvent(new Event(Event.RESIZE));
            }
            else
            {
                this._tf.autoSize = TextFieldAutoSize.NONE;
                this._tf.width = _width;
            };
            var _local_1:int = 18;
            this._tf.height = 18;
            _height = _local_1;
        }

        public function set text(_arg_1:String):void
        {
            this._text = _arg_1;
            if (this._text == null)
            {
                this._text = "";
            };
            invalidate();
        }

        public function get text():String
        {
            return (this._text);
        }

        public function get html():Boolean
        {
            return (this._html);
        }

        public function set html(_arg_1:Boolean):void
        {
            this._html = _arg_1;
            if (this._html)
            {
                mouseEnabled = true;
                mouseChildren = true;
                this._tf.mouseEnabled = true;
            };
        }

        public function set stylesheet(_arg_1:StyleSheet):void
        {
            if (this._html)
            {
                this._tf.styleSheet = _arg_1;
            };
        }

        public function set autoSize(_arg_1:Boolean):void
        {
            this._autoSize = _arg_1;
        }

        public function get autoSize():Boolean
        {
            return (this._autoSize);
        }

        public function get textField():TextField
        {
            return (this._tf);
        }

        public function changementCouleur(_arg_1:int):void
        {
            this._tf.textColor = _arg_1;
        }


    }
}

