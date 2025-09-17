package ui.transformice
{
    import flash.display.Sprite;
    import flash.display.Shape;
    import __AS3__.vec.Vector;
    import flash.display.DisplayObject;
    import flash.geom.Rectangle;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    import __AS3__.vec.*;

    public class UI_Element extends UI_Sprite 
    {

        public static var defaultScrollAmount:int;

        public var boxSprite:Sprite;
        public var contentSprite:Sprite;
        public var isVerticalScrollbar:Boolean = false;
        public var scrollStep:int = 60;
        public var autoWidth:Boolean;
        public var autoHeight:Boolean;
        public var elementCount:int = 0;
        public var maxContentX:int = 0;
        public var maxContentY:int = 0;
        public var scrollbarColor:int = 0;
        public var isScrollable:Boolean = false;
        public var scrollbarVisible:Boolean = false;
        public var maskShape:Shape;
        public var isVirtualList:Boolean = false;
        public var virtualListStartIndex:int;
        public var lastScrollY:int;
        public var virtualListItemCount:int;
        public var virtualListHeight:int;
        public var virtualListItemFactory:Function;
        public var virtualListItems:Vector.<DisplayObject>;
        public var boxPadding:int = 10;
        public var boxAutoSize:Boolean;
        public var isBox:Boolean = false;
        public var boxClickHandler:Function;
        public var boxLabel:String;
        public var boxButtonSprite:Sprite;
        public var boxButtonNormalSprite:Sprite;
        public var boxButtonHoverSprite:Sprite;
        public var boxTitleLabel:UI_TextField;
        public var layoutConfig:LayoutConfig = LayoutConfig.DEFAULT_HORIZONTAL;
        public var layoutIndex:int = 0;
        public var layoutX:int = 0;
        public var layoutY:int = 0;
        public var layoutStartX:int = 0;
        public var layoutStartY:int = 0;
        public var layoutMaxX:int = 0;
        public var layoutMaxY:int = 0;
        public var layoutRowHeight:int = 0;
        public var layoutColumnWidth:int = 0;
        public var layoutOffsets:Vector.<int> = new Vector.<int>();
        public var isScrollbarAnimating:Boolean = false;
        public var scrollbarMaxY:int;
        public var scrollbarSprite:Sprite;
        public var scrollbarThumbSprite:Sprite;
        public var scrollbarDragOffset:int;
        public var lastScrollbarThumbY:int;
        public var scrollbarThumbHeight:int;
        public var overlaySprite:Sprite;
        public var overlayLabel:UI_TextField;

        public function UI_Element(_arg_1:int=0, _arg_2:int=0)
        {
            super(_arg_1, _arg_2);
            this.autoWidth = (_arg_1 == 0);
            this.autoHeight = (_arg_2 == 0);
            this.layoutMaxX = _arg_1;
            this.layoutMaxY = _arg_2;
            this.contentSprite = new Sprite();
            addChild(this.contentSprite);
        }

        public function set_layout(_arg_1:LayoutConfig, _arg_2:int=0, _arg_3:int=0, _arg_4:int=0, _arg_5:int=0):UI_Element
        {
            this.layoutConfig = _arg_1;
            this.layoutIndex = 0;
            this.layoutStartX = (_arg_2 + _arg_1.padding);
            this.layoutStartY = (_arg_1.padding + _arg_3);
            this.layoutX = this.layoutStartX;
            this.layoutY = this.layoutStartY;
            if (_arg_4)
            {
                this.layoutMaxX = _arg_4;
            }
            else
            {
                this.layoutMaxX = (_width - (_arg_1.padding * 2));
            };
            if (_arg_5)
            {
                this.layoutMaxY = _arg_5;
            }
            else
            {
                this.layoutMaxY = (_height - (_arg_1.padding * 2));
            };
            return (this);
        }

        public function update_box(_arg_1:Boolean=true, _arg_2:int=0, _arg_3:Boolean=false, _arg_4:Rectangle=null):void
        {
            var _local_5:Array;
            if (((this.boxSprite) && (this.boxSprite.parent)))
            {
                removeChild(this.boxSprite);
            };
            this.boxPadding = _arg_2;
            this.boxAutoSize = _arg_3;
            if (_arg_3)
            {
                _width = width;
                _height = height;
            };
            if (_arg_1)
            {
                if (this.isBox)
                {
                    this.boxSprite = DomainManager.getDefinition(("$FenetreBase" + "Fn"));
                    if (!this.boxSprite)
                    {
                        this.boxSprite = DomainManager.getDefinition("$FenetreBase");
                    };
                }
                else
                {
                    this.boxSprite = DomainManager.getDefinition("$FenetreBase");
                };
                if (_arg_4)
                {
                    this.boxSprite.x = _arg_4.x;
                    this.boxSprite.y = _arg_4.y;
                    this.boxSprite.width = _arg_4.width;
                    this.boxSprite.height = _arg_4.height;
                }
                else
                {
                    this.boxSprite.x = (-(_arg_2) - 1);
                    this.boxSprite.y = (-(_arg_2) - 2);
                    this.boxSprite.width = int(((_width + (_arg_2 * 2)) + 3));
                    this.boxSprite.height = int(((_height + (_arg_2 * 2)) + 4));
                    if (this.isBox)
                    {
                        this.boxSprite.y = (this.boxSprite.y - 20);
                        this.boxSprite.height = (this.boxSprite.height + 20);
                    };
                };
                this.boxSprite.cacheAsBitmap = true;
                this.boxSprite.mouseChildren = false;
                addChildAt(this.boxSprite, 0);
                if (is_draggable())
                {
                    _local_5 = get_drag_targets()();
                    _local_5.push(this.boxSprite);
                    _local_5.unshift(is_bringed_front());
                    this.set_draggable.apply(this, _local_5);
                };
            }
            else
            {
                if (((this.boxSprite) && (this.boxSprite.parent)))
                {
                    removeChild(this.boxSprite);
                };
            };
        }

        public function start_randomColorTimer():void
        {
            var randomColor:int;
            var element:UI_Element;
            randomColor = int((Math.random() * 0xFFFFFF));
            element = this;
            var timer:Timer = new Timer(1000);
            timer.start();
            timer.addEventListener(TimerEvent.TIMER, function (_arg_1:Event):void
            {
                UIUtility.debugDrawSprite(element, randomColor, _width, _height);
            });
        }

        public function save_scrollbarThumbY():void
        {
            this.lastScrollbarThumbY = this.contentSprite.y;
        }

        public function update_scroll(_arg_1:Boolean=true, _arg_2:int=0):void
        {
            var _local_3:int;
            if (this.scrollbarThumbSprite == null)
            {
                return;
            };
            if (((_arg_1) || (!(this.scrollbarVisible))))
            {
                _local_3 = 0;
            }
            else
            {
                _local_3 = this.scrollbarMaxY;
            };
            this.scrollbarThumbSprite.y = _local_3;
            var _local_4:Number = (_local_3 / this.scrollbarMaxY);
            var _local_5:int = (_height - this.get_contentHeight());
            this.contentSprite.y = (_local_5 * _local_4);
            if (_arg_2)
            {
                this.lastScrollbarThumbY = _arg_2;
            }
            else
            {
                this.lastScrollbarThumbY = this.contentSprite.y;
            };
        }

        public function get_contentChildAt(_arg_1:int):DisplayObject
        {
            if (_arg_1 < this.contentSprite.numChildren)
            {
                return (this.contentSprite.getChildAt(_arg_1));
            };
            return (null);
        }

        public function set_scrollable(_arg_1:Boolean, _arg_2:int=60, _arg_3:Boolean=false):void
        {
            this.isScrollable = _arg_1;
            this.scrollStep = ((UI_Element.defaultScrollAmount) ? UI_Element.defaultScrollAmount : _arg_2);
            this.isVerticalScrollbar = _arg_3;
        }

        public function scroll_toView(_arg_1:DisplayObject):void
        {
            if (null == this.scrollbarThumbSprite)
            {
                return;
            };
            var _local_2:int = ((_arg_1 is UI_Sprite) ? UI_Sprite(_arg_1)._height : _arg_1.height);
            if (this.is_inView(_arg_1, true))
            {
                return;
            };
            var _local_3:* = ((-(this.contentSprite.y) + (_height / 2)) >= (_arg_1.y + (_local_2 / 2)));
            var _local_4:int = this.scrollStep;
            this.scrollStep = 1;
            if (_local_2 <= _height)
            {
                while ((!(this.is_inView(_arg_1, true))))
                {
                    this.scrollBy(((_local_3) ? 1 : -1));
                };
            };
            this.scrollStep = _local_4;
        }

        public function reset_ui(_arg_1:Boolean=false):Vector.<DisplayObject>
        {
            var _local_3:Vector.<DisplayObject>;
            this.save_scrollbarThumbY();
            var _local_2:Boolean = ((this.maskShape) && (this.maskShape.parent));
            this.lastScrollY = 999999;
            if (_arg_1)
            {
                _local_3 = new Vector.<DisplayObject>();
            };
            this.contentSprite.y = 0;
            if (_arg_1)
            {
                while (this.contentSprite.numChildren)
                {
                    _local_3.push(this.contentSprite.removeChildAt(0));
                };
            }
            else
            {
                while (this.contentSprite.numChildren)
                {
                    this.contentSprite.removeChildAt(0);
                };
            };
            while (numChildren)
            {
                removeChildAt(0);
            };
            if (this.boxSprite)
            {
                addChild(this.boxSprite);
            };
            addChild(this.contentSprite);
            if (_local_2)
            {
                addChild(this.maskShape);
            };
            if (this.boxButtonSprite)
            {
                addChild(this.boxButtonSprite);
            };
            if (this.boxTitleLabel)
            {
                addChild(this.boxTitleLabel);
            };
            this.elementCount = 0;
            this.layoutX = this.layoutStartX;
            this.layoutY = this.layoutStartY;
            this.layoutIndex = 0;
            this.layoutColumnWidth = 0;
            this.layoutRowHeight = 0;
            this.maxContentX = 0;
            this.maxContentY = 0;
            this.layoutOffsets = new Vector.<int>();
            this.update_scrollbar();
            return (_local_3);
        }

        public function update_scrollbar():void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:Number;
            if (!this.isScrollable)
            {
                return;
            };
            var _local_1:int = this.get_contentHeight();
            if (_height < _local_1)
            {
                if (!this.scrollbarVisible)
                {
                    this.scrollbarVisible = true;
                    addEventListener(MouseEvent.MOUSE_WHEEL, this.handle_mouseWheel);
                    if (!this.maskShape)
                    {
                        this.maskShape = new Shape();
                        this.maskShape.graphics.beginFill(0xFF0000);
                        this.maskShape.graphics.drawRect(-1, -1, ((_width - styleConfig.scrollbarWidth) - 2), (_height + 2));
                        this.maskShape.graphics.endFill();
                    };
                    addChild(this.maskShape);
                    this.contentSprite.mask = this.maskShape;
                    graphics.beginFill(0xFF0000, 0);
                    graphics.drawRect(0, 0, _width, _height);
                    graphics.endFill();
                };
            }
            else
            {
                if (this.scrollbarVisible)
                {
                    this.scrollbarVisible = false;
                    removeEventListener(MouseEvent.MOUSE_WHEEL, this.handle_mouseWheel);
                    this.contentSprite.y = 0;
                    if (((this.maskShape) && (this.maskShape.parent)))
                    {
                        this.maskShape.parent.removeChild(this.maskShape);
                    };
                    this.contentSprite.mask = null;
                    if (((this.scrollbarSprite) && (this.scrollbarSprite.parent)))
                    {
                        this.scrollbarSprite.parent.removeChild(this.scrollbarSprite);
                    };
                };
            };
            if (this.scrollbarVisible)
            {
                if (!this.scrollbarSprite)
                {
                    this.scrollbarSprite = new Sprite();
                    this.scrollbarSprite.graphics.beginFill(styleConfig.scrollbarBackgroundColor);
                    this.scrollbarSprite.graphics.drawRect(0, 0, styleConfig.scrollbarWidth, _height);
                    this.scrollbarSprite.graphics.endFill();
                    if (!this.isVerticalScrollbar)
                    {
                        this.scrollbarSprite.x = (-(styleConfig.scrollbarWidth) + _width);
                    };
                    this.scrollbarThumbSprite = new Sprite();
                    this.scrollbarSprite.addChild(this.scrollbarThumbSprite);
                    this.scrollbarThumbSprite.addEventListener(MouseEvent.MOUSE_DOWN, this.start_scrollbarDrag);
                    UIUtility.setButtonStyle(this.scrollbarThumbSprite, true);
                };
                if (!this.scrollbarSprite.parent)
                {
                    addChild(this.scrollbarSprite);
                };
                this.prepare_scrollbarAnimation();
                _local_2 = this.contentSprite.y;
                _local_3 = (_height - this.get_contentHeight());
                if (((_local_2 > 0) || (_local_2 < _local_3)))
                {
                    if (0 < _local_2)
                    {
                        _local_2 = 0;
                    }
                    else
                    {
                        if (_local_2 < _local_3)
                        {
                            _local_2 = _local_3;
                        };
                    };
                    this.contentSprite.y = _local_2;
                    _local_4 = (_local_2 / _local_3);
                    this.scrollbarThumbSprite.y = ((_height - this.scrollbarThumbHeight) * _local_4);
                };
            };
        }

        public function get_layoutPosition(_arg_1:Boolean=true):int
        {
            if (this.layoutConfig.customPositions)
            {
                return (0);
            };
            if (this.layoutConfig.isHorizontalLayout())
            {
                return ((_arg_1) ? this.layoutX : (this.layoutX - this.layoutConfig.horizontalSpacing));
            };
            return ((_arg_1) ? this.layoutY : (this.layoutY - this.layoutConfig.verticalSpacing));
        }

        public function fill_background(_arg_1:int, _arg_2:Number=1):void
        {
            graphics.clear();
            graphics.beginFill(_arg_1, _arg_2);
            graphics.drawRect((-(x) - 100), (-(y) - 100), (DomainManager.stage.stageWidth + 200), (DomainManager.stage.stageHeight + 200));
            graphics.endFill();
        }

        public function get_contentHeight():int
        {
            if (this.isVirtualList)
            {
                return (this.virtualListHeight);
            };
            if (this.layoutConfig.isHorizontalLayout())
            {
                return (this.contentSprite.height);
            };
            return ((this.contentSprite.height > this.get_layoutPosition(false)) ? this.contentSprite.height : this.get_layoutPosition(false));
        }

        public function add_layoutOffset(_arg_1:int):void
        {
            if (this.layoutConfig.isHorizontalLayout())
            {
                this.layoutX = (this.layoutX + _arg_1);
            }
            else
            {
                this.layoutY = (this.layoutY + _arg_1);
            };
            this.layoutOffsets.push(this.contentSprite.numChildren, _arg_1);
        }

        public function is_inView(_arg_1:DisplayObject, _arg_2:Boolean):Boolean
        {
            if (((!(_arg_1)) || (!(_arg_1.parent == this.contentSprite))))
            {
                return (false);
            };
            if (null == this.scrollbarThumbSprite)
            {
                return (true);
            };
            var _local_3:int = ((_arg_1 is UI_Sprite) ? UI_Sprite(_arg_1)._height : _arg_1.height);
            if (_arg_2)
            {
                return ((-(this.contentSprite.y) <= _arg_1.y) && ((-(this.contentSprite.y) + _height) >= (_local_3 + _arg_1.y)));
            };
            return ((((-(this.contentSprite.y) <= _arg_1.y) && ((-(this.contentSprite.y) + _height) > _arg_1.y)) || ((-(this.contentSprite.y) < (_arg_1.y + _local_3)) && ((-(this.contentSprite.y) + _height) >= (_arg_1.y + _local_3)))) || ((-(this.contentSprite.y) >= _arg_1.y) && ((-(this.contentSprite.y) + _height) <= (_arg_1.y + _local_3))));
        }

        public function set_prep_ui(_arg_1:LayoutDirection, _arg_2:int=2):UI_Element
        {
            this.set_layout(new LayoutConfig(_arg_1, _arg_2));
            return (this);
        }

        public function handle_contentChange(_arg_1:Event=null):void
        {
            var _local_4:int;
            var _local_6:int;
            var _local_7:int;
            var _local_8:int;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            if (((!(this.contentSprite.numChildren == 1)) || (!(this.contentSprite.getChildAt(0) is UI_Input))))
            {
                return;
            };
            if (this.scrollbarThumbSprite == null)
            {
                return;
            };
            var _local_2:UI_Input = UI_Input(this.contentSprite.getChildAt(0));
            var _local_3:int = this.scrollStep;
            var _local_5:int;
            do 
            {
                _local_6 = (_local_2.textField.getFontSize() + 4);
                _local_7 = _local_2.textField.caretIndex;
                _local_8 = ((-(this.contentSprite.y) + _local_6) - 4);
                _local_9 = ((-(this.contentSprite.y) + _height) - _local_6);
                _local_10 = _local_2.textField.getLineIndexOfChar(_local_7);
                _local_11 = _local_2.textField.getLineIndexAtPoint(1, _local_8);
                _local_12 = _local_2.textField.getLineIndexAtPoint(1, _local_9);
                if (_local_10 == -1)
                {
                    if (_local_2.textField.length == _local_7)
                    {
                        _local_10 = (-1 + _local_2.textField.numLines);
                    }
                    else
                    {
                        return;
                    };
                };
                if (_local_11 > _local_10)
                {
                    _local_4 = -1;
                }
                else
                {
                    if (_local_12 < _local_10)
                    {
                        _local_4 = 1;
                    }
                    else
                    {
                        _local_4 = 0;
                    };
                };
                if (_local_4 != 0)
                {
                    this.scrollStep = 1;
                    this.scrollBy(-(_local_4));
                };
            } while (((!(_local_4 == 0)) && (_local_5++ < 1000)));
            this.scrollStep = _local_3;
        }

        public function refresh_scrollbar():void
        {
            this.update_scrollbar();
        }

        public function prepare_scrollbarAnimation():void
        {
            if ((((!(this.isScrollbarAnimating)) && (this.scrollbarSprite)) && (this.scrollbarSprite.parent)))
            {
                this.isScrollbarAnimating = true;
                this.scrollbarThumbSprite.visible = false;
                addEventListener("enterFrame", this.finish_scrollbarAnimation);
            };
        }

        public function handle_boxClick(_arg_1:Event):void
        {
            if (this.boxClickHandler != null)
            {
                if (styleConfig.debugText)
                {
                   //MUSIC// _SafeStr_13029._SafeStr_7913(styleConfig.debugText);
                };
                this.boxClickHandler();
            };
        }

        public function resize(_arg_1:int, _arg_2:int):void
        {
            var _local_3:Boolean;
            var _local_4:Rectangle;
            var _local_5:Array;
            _width = _arg_1;
            _height = _arg_2;
            this.autoWidth = (_arg_1 == 0);
            this.autoHeight = (_arg_2 == 0);
            this.layoutMaxX = _arg_1;
            this.layoutMaxY = _arg_2;
            if (this.isBox)
            {
                this.set_box(this.boxLabel, this.boxClickHandler, this.boxPadding);
            }
            else
            {
                if (((this.boxSprite) && (this.boxSprite.parent)))
                {
                    _local_3 = (!(this.boxSprite.width == int(((_width + (this.boxPadding * 2)) + 3))));
                    if (_local_3)
                    {
                        _local_4 = new Rectangle(this.boxSprite.x, this.boxSprite.y, this.boxSprite.width, this.boxSprite.height);
                        this.update_box(true, 0, false, _local_4);
                    }
                    else
                    {
                        this.update_box(true, this.boxPadding);
                    };
                    if (is_draggable())
                    {
                        _local_5 = get_drag_targets()();
                        if (_local_5.indexOf(this.contentSprite) != -1)
                        {
                            this.set_draggable(is_bringed_front());
                        }
                        else
                        {
                            _local_5.unshift(is_bringed_front());
                            this.set_draggable.apply(this, _local_5);
                        };
                    };
                };
            };
            if (this.isScrollable)
            {
                if (((this.scrollbarSprite) && (this.scrollbarSprite.parent)))
                {
                    this.scrollbarSprite.parent.removeChild(this.scrollbarSprite);
                };
                this.scrollbarSprite = null;
                if (this.maskShape)
                {
                    if (this.maskShape.parent)
                    {
                        this.maskShape.parent.removeChild(this.maskShape);
                    };
                    this.contentSprite.mask = null;
                    this.maskShape = null;
                };
                this.scrollbarVisible = false;
                this.update_scrollbar();
            };
        }

        public function handle_scrollbarDrag(_arg_1:Event):void
        {
            if (!stage)
            {
                this.stop_scrollbarDrag(null);
                return;
            };
            var _local_2:int = (-(this.scrollbarDragOffset) + this.scrollbarSprite.mouseY);
            if (0 > _local_2)
            {
                _local_2 = 0;
            }
            else
            {
                if (this.scrollbarMaxY < _local_2)
                {
                    _local_2 = this.scrollbarMaxY;
                };
            };
            this.scrollbarThumbSprite.y = _local_2;
            var _local_3:Number = (_local_2 / this.scrollbarMaxY);
            var _local_4:int = (_height - this.get_contentHeight());
            this.contentSprite.y = (_local_4 * _local_3);
            if (this.isVirtualList)
            {
                this.update_virtualList();
            };
        }

        public function add_column(_arg_1:int, _arg_2:int):UI_Element
        {
            var _local_3:UI_Element = new UI_Element(_arg_1, _arg_2);
            _local_3.set_prep_ui(LayoutDirection.HORIZONTAL);
            this.add_ui_element(_local_3);
            return (_local_3);
        }

        public function finish_scrollbarAnimation(_arg_1:Event):void
        {
            var _local_5:int;
            var _local_2:int = this.get_contentHeight();
            if (this.lastScrollbarThumbY)
            {
                _local_5 = (_height - _local_2);
                if (_local_5 < 0)
                {
                    if (_local_5 > this.lastScrollbarThumbY)
                    {
                        this.lastScrollbarThumbY = _local_5;
                    };
                    this.contentSprite.y = this.lastScrollbarThumbY;
                    this.lastScrollbarThumbY = 0;
                };
            };
            removeEventListener("enterFrame", this.finish_scrollbarAnimation);
            this.isScrollbarAnimating = false;
            var _local_3:Number = (_height / _local_2);
            this.scrollbarThumbHeight = (_height * _local_3);
            if (this.scrollbarThumbHeight < 40)
            {
                this.scrollbarThumbHeight = 40;
            };
            this.scrollbarMaxY = (_height - this.scrollbarThumbHeight);
            this.scrollbarThumbSprite.visible = true;
            this.scrollbarThumbSprite.graphics.clear();
            this.scrollbarThumbSprite.graphics.beginFill(0, 0);
            this.scrollbarThumbSprite.graphics.drawRect(-7, 0, 14, this.scrollbarThumbHeight);
            this.scrollbarThumbSprite.graphics.beginFill(((this.scrollbarColor) ? this.scrollbarColor : styleConfig.scrollbarColor));
            this.scrollbarThumbSprite.graphics.drawRect(0, 0, styleConfig.scrollbarWidth, this.scrollbarThumbHeight);
            this.scrollbarThumbSprite.graphics.endFill();
            var _local_4:Number = (this.contentSprite.y / (_height - _local_2));
            this.scrollbarThumbSprite.y = (_local_4 * (-(this.scrollbarThumbHeight) + _height));
            if (this.isVirtualList)
            {
                this.update_virtualList();
            };
        }

        public function handle_boxMouseOut(_arg_1:Event):void
        {
            if (this.boxButtonHoverSprite.parent)
            {
                this.boxButtonHoverSprite.parent.removeChild(this.boxButtonHoverSprite);
            };
            this.boxButtonSprite.addChild(this.boxButtonNormalSprite);
        }

        public function add_layoutOffsetAlt(_arg_1:int):void
        {
            if (this.layoutConfig.isHorizontalLayout())
            {
                this.layoutY = (this.layoutY + _arg_1);
            }
            else
            {
                this.layoutX = (this.layoutX + _arg_1);
            };
            this.layoutOffsets.push(this.contentSprite.numChildren, _arg_1);
        }

        override public function set_draggable(_arg_1:Boolean=true, ... _args):void
        {
            if (0 == _args.length)
            {
                _args = new Array();
                _args.push(this.contentSprite);
                if (((this.boxSprite) && (this.boxSprite.parent)))
                {
                    _args.push(this.boxSprite);
                };
            };
            _args.unshift(_arg_1);
            super.set_draggable.apply(this, _args);
        }

        public function get_layoutPadding():int
        {
            return (this.layoutConfig.padding);
        }

        public function handle_mouseWheel(_arg_1:MouseEvent):void
        {
            var _local_2:int = ((_arg_1.delta < 0) ? -1 : 1);
            this.scrollBy(_local_2);
        }

        public function get_boxTitleLabel():UI_TextField
        {
            return (this.boxTitleLabel);
        }

        public function toggle_contentListeners(_arg_1:Boolean=true):void
        {
            var _local_2:Function;
            if (_arg_1)
            {
                _local_2 = addEventListener;
            }
            else
            {
                _local_2 = removeEventListener;
            };
            (_local_2(Event.CHANGE, this.handle_contentChange));
            (_local_2(KeyboardEvent.KEY_UP, this.handle_contentChange));
            (_local_2(KeyboardEvent.KEY_DOWN, this.handle_contentChange));
            (_local_2(MouseEvent.CLICK, this.handle_contentChange));
        }

        public function draw_Seperator(_arg_1:Number=0.8):void
        {
            var _local_4:int;
            var _local_2:int = styleConfig.borderLightColor;
            var _local_3:int = styleConfig.borderDarkColor;
            var _local_5:Shape = new Shape();
            _local_5.graphics.lineStyle(1, _local_2);
            if (this.layoutConfig.isHorizontalLayout())
            {
                _local_4 = (_arg_1 * _height);
                _local_5.graphics.lineTo(0, _local_4);
                _local_5.graphics.moveTo(1, 0);
                _local_5.graphics.lineStyle(1, _local_3);
                _local_5.graphics.lineTo(1, _local_4);
                _local_5.x = this.layoutX;
                _local_5.y = int(((_height - _local_4) / 2));
                this.layoutX = (this.layoutX + (this.layoutConfig.horizontalSpacing + 2));
            }
            else
            {
                _local_4 = (_arg_1 * _width);
                _local_5.graphics.lineTo(_local_4, 0);
                _local_5.graphics.moveTo(0, 1);
                _local_5.graphics.lineStyle(1, _local_3);
                _local_5.graphics.lineTo(_local_4, 1);
                _local_5.x = int(((-(_local_4) + _width) / 2));
                _local_5.y = this.layoutY;
                this.layoutY = (this.layoutY + (2 + this.layoutConfig.verticalSpacing));
            };
            this.contentSprite.addChild(_local_5);
        }

        public function get_layoutSpacing():int
        {
            return ((this.layoutConfig.isHorizontalLayout()) ? this.layoutConfig.horizontalSpacing : this.layoutConfig.verticalSpacing);
        }

        public function set_shape(_arg_1:int, _arg_2:int, _arg_3:Boolean, _arg_4:int, _arg_5:int=0, _arg_6:int=0):Shape
        {
            if (((!(_arg_5)) && (!(_arg_6))))
            {
                _arg_5 = styleConfig.borderLightColor;
                _arg_6 = styleConfig.borderDarkColor;
            };
            var _local_7:Shape = new Shape();
            _local_7.graphics.lineStyle(1, _arg_5);
            if (_arg_3)
            {
                _local_7.graphics.lineTo(_arg_4, 0);
                _local_7.graphics.moveTo(0, 1);
                _local_7.graphics.lineStyle(1, _arg_6);
                _local_7.graphics.lineTo(_arg_4, 1);
            }
            else
            {
                _local_7.graphics.lineTo(0, _arg_4);
                _local_7.graphics.moveTo(1, 0);
                _local_7.graphics.lineStyle(1, _arg_6);
                _local_7.graphics.lineTo(1, _arg_4);
            };
            _local_7.x = _arg_1;
            _local_7.y = _arg_2;
            this.contentSprite.addChild(_local_7);
            return (_local_7);
        }

        public function add_ui_element(_arg_1:DisplayObject, ... _args):void
        {
            var _local_3:int;
            var _local_4:int;
            this.elementCount++;
            this.place_childInLayout(_arg_1);
            if (((_args) && (_args.length)))
            {
                _local_3 = -1;
                _local_4 = _args.length;
                while (++_local_3 < _local_4)
                {
                    this.add_ui_element(DisplayObject(_args[_local_3]));
                };
            };
            this.update_scrollbar();
        }

        public function scrollBy(_arg_1:int):void
        {
            if (null == this.scrollbarThumbSprite)
            {
                return;
            };
            var _local_2:int = (this.contentSprite.y + (this.scrollStep * _arg_1));
            var _local_3:int = (_height - this.get_contentHeight());
            if (_local_2 > 0)
            {
                _local_2 = 0;
            }
            else
            {
                if (_local_3 > _local_2)
                {
                    _local_2 = _local_3;
                };
            };
            this.contentSprite.y = _local_2;
            var _local_4:Number = (_local_2 / _local_3);
            this.scrollbarThumbSprite.y = ((_height - this.scrollbarThumbHeight) * _local_4);
            if (this.isVirtualList)
            {
                this.update_virtualList();
            };
        }

        public function set_virtualList(_arg_1:int, _arg_2:int, _arg_3:Function):void
        {
            if (this.isScrollable)
            {
                this.isVirtualList = true;
                this.lastScrollY = 999999;
                this.virtualListStartIndex = _arg_1;
                this.virtualListItemCount = _arg_2;
                this.virtualListHeight = (_arg_2 * (this.layoutConfig.verticalSpacing + _arg_1));
                this.virtualListItemFactory = _arg_3;
                this.virtualListItems = new Vector.<DisplayObject>();
                this.update_virtualList();
                this.update_scrollbar();
            };
        }

        public function get_lastChildBottom():int
        {
            if (!this.contentSprite.numChildren)
            {
                return (0);
            };
            var _local_1:UI_Sprite = (this.contentSprite.getChildAt((-1 + this.contentSprite.numChildren)) as UI_Sprite);
            if (_local_1)
            {
                return (_local_1.y + _local_1._height);
            };
            return (0);
        }

        public function update_virtualList():void
        {
            var _local_10:DisplayObject;
            var _local_11:DisplayObject;
            var _local_1:int = this.contentSprite.y;
            if (Math.abs((_local_1 - this.lastScrollY)) < this.virtualListStartIndex)
            {
                return;
            };
            this.lastScrollY = _local_1;
            var _local_2:int = (this.layoutConfig.verticalSpacing + this.virtualListStartIndex);
            var _local_3:int = int((Math.ceil((_height / _local_2)) + 5));
            var _local_4:int = int((-(this.contentSprite.y) / _local_2));
            var _local_5:int = (-2 + _local_4);
            var _local_6:int = (_local_3 + _local_5);
            if (0 > _local_5)
            {
                _local_5 = 0;
            };
            if (this.virtualListItemCount < _local_6)
            {
                _local_6 = this.virtualListItemCount;
            };
            var _local_7:int = -1;
            var _local_8:int = this.virtualListItems.length;
            while (++_local_7 < _local_8)
            {
                _local_10 = this.virtualListItems[_local_7];
                if (_local_10.parent)
                {
                    this.contentSprite.removeChild(_local_10);
                };
            };
            this.virtualListItems = new Vector.<DisplayObject>();
            var _local_9:int = _local_5;
            while (_local_9 < _local_6)
            {
                _local_11 = this.virtualListItemFactory(_local_9);
                if (_local_11)
                {
                    _local_11.y = (_local_2 * _local_9);
                    this.contentSprite.addChild(_local_11);
                    this.virtualListItems.push(_local_11);
                };
                _local_9++;
            };
        }

        public function restore_UI():void
        {
            var _local_5:DisplayObject;
            var _local_6:int;
            var _local_1:Vector.<int> = this.layoutOffsets;
            var _local_2:Vector.<DisplayObject> = this.reset_ui(true);
            var _local_3:int;
            var _local_4:int = _local_2.length;
            while (_local_3 < _local_4)
            {
                if (((_local_1.length > 0) && (_local_1[0] == _local_3)))
                {
                    this.add_layoutOffset(_local_1[1]);
                    _local_1.splice(0, 2);
                };
                _local_5 = _local_2[_local_3];
                _local_6 = ((this.layoutConfig.isHorizontalLayout()) ? _local_5.y : _local_5.x);
                this.add_ui_element(_local_5);
                if (this.layoutConfig.isHorizontalLayout())
                {
                    _local_5.y = _local_6;
                }
                else
                {
                    _local_5.x = _local_6;
                };
                _local_3++;
            };
            if (this.isScrollable)
            {
                if (((this.scrollbarSprite) && (this.scrollbarSprite.parent)))
                {
                    this.scrollbarSprite.parent.removeChild(this.scrollbarSprite);
                };
                this.scrollbarSprite = null;
                if (this.maskShape)
                {
                    if (this.maskShape.parent)
                    {
                        this.maskShape.parent.removeChild(this.maskShape);
                    };
                    this.contentSprite.mask = null;
                    this.maskShape = null;
                };
                this.scrollbarVisible = false;
                this.update_scrollbar();
            };
        }

        public function start_scrollbarDrag(_arg_1:Event):void
        {
            this.scrollbarDragOffset = this.scrollbarThumbSprite.mouseY;
            addEventListener("enterFrame", this.handle_scrollbarDrag);
            stage.addEventListener(MouseEvent.MOUSE_UP, this.stop_scrollbarDrag);
        }

        public function add_row(_arg_1:int, _arg_2:int):UI_Element
        {
            var _local_3:UI_Element = new UI_Element(_arg_1, _arg_2);
            _local_3.set_prep_ui(LayoutDirection.VERTICAL);
            this.add_ui_element(_local_3);
            return (_local_3);
        }

        public function handle_boxMouseOver(_arg_1:Event):void
        {
            if (this.boxButtonNormalSprite.parent)
            {
                this.boxButtonNormalSprite.parent.removeChild(this.boxButtonNormalSprite);
            };
            this.boxButtonSprite.addChild(this.boxButtonHoverSprite);
        }

        public function stop_scrollbarDrag(_arg_1:Event):void
        {
            removeEventListener("enterFrame", this.handle_scrollbarDrag);
            if (stage)
            {
                stage.removeEventListener(MouseEvent.MOUSE_UP, this.stop_scrollbarDrag);
            };
        }

        public function place_childInLayout(_arg_1:DisplayObject):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_5:UI_Sprite;
            if (this.isVirtualList)
            {
                _local_3 = this.virtualListStartIndex;
            }
            else
            {
                if (_arg_1)
                {
                    if ((_arg_1 is UI_Sprite))
                    {
                        _local_5 = (_arg_1 as UI_Sprite);
                        _local_2 = _local_5._width;
                        _local_3 = _local_5._height;
                    }
                    else
                    {
                        _local_2 = _arg_1.width;
                        _local_3 = _arg_1.height;
                    };
                };
            };
            var _local_4:* = (!(this.layoutConfig.customPositions == null));
            if (_local_4)
            {
                this.layoutX = this.layoutConfig.customPositions[(this.layoutIndex * 2)];
                this.layoutY = this.layoutConfig.customPositions[((this.layoutIndex * 2) + 1)];
                this.layoutIndex = ((this.layoutIndex + 1) % int((this.layoutConfig.customPositions.length / 2)));
            }
            else
            {
                if (this.elementCount > 1)
                {
                    if (this.layoutConfig.direction == LayoutDirection.VERTICAL)
                    {
                        if ((this.layoutX + _local_2) > this.layoutMaxX)
                        {
                            this.layoutX = this.layoutStartX;
                            this.layoutY = (this.layoutY + (this.layoutConfig.verticalSpacing + this.layoutRowHeight));
                            this.layoutRowHeight = 0;
                        };
                    }
                    else
                    {
                        if (this.layoutConfig.direction == LayoutDirection.WRAP_VERTICAL)
                        {
                            if ((this.layoutY + _local_3) > this.layoutMaxY)
                            {
                                this.layoutY = this.layoutStartY;
                                this.layoutX = (this.layoutX + (this.layoutConfig.horizontalSpacing + this.layoutColumnWidth));
                                this.layoutColumnWidth = 0;
                            };
                        }
                        else
                        {
                            if (LayoutDirection.REVERSE_HORIZONTAL == this.layoutConfig.direction)
                            {
                                if ((this.layoutX + _local_2) > this.layoutMaxX)
                                {
                                    this.layoutX = this.layoutStartX;
                                    this.layoutY = (this.layoutY - (this.layoutConfig.verticalSpacing + this.layoutRowHeight));
                                    this.layoutRowHeight = 0;
                                };
                            };
                        };
                    };
                };
            };
            if (_arg_1)
            {
                _arg_1.x = this.layoutX;
                _arg_1.y = this.layoutY;
                this.contentSprite.addChild(_arg_1);
                if (this.autoWidth)
                {
                    _width = (width + (this.layoutConfig.padding * 2));
                };
                if (this.autoHeight)
                {
                    _height = (height + (this.layoutConfig.padding * 2));
                };
            };
            if (!_local_4)
            {
                if (LayoutDirection.HORIZONTAL == this.layoutConfig.direction)
                {
                    if (_local_3 > this.layoutRowHeight)
                    {
                        this.layoutRowHeight = _local_3;
                    };
                    this.layoutX = (this.layoutX + (this.layoutConfig.horizontalSpacing + _local_2));
                }
                else
                {
                    if (LayoutDirection.WRAP_HORIZONTAL == this.layoutConfig.direction)
                    {
                        if (_local_3 > this.layoutRowHeight)
                        {
                            this.layoutRowHeight = _local_3;
                        };
                        this.layoutX = (this.layoutX + (_local_2 + this.layoutConfig.horizontalSpacing));
                    }
                    else
                    {
                        if (LayoutDirection.VERTICAL == this.layoutConfig.direction)
                        {
                            this.layoutY = (this.layoutY + (this.layoutConfig.verticalSpacing + _local_3));
                        }
                        else
                        {
                            if (LayoutDirection.WRAP_VERTICAL == this.layoutConfig.direction)
                            {
                                if (this.layoutColumnWidth < _local_2)
                                {
                                    this.layoutColumnWidth = _local_2;
                                };
                                this.layoutY = (this.layoutY + (this.layoutConfig.verticalSpacing + _local_3));
                            }
                            else
                            {
                                if (LayoutDirection.REVERSE_HORIZONTAL == this.layoutConfig.direction)
                                {
                                    if (this.layoutRowHeight < _local_3)
                                    {
                                        this.layoutRowHeight = _local_3;
                                    };
                                    this.layoutX = (this.layoutX + (_local_2 + this.layoutConfig.horizontalSpacing));
                                }
                                else
                                {
                                    if (LayoutDirection.CENTER == this.layoutConfig.direction)
                                    {
                                        if (_arg_1)
                                        {
                                            _arg_1.x = int(((-(_local_2) + _width) / 2));
                                        };
                                        this.layoutY = (this.layoutY + (_local_3 + this.layoutConfig.verticalSpacing));
                                    };
                                };
                            };
                        };
                    };
                };
            };
            if (this.layoutConfig.isHorizontalLayout())
            {
                this.maxContentX = Math.max(this.maxContentX, (this.layoutX - this.layoutConfig.horizontalSpacing));
                this.maxContentY = Math.max(this.maxContentY, (this.layoutY + _local_3));
            }
            else
            {
                this.maxContentX = Math.max(this.maxContentX, (this.layoutX + _local_2));
                this.maxContentY = Math.max(this.maxContentY, (this.layoutY - this.layoutConfig.verticalSpacing));
            };
        }

        public function set_box(_arg_1:String, _arg_2:Function=null, _arg_3:int=10):UI_Element
        {
            this.isBox = true;
            this.boxLabel = _arg_1;
            this.boxClickHandler = _arg_2;
            this.update_box(true, _arg_3, this.boxAutoSize);
            if (((this.boxTitleLabel) && (this.boxTitleLabel.parent)))
            {
                this.boxTitleLabel.parent.removeChild(this.boxTitleLabel);
            };
            this.boxTitleLabel = new UI_TextField(this.boxLabel, _width, 22).setFontSize(14).setTextColor(DomainManager.boxTitleColor).setAlignment("center");
            this.boxTitleLabel.y = (-(_arg_3) - 19);
            addChild(this.boxTitleLabel);
            if (((this.boxButtonSprite) && (this.boxButtonSprite.parent)))
            {
                this.boxButtonSprite.parent.removeChild(this.boxButtonSprite);
            };
            this.boxButtonSprite = null;
            if (this.boxClickHandler != null)
            {
                this.boxButtonSprite = new Sprite();
                this.boxButtonSprite.cacheAsBitmap = true;
                this.boxButtonSprite.mouseChildren = false;
                this.boxButtonSprite.useHandCursor = true;
                this.boxButtonSprite.buttonMode = true;
                this.boxButtonNormalSprite = DomainManager.getDefinition(styleConfig.closeButtonNormalAsset);
                this.boxButtonHoverSprite = DomainManager.getDefinition(styleConfig.closeButtonHoverAsset);
                this.boxButtonSprite.addChild(this.boxButtonNormalSprite);
                this.boxButtonSprite.addEventListener(MouseEvent.MOUSE_OVER, this.handle_boxMouseOver);
                this.boxButtonSprite.addEventListener(MouseEvent.MOUSE_OUT, this.handle_boxMouseOut);
                this.boxButtonSprite.addEventListener(MouseEvent.MOUSE_DOWN, this.handle_boxClick);
                this.boxButtonSprite.width = 20;
                this.boxButtonSprite.height = 20;
                this.boxButtonSprite.x = ((int((-(this.boxButtonSprite.width) + _width)) + _arg_3) + styleConfig.closeButtonOffset);
                this.boxButtonSprite.y = (-(_arg_3) - 19);
                addChild(this.boxButtonSprite);
            };
            return (this);
        }


    }
}
