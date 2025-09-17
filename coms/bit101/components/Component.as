package coms.bit101.components
{
    import flash.display.Sprite;
    import flash.display.DisplayObjectContainer;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.display.Stage;
    import flash.filters.DropShadowFilter;
    import flash.events.Event;

    public class Component extends Sprite 
    {

        public static const DRAW:String = "draw";

        protected var _width:Number = 0;
        protected var _height:Number = 0;
        protected var _tag:int = -1;
        protected var _enabled:Boolean = true;
        public var userData:Object;

        public function Component(_arg_1:DisplayObjectContainer=null, _arg_2:Number=0, _arg_3:Number=0)
        {
            this.move(_arg_2, _arg_3);
            this.init();
            if (_arg_1 != null)
            {
                _arg_1.addChild(this);
            };
        }

        public static function initStage(_arg_1:Stage):void
        {
            _arg_1.align = StageAlign.TOP_LEFT;
            _arg_1.scaleMode = StageScaleMode.NO_SCALE;
        }


        protected function init():void
        {
            this.addChildren();
            this.invalidate();
        }

        protected function addChildren():void
        {
        }

        protected function getShadow(_arg_1:Number, _arg_2:Boolean=false):DropShadowFilter
        {
            return (new DropShadowFilter(_arg_1, 45, Style.DROPSHADOW, 1, _arg_1, _arg_1, 0.3, 1, _arg_2));
        }

        protected function invalidate():void
        {
            addEventListener(Event.ENTER_FRAME, this.onInvalidate);
        }

        public function move(_arg_1:Number, _arg_2:Number):void
        {
            this.x = Math.round(_arg_1);
            this.y = Math.round(_arg_2);
        }

        public function setSize(_arg_1:Number, _arg_2:Number):void
        {
            this._width = _arg_1;
            this._height = _arg_2;
            dispatchEvent(new Event(Event.RESIZE));
            this.invalidate();
        }

        public function draw():void
        {
            dispatchEvent(new Event(Component.DRAW));
        }

        protected function onInvalidate(_arg_1:Event):void
        {
            removeEventListener(Event.ENTER_FRAME, this.onInvalidate);
            this.draw();
        }

        override public function set width(_arg_1:Number):void
        {
            this._width = _arg_1;
            this.invalidate();
            dispatchEvent(new Event(Event.RESIZE));
        }

        override public function get width():Number
        {
            return (this._width);
        }

        override public function set height(_arg_1:Number):void
        {
            this._height = _arg_1;
            this.invalidate();
            dispatchEvent(new Event(Event.RESIZE));
        }

        override public function get height():Number
        {
            return (this._height);
        }

        public function set tag(_arg_1:int):void
        {
            this._tag = _arg_1;
        }

        public function get tag():int
        {
            return (this._tag);
        }

        override public function set x(_arg_1:Number):void
        {
            super.x = Math.round(_arg_1);
        }

        override public function set y(_arg_1:Number):void
        {
            super.y = Math.round(_arg_1);
        }

        public function set enabled(_arg_1:Boolean):void
        {
            this._enabled = _arg_1;
            var _local_2:* = this._enabled;
            mouseChildren = this._enabled;
            mouseEnabled = _local_2;
            tabEnabled = _arg_1;
            alpha = ((this._enabled) ? Number(1) : Number(0.5));
        }

        public function get enabled():Boolean
        {
            return (this._enabled);
        }


    }
}

