package ui.custom
{
    import flash.display.Sprite;
    import flash.text.TextFieldType;
    import flash.events.KeyboardEvent;
    import flash.events.FocusEvent;
    import flash.events.Event;
    import flash.text.TextFormat;
	import flash.events.*;
	import flash.utils.*;
	import flash.system.*;
	import flash.display.*;
	import flash.ui.*;
    import flash.filters.BevelFilter;
    import ui.transformice.*;
	import ChargeurTransformice_fla.KeyboardHandler;

    public class KeyInput extends UI_Input
    {

        public var keyCode:int = -1;
        public var keyName:String = "";
        public var handlerFunction:Function = null;

        public function KeyInput(_arg_1:int=100, _arg_2:int=20, _arg_3:Boolean=true, _arg_4:Function=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            this.handlerFunction = _arg_4;  
            this.textField.type = TextFieldType.DYNAMIC;
            this.textField.addEventListener(KeyboardEvent.KEY_DOWN, this.handleEventKeyDown);
        }

        private function handleEventKeyDown(_arg_1:KeyboardEvent):void
        {
            this.keyCode = _arg_1.keyCode | (0x0100 * int(_arg_1.ctrlKey)) | (int(_arg_1.shiftKey) * 0x0200) | (int(_arg_1.altKey) * 0x0400);
            this.keyName = KeyboardHandler.getKeyName(this.keyCode);
            this.textField.text = this.keyName;
            if (this.handlerFunction != null)
            {
                this.handlerFunction();
            }
            _arg_1.stopImmediatePropagation();
        }

    }



}