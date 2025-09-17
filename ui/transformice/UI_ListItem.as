package ui.transformice
{
    public class UI_ListItem  //_SafeStr_12491
    {

        public var text:String; // _SafeStr_2166 - displayed text
        public var callback:Function; // _SafeStr_922 - click callback function
        public var params:Object; // _SafeStr_1883 - callback parameters
        public var index:int; // _SafeStr_4701 - item index in list

        public function UI_ListItem(text:String, callback:Function, params:Object, index:int)
        {
            this.text = text; //_SafeStr_2166
            this.callback = callback; //_SafeStr_922
            this.params = params; //_SafeStr_1883
            this.index = index; //_SafeStr_4701
        }

    }
}//package
