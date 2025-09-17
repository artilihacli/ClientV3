package ui.transformice
{
    import flash.display.Sprite;
    import flash.display.DisplayObject;
    import flash.filters.BevelFilter;
    import flash.events.Event;

    public class UI_CheckBox extends UI_Sprite 
    {

        public static const CHECKBOX_SIZE:int = 14; // _SafeStr_8222

        public var backgroundSprite:Sprite; // _SafeStr_2293 - checkbox background
        public var checkMarkSprite:Sprite; // _SafeStr_2294 - checkmark graphic
        public var isChecked:Boolean = false; // _SafeStr_2295 - current checked state
        public var isSelected:Boolean = true; // isSelected - whether checkbox is selectable
        public var labelObject:DisplayObject; // _SafeStr_2296 - text label or custom display object
        public var onChangeCallback:Function = null; // _SafeStr_1187 - callback function
        public var callbackParams:Object = null; // _SafeStr_2297 - callback parameters
        public var useAdvancedCallback:Boolean = false; // _SafeStr_2298 - whether to use advanced callback with state

        public function UI_CheckBox(labelText:String="", arg_width:int=0)
        {
            super(UI_CheckBox.CHECKBOX_SIZE, 20); //_SafeStr_8222
            mouseChildren = false;
            this.backgroundSprite = new Sprite(); //_SafeStr_2293
            this.backgroundSprite.graphics.beginFill(2306616);
            this.backgroundSprite.graphics.drawRoundRect(0, 0, UI_CheckBox.CHECKBOX_SIZE, UI_CheckBox.CHECKBOX_SIZE, 3, 3); //_SafeStr_8222
            this.backgroundSprite.graphics.endFill();
            this.backgroundSprite.filters = new Array(new BevelFilter(1, 45, 0, 1, 6325657, 1, 1, 1, 1, 3));
            this.backgroundSprite.y = 3;
            addChild(this.backgroundSprite);
            this.checkMarkSprite = new Sprite(); //_SafeStr_2294
            this.checkMarkSprite.graphics.lineStyle(2, 11059144);
            this.checkMarkSprite.graphics.moveTo(3, 7);
            this.checkMarkSprite.graphics.lineTo(6, 11);
            this.checkMarkSprite.graphics.lineTo(11, 3);
            this.checkMarkSprite.y = this.backgroundSprite.y;
            this.setLabel(new UI_TextField(labelText, (arg_width ? (arg_width - UI_CheckBox.CHECKBOX_SIZE - 3) : 0))); //_SafeStr_2302, _SafeStr_8222
            if (arg_width)
            {
                _width = arg_width;
            }
            else
            {
                _width = width;
            };
            _height = height;
            this.setInteractive(true); //_SafeStr_2299
        }

        public function setInteractive(_arg_1:Boolean):UI_CheckBox //_SafeStr_2299
        {
            this.isSelected = _arg_1;
            super.on_mouse_click(((this.isSelected) ? this.onToggleClick : null)); //_SafeStr_2303
            return (this);
        }

        public function getChecked():Boolean //_SafeStr_2300
        {
            return (this.isChecked); //_SafeStr_2295
        }

        public function check_box_callback(_arg_1:Function=null, _arg_2:Object=null, _arg_3:Boolean=false):UI_CheckBox
        {
            this.onChangeCallback = _arg_1; //_SafeStr_1187
            this.callbackParams = _arg_2; //_SafeStr_2297
            this.useAdvancedCallback = _arg_3; //_SafeStr_2298
            return (this);
        }

        public function setLabel(_arg_1:DisplayObject):UI_CheckBox //_SafeStr_2302
        {
            if (((this.labelObject) && (this.labelObject.parent))) //_SafeStr_2296
            {
                this.labelObject.parent.removeChild(this.labelObject); //_SafeStr_2296
            };
            this.labelObject = _arg_1; //_SafeStr_2296
            addChild(this.labelObject); //_SafeStr_2296
            this.labelObject.x = (UI_CheckBox.CHECKBOX_SIZE + 3); //_SafeStr_2296, _SafeStr_8222
            return (this);
        }

        public function onToggleClick(_arg_1:Event=null):UI_CheckBox //_SafeStr_2303
        {
            this.setChecked((!(this.isChecked))); //_SafeStr_2304, _SafeStr_2295
            return (this);
        }

        public function setChecked(_arg_1:Boolean=true, _arg_2:Boolean=true):UI_CheckBox //_SafeStr_2304
        {
            if (!this.isSelected)
            {
                return (this);
            };
            this.isChecked = _arg_1; //_SafeStr_2295
            if (this.isChecked) //_SafeStr_2295
            {
                addChild(this.checkMarkSprite); //_SafeStr_2294
            }
            else
            {
                if (this.checkMarkSprite.parent) //_SafeStr_2294
                {
                    this.checkMarkSprite.parent.removeChild(this.checkMarkSprite); //_SafeStr_2294
                };
            };
            if ((Boolean(_arg_2) && Boolean(this.onChangeCallback))) //_SafeStr_1187
            {
                DomainManager.callFunction(this.onChangeCallback, ((this.useAdvancedCallback) ? DomainManager.concatArray(this.callbackParams, this.isChecked) : this.callbackParams)); //_SafeStr_1187, _SafeStr_2298, _SafeStr_2297, _SafeStr_2295
            };
            return (this);
        }


    }
}//package 
