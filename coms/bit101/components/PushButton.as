package coms.bit101.components
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.display.DisplayObjectContainer;

    public class PushButton extends Component 
    {

        public var _back:Sprite;
        public var _face:Sprite;
        public var _label:Label;
        public var _labelText:String = "";
        public var _over:Boolean = false;
        public var _down:Boolean = false;
        public var _selected:Boolean = false;
        public var _toggle:Boolean = false;
        public var basilikal1:Boolean = false;
        public var basilikal2:Boolean = false;

        public function PushButton(_arg_1:DisplayObjectContainer=null, _arg_2:Number=0, _arg_3:Number=0, _arg_4:String="", _arg_5:Function=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            if (_arg_5 != null)
            {
                addEventListener(MouseEvent.CLICK, _arg_5);
                addEventListener(MouseEvent.CLICK, this.mouseclick);
                addEventListener(MouseEvent.MOUSE_OUT, this.mouseleft);
            };
            this.label = _arg_4;
            Style.effetLumiere(this, true, true);
        }

        public function mouseclick(_arg_1:MouseEvent):void
        {
            if (this.basilikal1)
            {
                this.basilikal2 = true;
            };
        }

        public function mouseleft(_arg_1:MouseEvent):void
        {
            if (this.basilikal2)
            {
                this.basilikal2 = false;
                this.basili = true;
            };
        }

        public function set basili(_arg_1:Boolean):*
        {
            this._down = _arg_1;
            this.drawFace();
        }

        public function set basili2(_arg_1:Boolean):*
        {
            this.basili = _arg_1;
            this.basilikal1 = _arg_1;
            this.basilikal2 = _arg_1;
        }

        override protected function init():void
        {
            super.init();
            buttonMode = true;
            useHandCursor = true;
            setSize(100, 20);
        }

        override protected function addChildren():void
        {
            this._back = new Sprite();
            this._back.mouseEnabled = false;
            addChild(this._back);
            this._face = new Sprite();
            this._face.mouseEnabled = false;
            this._face.x = 1;
            this._face.y = 1;
            if (this._back)
            {
                this._back.x = 1;
                this._back.y = 1;
            };
            addChild(this._face);
            this._label = new Label();
            addChild(this._label);
            addEventListener(MouseEvent.MOUSE_DOWN, this.onMouseGoDown);
            addEventListener(MouseEvent.ROLL_OVER, this.onMouseOver);
        }

        public function drawFace():void
        {
            this._face.graphics.clear();
            if (this._down)
            {
                this._face.graphics.beginFill(Style.BUTTON_DOWN);
                this._face.filters = Style.FILTRE_BOUTON_ENFONCE;
            }
            else
            {
                this._face.graphics.beginFill(Style.BUTTON_FACE);
                this._face.filters = Style.FILTRE_BOUTON;
            };
            this._face.graphics.drawRoundRect(0, 0, (_width - 2), (_height - 2), 6);
            this._face.graphics.endFill();
        }

        override public function draw():void
        {
            super.draw();
            this.drawFace();
            if (this._labelText != "")
            {
                this._label.text = this._labelText;
                this._label.autoSize = true;
                this._label.draw();
                if (this._label.width > (_width - 4))
                {
                    this._label.autoSize = false;
                    this._label.width = (_width - 4);
                }
                else
                {
                    this._label.autoSize = true;
                };
                this._label.draw();
                this._label.move(((_width / 2) - (this._label.width / 2)), ((_height / 2) - (this._label.height / 2)));
            };
        }

        public function onMouseOver(_arg_1:MouseEvent):void
        {
            this._over = true;
            addEventListener(MouseEvent.ROLL_OUT, this.onMouseOut);
            invalidate();
        }

        public function onMouseOut(_arg_1:MouseEvent):void
        {
            this._over = false;
            removeEventListener(MouseEvent.ROLL_OUT, this.onMouseOut);
            invalidate();
        }

        public function onMouseGoDown(_arg_1:MouseEvent):void
        {
            this._down = true;
            this.drawFace();
            stage.addEventListener(MouseEvent.MOUSE_UP, this.onMouseGoUp);
        }

        public function onMouseGoUp(_arg_1:MouseEvent):void
        {
            if (((this._toggle) && (this._over)))
            {
                this._selected = (!(this._selected));
            };
            this._down = this._selected;
            this.drawFace();
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.onMouseGoUp);
        }

        public function set label(_arg_1:String):void
        {
            this._labelText = _arg_1;
            this.draw();
        }

        public function get label():String
        {
            return (this._labelText);
        }

        public function set selected(_arg_1:Boolean):void
        {
            if (!this._toggle)
            {
                _arg_1 = false;
            };
            this._selected = _arg_1;
            this._down = this._selected;
            this.drawFace();
        }

        public function get selected():Boolean
        {
            return (this._selected);
        }

        public function set toggle(_arg_1:Boolean):void
        {
            this._toggle = _arg_1;
        }

        public function get toggle():Boolean
        {
            return (this._toggle);
        }


    }
}

