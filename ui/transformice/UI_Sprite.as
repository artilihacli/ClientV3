package ui.transformice
{
    import flash.display.Sprite;
    import flash.geom.ColorTransform;
    import flash.filters.ColorMatrixFilter;
    import flash.display.Shape;
    import __AS3__.vec.Vector;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Rectangle;
    import flash.display.DisplayObjectContainer;
    import __AS3__.vec.*;
	import ChargeurTransformice_fla.*;

    public class UI_Sprite extends Sprite 
    {

        public static const DEFAULT_COLOR_TRANSFORM:ColorTransform = new ColorTransform(); //_SafeStr_5698
		//_SafeStr_5699
        public static const GRAYSCALE_FILTER:ColorMatrixFilter = new ColorMatrixFilter(new Array(0.333333333333333, 0.333333333333333, 0.333333333333333, 0, 0, 0.333333333333333, 0.333333333333333, 0.333333333333333, 0, 0, 0.333333333333333, 0.333333333333333, 0.333333333333333, 0, 0, 0, 0, 0, 1, 0));

        public var _width:int; //_SafeStr_426
        public var _height:int; //_SafeStr_427
        public var isDimmed:Boolean = false; //_SafeStr_428
        public var styleConfig:UITheme = UITheme.DEFAULT; //_SafeStr_429
        public var isDraggable:Boolean = false; // _SafeStr_430
        public var hasMouseOver:Boolean = false; // _SafeStr_431
        public var hasMouseOut:Boolean = false; //_SafeStr_432
		
        public var onClick:Function; // _SafeStr_433
        public var onClickParam:Object; // _SafeStr_434
        public var onRightClick:Function; // _SafeStr_435
        public var onRightClickParam:Object; // _SafeStr_436
        public var onMouseOver:Function; // _SafeStr_437
        public var onMouseOverParam:Object; // _SafeStr_438
        public var onMouseOut:Function; // _SafeStr_439
        public var onMouseOutParam:Object; // _SafeStr_440
		
        public var backgroundShape:Shape; // _SafeStr_441
        public var backgroundColor:int;  // _SafeStr_442
        public var backgroundAlpha:Number; // _SafeStr_443
		
        public var anchorX:Number;  // _SafeStr_444
        public var anchorY:Number; // _SafeStr_445
        public var isAnchored:Boolean = false; // _SafeStr_446
		
        public var dragTargets:Vector.<DisplayObject>;  // _SafeStr_447
        public var bringToFrontOnDrag:Boolean = false;  // _SafeStr_448
		
        public var tooltipFactory:Function;  // _SafeStr_449
        public var tooltipParam:Object; // _SafeStr_450
        public var tooltip:Sprite; // _SafeStr_451

        public function UI_Sprite(_arg_1:int, _arg_2:int)
        {
            this._width = _arg_1;
            this._height = _arg_2;
        }

        public function on_mouse_out(_arg_1:Event):void //_SafeStr_452
        {
            callFunction(this.onMouseOut, this.onMouseOutParam);
        }

        public function on_mouse_box(_arg_1:String):void //_SafeStr_453
        {
            mouseEnabled = true;
            Keys.instance.ui_manager_class[Keys.instance.on_mouse_box](this, _arg_1); //*
        }

        public function is_draggable():Boolean //_SafeStr_454
        {
            return (this.isDraggable);
        }

        public function update_position(_arg_1:Event=null):void //_SafeStr_455
        {
            var _local_3:int;
            var _local_5:int;
            var _local_2:int = DomainManager.stage.stageWidth;
            _local_3 = DomainManager.stage.stageHeight;
            var _local_4:int = _local_2 - DomainManager.stage.getChildAt(1).loaderInfo.width;
            _local_5 = _local_3 - DomainManager.stage.getChildAt(1).loaderInfo.height;
            if (this.isAnchored)
            {
                x = (this.anchorX - (_local_4 / 2));
                y = (this.anchorY - (_local_5 / 2));
            }
            else
            {
                if (DomainManager.stage.align == "")
                {
                    x = int((((_local_2 * this.anchorX) - (this._width / 2)) - (_local_4 / 2)));
                    y = int((((this.anchorY * _local_3) - (this._height / 2)) - (_local_5 / 2)));
                }
                else
                {
                    x = int(((-(this._width) + DomainManager.stage.stageWidth) * this.anchorX));
                    y = int(((-(this._height) + DomainManager.stage.stageHeight) * this.anchorY));
                };
            };
        }

        public function set_anchor_position(_arg_1:int, _arg_2:int, _arg_3:Boolean=false):void  //_SafeStr_456
        {
            if (DomainManager.stage.align == "")
            {
                this.isAnchored = true;
                this.anchorX = _arg_1;
                this.anchorY = _arg_2;
                if (_arg_3)
                {
                    DomainManager.stage.addEventListener(Event.RESIZE, this.update_position);
                };
                this.update_position();
            }
            else
            {
                x = _arg_1;
                y = _arg_2;
            };
        }

        public function _SafeStr_457():void
        {
        }

        public function set_draggable(_arg_1:Boolean=true, ... _args):void
        {
            var _local_4:DisplayObject;
            var _local_3:Vector.<DisplayObject> = new Vector.<DisplayObject>();
            for each (_local_4 in _args)
            {
                _local_3.push(_local_4);
            };
            if (0 == _local_3.length)
            {
                return;
            };
            if (!this.isDraggable)
            {
                mouseEnabled = true;
                addEventListener(MouseEvent.MOUSE_DOWN, this.start_drag_handler);
            };
            this.dragTargets = _local_3;
            this.bringToFrontOnDrag = _arg_1;
            this.isDraggable = true;
        }

        public function on_right_click(_arg_1:Event):void //_SafeStr_459
        {
            callFunction(this.onRightClick, this.onRightClickParam);
            if (this.styleConfig.debugText)
            {
                //     _SafeStr_13029._SafeStr_7913(this.styleConfig.debugText, 0.7);
            };
        }

        public function show_tooltip(_arg_1:MouseEvent):void //_SafeStr_460
        {
            if (!this.tooltip)
            {
                if (this.tooltipParam == null)
                {
                    this.tooltip = this.tooltipFactory();
                }
                else
                {
                    this.tooltip = this.tooltipFactory(this.tooltipParam);
                };
                this.tooltip.mouseEnabled = false;
                this.tooltip.mouseChildren = false;
            };
            Keys.instance.main_ui_class[Keys.instance.add_ui](this.tooltip); //*
            addEventListener(Event.ENTER_FRAME, this.update_tooltip);
        }

        public function remove_background(_arg_1:Event):void //_SafeStr_461
        {
            if (this.backgroundShape.parent)
            {
                removeChild(this.backgroundShape);
            };
        }

        public function hide_tooltip(_arg_1:MouseEvent):void
        {
            removeEventListener(Event.ENTER_FRAME, this.update_tooltip);
            if (((this.tooltip) && (this.tooltip.parent)))
            {
                this.tooltip.parent.removeChild(this.tooltip);
            };
        }

        public function set_right_click(_arg_1:Function, _arg_2:Object=null, _arg_3:Boolean=true):UI_Sprite
        {//_SafeStr_463
            mouseEnabled = true;
            this.onRightClick = _arg_1;
            this.onRightClickParam = _arg_2;
            addEventListener("rightMouseDown", this.on_right_click);
            if (_arg_3)
            {
                UIUtility.setButtonStyle(this);
            };
            return (this);
        }

        public function set_mouse_over_out(_arg_1:Function=null, _arg_2:Object=null, _arg_3:Function=null, _arg_4:Object=null):void
        { //_SafeStr_464
            if (((_arg_1 == null) || (_arg_3 == null)))
            {
                if (null == _arg_1)
                {
                    this.onMouseOver = null;
                    this.onMouseOverParam = null;
                    this.hasMouseOver = false;
                    removeEventListener(MouseEvent.MOUSE_OVER, this.on_mouse_over);
                };
                if (null == _arg_3)
                {
                    this.onMouseOut = null;
                    this.onMouseOutParam = null;
                    this.hasMouseOut = false;
                    removeEventListener(MouseEvent.MOUSE_OUT, this.on_mouse_out);
                };
                if (((_arg_1 == null) && (_arg_3 == null)))
                {
                    this.hasMouseOver = false;
                    return;
                };
            };
            if (Boolean(_arg_1))
            {
                if (!this.hasMouseOver)
                {
                    mouseEnabled = true;
                    addEventListener(MouseEvent.MOUSE_OVER, this.on_mouse_over);
                };
                this.onMouseOver = _arg_1;
                this.onMouseOverParam = _arg_2;
                this.hasMouseOver = true;
            };
            if (Boolean(_arg_3))
            {
                if (!this.hasMouseOut)
                {
                    mouseEnabled = true;
                    addEventListener(MouseEvent.MOUSE_OUT, this.on_mouse_out);
                };
                this.onMouseOut = _arg_3;
                this.onMouseOutParam = _arg_4;
                this.hasMouseOut = true;
            };
        }

        public function is_bringed_front():Boolean //_SafeStr_465
        {
            return (this.bringToFrontOnDrag);
        }

        public function has_mouse_over():Boolean //_SafeStr_466
        {
            return (this.hasMouseOver);
        }

        public function set_dimmed(_arg_1:Boolean, _arg_2:Number=0.8, _arg_3:Boolean=false):void // //_SafeStr_467
        {
            if (((_arg_1) && (!(this.isDimmed))))
            {
                this.isDimmed = true;
                transform.colorTransform = new ColorTransform(_arg_2, _arg_2, _arg_2);
                if (_arg_3)
                {
                    filters = new Array(UI_Sprite.GRAYSCALE_FILTER);
                };
            }
            else
            {
                if (((!(_arg_1)) && (this.isDimmed)))
                {
                    this.isDimmed = false;
                    transform.colorTransform = UI_Sprite.DEFAULT_COLOR_TRANSFORM;
                    if (_arg_3)
                    {
                        filters = null;
                    };
                };
            };
        }

        public function set_relative_position(_arg_1:Number=0.5, _arg_2:Number=0.5, _arg_3:Boolean=false):void
        {
            this.isAnchored = false;
            this.anchorX = _arg_1;
            this.anchorY = _arg_2;
            if (_arg_3)
            {
                DomainManager.stage.addEventListener(Event.RESIZE, this.update_position);
            };
            this.update_position();
        }

        public function add_child_centered(_arg_1:DisplayObject, _arg_2:Boolean=false, _arg_3:Boolean=false):UI_Sprite
        {//_SafeStr_469
            var _local_4:Number;
            var _local_5:Number;
            var _local_8:UI_Sprite;
            var _local_9:Number;
            var _local_10:Number;
            var _local_11:Number;
            addChild(_arg_1);
            if ((_arg_1 is UI_Sprite))
            {
                _local_8 = (_arg_1 as UI_Sprite);
                _local_4 = _local_8._width;
                _local_5 = _local_8._height;
            }
            else
            {
                _local_4 = _arg_1.width;
                _local_5 = _arg_1.height;
            };
            var _local_6:Number = 1;
            if (_arg_2)
            {
                _local_9 = 1;
                _local_10 = 1;
                if (_local_5 > this._height)
                {
                    _local_9 = (this._height / _local_5);
                };
                if (_local_4 > this._width)
                {
                    _local_10 = (this._width / _local_4);
                };
                _local_6 = ((_local_9 < _local_10) ? _local_9 : _local_10);
                _arg_1.width = (_arg_1.width * _local_6);
                _arg_1.height = (_arg_1.height * _local_6);
                _local_4 = (_local_4 * _local_6);
                _local_5 = (_local_5 * _local_6);
            };
            if (_arg_3)
            {
                _local_11 = Math.max((Math.ceil(_local_4) / this._width), (Math.ceil(_local_5) / this._height));
                if (1 > _local_11)
                {
                    _local_6 = (1 / _local_11);
                    _arg_1.width = (_arg_1.width * _local_6);
                    _arg_1.height = (_arg_1.height * _local_6);
                    _local_4 = (_local_4 * _local_6);
                    _local_5 = (_local_5 * _local_6);
                };
            };
            var _local_7:Rectangle = _arg_1.getRect(_arg_1);
            _arg_1.x = int((((this._width / 2) - (_local_7.x * _local_6)) - (_local_4 / 2)));
            _arg_1.y = int((((this._height / 2) - (_local_6 * _local_7.y)) - (_local_5 / 2)));
            return (this);
        }

        public function start_drag_handler(_arg_1:MouseEvent):void //_SafeStr_470
        {
            if (((_arg_1.target === _arg_1.currentTarget) || ((!(this.dragTargets == null)) && (!(this.dragTargets.indexOf(DisplayObject(_arg_1.target)) == -1)))))
            {
                if (((this.bringToFrontOnDrag) && (parent)))
                {
                    parent.addChild(this);
                };
                startDrag();
                DomainManager.stage.addEventListener(MouseEvent.MOUSE_UP, this.stop_drag_handler);
            };
        }

        public function stop_drag_handler(_arg_1:MouseEvent):void //_SafeStr_471
        {
            stopDrag();
        }

        public function get_drag_targets():Array //_SafeStr_472
        {
            var _local_2:DisplayObjectContainer;
            var _local_1:Array = new Array();
            if (!this.dragTargets)
            {
                return (_local_1);
            };
            for each (_local_2 in this.dragTargets)
            {
                _local_1.push(_local_2);
            };
            return (_local_1);
        }

        public function on_mouse_click(_arg_1:Function=null, _arg_2:Object=null, _arg_3:Boolean=true):UI_Sprite
        {
            mouseEnabled = true;
            this.onClick = _arg_1;
            this.onClickParam = _arg_2;
            if (Boolean(_arg_1))
            {
                addEventListener(MouseEvent.MOUSE_DOWN, this.on_click);
                if (_arg_3)
                {
                    UIUtility.setButtonStyle(this);
                };
            }
            else
            {
                removeEventListener(MouseEvent.MOUSE_DOWN, this.on_click);
                UIUtility.setButtonStyle(this, false);
            };
            return (this);
        }

        public function add_background(_arg_1:Event):void //_SafeStr_474
        {
            if (!this.backgroundShape)
            {
                this.backgroundShape = new Shape();
                this.backgroundShape.graphics.beginFill(this.backgroundColor, this.backgroundAlpha);
                this.backgroundShape.graphics.drawRect(0, 0, this._width, this._height);
                this.backgroundShape.graphics.endFill();
            };
            addChildAt(this.backgroundShape, 0);
        }

        public function update_tooltip(_arg_1:Event):void  //_SafeStr_475
        {
            if (!stage)
            {
                removeEventListener(Event.ENTER_FRAME, this.update_tooltip);
                return;
            };
            this.tooltip.x = this.tooltip.parent.mouseX;
            this.tooltip.y = (26 + this.tooltip.parent.mouseY);
        }

        public function on_mouse_over(_arg_1:Event):void //_SafeStr_476
        {
            callFunction(this.onMouseOver, this.onMouseOverParam);
        }

        public function set_tooltip_handler(_arg_1:Function, _arg_2:Object):void //_SafeStr_477
        {
            mouseEnabled = true;
            this.tooltipFactory = _arg_1;
            this.tooltipParam = _arg_2;
            addEventListener(MouseEvent.MOUSE_OVER, this.show_tooltip);
            addEventListener(MouseEvent.MOUSE_OUT, this.hide_tooltip);
        }

        public function on_click(_arg_1:Event):void //_SafeStr_478
        {
			callFunction(this.onClick, this.onClickParam);
            if (this.styleConfig.debugText)
            {
            //    _SafeStr_13029._SafeStr_7913(this.styleConfig.debugText, 0.7);
            };
        }

        public function set_background_handler(_arg_1:int, _arg_2:Number=1):void //_SafeStr_479
        {
            this.backgroundColor = _arg_1;
            this.backgroundAlpha = _arg_2;
            addEventListener(MouseEvent.MOUSE_OVER, this.add_background);
            addEventListener(MouseEvent.MOUSE_OUT, this.remove_background);
        }

        public static function callFunction(_arg_1:Function, _arg_2:Object):Object
        {
            if (Boolean(_arg_1))
            {
                if (_arg_2 != null)
                {
                    if ((_arg_2 is Array))
                    {
                        return (_arg_1.apply(null, (_arg_2 as Array).slice(0, _arg_1.length)));
                    };
                    return (_arg_1(_arg_2));
                };
                return (_arg_1());
            };
            return (null);
        }
	
	
    }
}//package 
