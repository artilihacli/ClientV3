package ui.transformice
{
    import __AS3__.vec.Vector;
    import flash.events.Event;
    import flash.geom.Point;
    import __AS3__.vec.*;
    import ChargeurTransformice_fla.Keys;

    public class UI_List extends UI_Sprite 
    {

        public static var EMPTY_ITEM:UI_ListItem = new UI_ListItem("-", null, null, -(1)); // _SafeStr_12127

        public var items:Vector.<UI_ListItem> = new Vector.<UI_ListItem>(); // _SafeStr_1995 - list of items
        public var selectedIndex:int = -1; // _SafeStr_3779 - currently selected item index
        public var dropdownElement:UI_Element; // _SafeStr_3780 - dropdown container

        public function UI_List(width:int) //_SafeStr_12838
        {
            super(width, 25);
            this.updateDisplay(); //_SafeStr_3384
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage); //_SafeStr_3784
        }

        public function add_to_list(text:String, callback:Function, params:Object=null, autoSelect:Boolean=false):UI_List //_SafeStr_12838
        {
            this.items.push(new UI_ListItem(text, callback, params, this.items.length)); //_SafeStr_1995
            if (this.selectedIndex == -1) //_SafeStr_3779
            {
                this.select_item(0);
            }
            else
            {
                if (autoSelect)
                {
                    this.select_item((this.items.length - 1)); //_SafeStr_1995
                };
            };
            this.dropdownElement = null; //_SafeStr_3780
            return (this);
        }

        public function select_item(index:int):UI_List //_SafeStr_12838
        {
            if (this.selectedIndex == index) //_SafeStr_3779
            {
                return (this);
            };
            this.selectedIndex = index; //_SafeStr_3779
            this.updateDisplay(); //_SafeStr_3384
            return (this);
        }

        public function updateDisplay():void //_SafeStr_3384
        {
            var selectedItem:UI_ListItem; //_local_1
            while (numChildren)
            {
                removeChildAt(0);
            };
            if (((this.selectedIndex >= 0) && (this.selectedIndex < this.items.length))) //_SafeStr_3779, _SafeStr_1995
            {
                selectedItem = this.items[this.selectedIndex]; //_SafeStr_1995, _SafeStr_3779
            };
            if (!selectedItem)
            {
                selectedItem = UI_List.EMPTY_ITEM; //_SafeStr_12838, _SafeStr_12127
            };
            var button:UI_Button = new UI_Button(selectedItem.text, _width, this.onDropdownClick); //_local_2, _SafeStr_3783, _SafeStr_2166
            addChild(button);
        }

        public function onItemClick(item:UI_ListItem):void //_SafeStr_3782
        {
            if (null == item.params) //_SafeStr_1883
            {
                item.callback(); //_SafeStr_922
            }
            else
            {
                item.callback(item.params); //_SafeStr_922, _SafeStr_1883
            };
            this.select_item(item.index); //_SafeStr_4701
            if (((this.dropdownElement) && (this.dropdownElement.parent))) //_SafeStr_3780
            {
                this.dropdownElement.parent.removeChild(this.dropdownElement); //_SafeStr_3780
            };
        }

        public function onDropdownClick():void //_SafeStr_3783
        {
            var globalPos:Point; //_local_1
            var i:int; //_local_2
            var itemCount:int; //_local_3
            var listItem:UI_ListItem; //_local_4
            var textField:UI_TextField; //_local_5
            var itemSprite:UI_Sprite; //_local_6
            if (((this.dropdownElement) && (this.dropdownElement.parent))) //_SafeStr_3780
            {
                this.dropdownElement.parent.removeChild(this.dropdownElement); //_SafeStr_3780
                return;
            };
            if (this.items.length == 0) //_SafeStr_1995
            {
                return;
            };
            if (!this.dropdownElement) //_SafeStr_3780
            {
                this.dropdownElement = new UI_Element((_width - 4), 100); //_SafeStr_3780
                this.dropdownElement.x = 2; //_SafeStr_3780
                this.dropdownElement.set_layout(new LayoutConfig(LayoutDirection.VERTICAL)); //_SafeStr_3780
                this.dropdownElement.set_scrollable(true); //_SafeStr_3780
                i = -1;
                itemCount = this.items.length; //_SafeStr_1995
                while (++i < itemCount)
                {
                    listItem = this.items[i]; //_SafeStr_1995
                    textField = new UI_TextField(listItem.text, this.dropdownElement._width); //_SafeStr_3780, _SafeStr_2166
                    itemSprite = new UI_Sprite(this.dropdownElement._width, textField.height); //_SafeStr_3780
                    itemSprite.addChild(textField);
                    this.dropdownElement.add_ui_element(itemSprite); //_SafeStr_3780
                    itemSprite.on_mouse_click(this.onItemClick, listItem); //_SafeStr_3782
                };
                this.dropdownElement.graphics.clear(); //_SafeStr_3780
                this.dropdownElement.graphics.lineStyle(2, 0); //_SafeStr_3780
                this.dropdownElement.graphics.beginFill(styleConfig.primaryColor, 1); //_SafeStr_3780, _SafeStr_429._SafeStr_2028
                this.dropdownElement.graphics.drawRect(0, -4, this.dropdownElement._width, Math.min((this.dropdownElement._height + 8), ((itemSprite.y + itemSprite._height) + 8))); //_SafeStr_3780
                this.dropdownElement.graphics.endFill(); //_SafeStr_3780
            };
            Keys.instance.main_ui_class[Keys.instance.add_ui](this.dropdownElement, 2); //_SafeStr_3780
            globalPos = localToGlobal(new Point(2, _height));
            this.dropdownElement.x = (globalPos.x / DomainManager.scaleConstant); //_SafeStr_3780
            this.dropdownElement.y = (globalPos.y / DomainManager.scaleConstant); //_SafeStr_3780
        }

        public function onRemovedFromStage(event:Event=null):void //_SafeStr_3784
        {
            if (((this.dropdownElement) && (this.dropdownElement.parent))) //_SafeStr_3780
            {
                this.dropdownElement.parent.removeChild(this.dropdownElement); //_SafeStr_3780
            };
        }

    }
}//package 
