package coms.bit101.components
{
    import flash.filters.BevelFilter;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.display.DisplayObjectContainer;

    public class CheckBox extends Component 
    {

        private static var filtreCheckBox:Array = new Array(new BevelFilter(1, 45, 0, 1, 6325657, 1, 1, 1, 1, 3));

        protected var _back:Sprite;
        protected var _button:Sprite;
        protected var _label:Label;
        protected var _labelText:String = "";
        protected var _selected:Boolean = false;
        public var tik1:Sprite;
        public var tik2:Sprite;
        public var tik3:Sprite;
        public var newCheckbox:Boolean;

        public function CheckBox(_arg_1:DisplayObjectContainer=null, _arg_2:Number=0, _arg_3:Number=0, _arg_4:String="", _arg_5:Function=null, _arg_6:Boolean=true)
        {
            this._labelText = _arg_4;
            if (_arg_6)
            {
                this.newCheckbox = _arg_6;
                Style.effetLumiere(this, true, true);
            };
            super(_arg_1, _arg_2, _arg_3);
            if (_arg_5 != null)
            {
                addEventListener(MouseEvent.CLICK, _arg_5);
            };
        }

        override protected function init():void
        {
            super.init();
            buttonMode = true;
            useHandCursor = true;
            mouseChildren = false;
        }

        override protected function addChildren():void
        {
            this._back = new Sprite();
            this._back.graphics.beginFill(2306616);
            if (this.newCheckbox)
            {
                this._back.graphics.drawRect(1, 1, 14, 14);
            }
            else
            {
                this._back.graphics.drawCircle(6, 6, 6);
            };
            this._back.graphics.endFill();
            this._back.filters = filtreCheckBox;
            addChild(this._back);
            if (this.newCheckbox)
            {
                this.tik1 = new Sprite();
                this.tik1.graphics.beginFill(11059144);
                this.tik1.graphics.drawRoundRect(1, 1, 6, 2, 3);
                this.tik1.rotation = 45;
                this.tik1.graphics.endFill();
                this.tik2 = new Sprite();
                this.tik2.graphics.beginFill(11059144);
                this.tik2.graphics.drawRoundRect(0, 0, 12, 2, 4);
                this.tik2.rotation = 125;
                this._button = new Sprite();
                this._button.addChild(this.tik1);
                this._button.addChild(this.tik2);
                this.tik2.x = (this.tik2.x + 10);
                this.tik2.y = (this.tik2.y - 2);
                this._button.x = (this._button.x + 4);
                this._button.y = (this._button.y + 6);
                this._button.width--;
                this._button.height--;
            }
            else
            {
                this._button = new Sprite();
                this._button.graphics.beginFill(11059144);
                this._button.graphics.drawCircle(6, 6, 3);
            };
            this._button.visible = false;
            addChild(this._button);
            this._label = new Label(this, 20, 10, this._labelText);
            this.draw();
            addEventListener(MouseEvent.CLICK, this.onClick);
        }

        override public function draw():void
        {
            super.draw();
            this._label.text = this._labelText;
            this._label.draw();
            if (this.newCheckbox)
            {
                this._label.x = 18;
                this._label.y = -1;
            }
            else
            {
                this._label.x = 13;
                this._label.y = ((12 - this._label.height) / 2);
            };
            _width = (this._label.width + 12);
            _height = 10;
        }

        protected function onClick(_arg_1:MouseEvent):void
        {
            this._selected = (!(this._selected));
            this._button.visible = this._selected;
        }

        public function set label(_arg_1:String):void
        {
            this._labelText = _arg_1;
            invalidate();
        }

        public function get label():String
        {
            return (this._labelText);
        }

        public function set selected(_arg_1:Boolean):void
        {
            this._selected = _arg_1;
            this._button.visible = this._selected;
        }

        public function get selected():Boolean
        {
            return (this._selected);
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            super.enabled = _arg_1;
            mouseChildren = false;
        }


    }
}

