package coms.bit101.components
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.display.DisplayObjectContainer;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;

    public class Slider extends Component 
    {

        public static const HORIZONTAL:String = "horizontal";
        public static const VERTICAL:String = "vertical";

        public var _handle:Sprite;
        public var _back:Sprite;
        protected var _backClick:Boolean = true;
        protected var _value:Number = 0;
        protected var _max:Number = 1;
        protected var _min:Number = 0;
        protected var _orientation:String;
        protected var _tick:Number = 0.01;

        public function Slider(_arg_1:String="horizontal", _arg_2:DisplayObjectContainer=null, _arg_3:Number=0, _arg_4:Number=0, _arg_5:Function=null)
        {
            this._orientation = _arg_1;
            super(_arg_2, _arg_3, _arg_4);
            if (_arg_5 != null)
            {
                addEventListener(Event.CHANGE, _arg_5);
            };
            Style.effetLumiere(this, true, true);
        }

        override protected function init():void
        {
            super.init();
            if (this._orientation == HORIZONTAL)
            {
                setSize(100, 10);
            }
            else
            {
                setSize(10, 100);
            };
        }

        override protected function addChildren():void
        {
            this._back = new Sprite();
            this._back.filters = [getShadow(12, true)];
            addChild(this._back);
            this._handle = new Sprite();
            this._handle.filters = [getShadow(1)];
            this._handle.addEventListener(MouseEvent.MOUSE_DOWN, this.onDrag);
            this._handle.buttonMode = true;
            this._handle.useHandCursor = true;
            addChild(this._handle);
        }

        protected function drawBack():void
        {
            this._back.graphics.clear();
            this._back.graphics.beginFill(1453617);
            this._back.graphics.drawRoundRect(0, 0, _width, _height, 10);
            this._back.graphics.endFill();
            if (this._backClick)
            {
                this._back.addEventListener(MouseEvent.MOUSE_DOWN, this.onBackClick);
            }
            else
            {
                this._back.removeEventListener(MouseEvent.MOUSE_DOWN, this.onBackClick);
            };
        }

        protected function drawHandle():void
        {
            this._handle.graphics.clear();
            this._handle.graphics.beginFill(Style.BUTTON_FACE);
            if (this._orientation == HORIZONTAL)
            {
                this._handle.graphics.drawRoundRect(1, 1, (_height - 2), (_height - 2), 10);
            }
            else
            {
                this._handle.graphics.drawRect(1, 1, (_width - 2), (_width - 2));
            };
            this._handle.graphics.endFill();
            this.positionHandle();
        }

        protected function correctValue():void
        {
            if (this._max > this._min)
            {
                this._value = Math.min(this._value, this._max);
                this._value = Math.max(this._value, this._min);
            }
            else
            {
                this._value = Math.max(this._value, this._max);
                this._value = Math.min(this._value, this._min);
            };
        }

        protected function positionHandle():void
        {
            var _local_1:* = NaN;
            if (this._orientation == HORIZONTAL)
            {
                _local_1 = (_width - _height);
                this._handle.x = (((this._value - this._min) / (this._max - this._min)) * _local_1);
            }
            else
            {
                _local_1 = (_height - _width);
                this._handle.y = ((_height - _width) - (((this._value - this._min) / (this._max - this._min)) * _local_1));
            };
        }

        override public function draw():void
        {
            super.draw();
            this.drawBack();
            this.drawHandle();
        }

        public function setSliderParams(_arg_1:Number, _arg_2:Number, _arg_3:Number):void
        {
            this.minimum = _arg_1;
            this.maximum = _arg_2;
            this.value = _arg_3;
        }

        protected function onBackClick(_arg_1:MouseEvent):void
        {
            if (this._orientation == HORIZONTAL)
            {
                this._handle.x = (this["mouseX"] - (_height / 2));
                this._handle.x = Math.max(this._handle.x, 0);
                this._handle.x = Math.min(this._handle.x, (_width - _height));
                this._value = (((this._handle.x / (width - _height)) * (this._max - this._min)) + this._min);
            }
            else
            {
                this._handle.y = (this["mouseY"] - (_width / 2));
                this._handle.y = Math.max(this._handle.y, 0);
                this._handle.y = Math.min(this._handle.y, (_height - _width));
                this._value = (((((_height - _width) - this._handle.y) / (height - _width)) * (this._max - this._min)) + this._min);
            };
            stage.addEventListener(MouseEvent.MOUSE_UP, this.onDrop);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this.onSlide);
            if (this._orientation == HORIZONTAL)
            {
                this._handle.startDrag(false, new Rectangle(0, 0, (_width - _height), 0));
            }
            else
            {
                this._handle.startDrag(false, new Rectangle(0, 0, 0, (_height - _width)));
            };
            dispatchEvent(new Event(Event.CHANGE));
        }

        protected function onDrag(_arg_1:MouseEvent):void
        {
            stage.addEventListener(MouseEvent.MOUSE_UP, this.onDrop);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this.onSlide);
            if (this._orientation == HORIZONTAL)
            {
                this._handle.startDrag(false, new Rectangle(0, 0, (_width - _height), 0));
            }
            else
            {
                this._handle.startDrag(false, new Rectangle(0, 0, 0, (_height - _width)));
            };
        }

        protected function onDrop(_arg_1:MouseEvent):void
        {
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.onDrop);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.onSlide);
            stopDrag();
        }

        protected function onSlide(_arg_1:MouseEvent):void
        {
            var _local_2:* = this._value;
            if (this._orientation == HORIZONTAL)
            {
                this._value = (((this._handle.x / (width - _height)) * (this._max - this._min)) + this._min);
            }
            else
            {
                this._value = (((((_height - _width) - this._handle.y) / (height - _width)) * (this._max - this._min)) + this._min);
            };
            if (this._value != _local_2)
            {
                dispatchEvent(new Event(Event.CHANGE));
            };
        }

        public function set backClick(_arg_1:Boolean):void
        {
            this._backClick = _arg_1;
            invalidate();
        }

        public function get backClick():Boolean
        {
            return (this._backClick);
        }

        public function set value(_arg_1:Number):void
        {
            this._value = _arg_1;
            this.correctValue();
            this.positionHandle();
        }

        public function get value():Number
        {
            return (Math.round((this._value / this._tick)) * this._tick);
        }

        public function get rawValue():Number
        {
            return (this._value);
        }

        public function set maximum(_arg_1:Number):void
        {
            this._max = _arg_1;
            this.correctValue();
            this.positionHandle();
        }

        public function get maximum():Number
        {
            return (this._max);
        }

        public function set minimum(_arg_1:Number):void
        {
            this._min = _arg_1;
            this.correctValue();
            this.positionHandle();
        }

        public function get minimum():Number
        {
            return (this._min);
        }

        public function set tick(_arg_1:Number):void
        {
            this._tick = _arg_1;
        }

        public function get tick():Number
        {
            return (this._tick);
        }


    }
}

