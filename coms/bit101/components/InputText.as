package coms.bit101.components
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.events.Event;
    import flash.display.DisplayObjectContainer;
    import flash.text.TextFieldType;
    import flash.text.TextFormat;

    public class InputText extends Component 
    {

        protected var _back:Sprite;
        protected var _password:Boolean = false;
        protected var _text:String = "";
        protected var _tf:TextField;
        public var afficherFond:Boolean = true;

        public function InputText(_arg_1:DisplayObjectContainer=null, _arg_2:Number=0, _arg_3:Number=0, _arg_4:*="", _arg_5:Function=null)
        {
            this.text = String(_arg_4);
            super(_arg_1, _arg_2, _arg_3);
            if (_arg_5 != null)
            {
                addEventListener(Event.CHANGE, _arg_5);
            };
        }

        override protected function init():void
        {
            super.init();
            setSize(100, 16);
        }

        override protected function addChildren():void
        {
            this._back = new Sprite();
            this._back.filters = Style.FILTRE_FOND_SAISIE;
            addChild(this._back);
            this._tf = new TextField();
            this._tf.embedFonts = Style.embedFonts;
            this._tf.selectable = true;
            this._tf.type = TextFieldType.INPUT;
            this._tf.defaultTextFormat = new TextFormat(Style.x_policeInterface, Style.fontSize, Style.COULEUR_TEXTE_SAISIE);
            addChild(this._tf);
            this._tf.addEventListener(Event.CHANGE, this.onChange);
        }

        override public function draw():void
        {
            super.draw();
            if (this.afficherFond)
            {
                this._back.graphics.clear();
                this._back.graphics.beginFill(Style.COULEUR_FOND_TEXTE_SAISIE);
                this._back.graphics.drawRoundRect(0, 0, _width, _height, 6);
                this._back.graphics.endFill();
            };
            this._tf.displayAsPassword = this._password;
            if (this._text != null)
            {
                this._tf.text = this._text;
            }
            else
            {
                this._tf.text = "";
            };
            this._tf.width = (_width - 4);
            if (this._tf.text == "")
            {
                this._tf.text = "X";
                this._tf.height = Math.min((this._tf.textHeight + 4), _height);
                this._tf.text = "";
            }
            else
            {
                this._tf.height = Math.min((this._tf.textHeight + 4), _height);
            };
            this._tf.x = 2;
            this._tf.y = Math.round(((_height / 2) - (this._tf.height / 2)));
        }

        protected function onChange(_arg_1:Event):void
        {
            this._text = this._tf.text;
            _arg_1.stopImmediatePropagation();
            dispatchEvent(_arg_1);
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

        public function get textField():TextField
        {
            return (this._tf);
        }

        public function set restrict(_arg_1:String):void
        {
            this._tf.restrict = _arg_1;
        }

        public function get restrict():String
        {
            return (this._tf.restrict);
        }

        public function set maxChars(_arg_1:int):void
        {
            this._tf.maxChars = _arg_1;
        }

        public function get maxChars():int
        {
            return (this._tf.maxChars);
        }

        public function set password(_arg_1:Boolean):void
        {
            this._password = _arg_1;
            invalidate();
        }

        public function get password():Boolean
        {
            return (this._password);
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            super.enabled = _arg_1;
            this._tf.tabEnabled = _arg_1;
        }


    }
}

