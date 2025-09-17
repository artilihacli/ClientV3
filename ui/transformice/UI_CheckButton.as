package ui.transformice
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.filters.BevelFilter;
    import flash.text.TextFieldAutoSize;
    import flash.events.MouseEvent;
    import flash.events.Event;

    public class UI_CheckButton extends Sprite 
    {

        public var backgroundCircle:Sprite;
        public var checkCircle:Sprite;
        public var textField:TextField;
        public var onChangeCallback:Function;
        public var callbackParams:Object;
        public var isSelected:Boolean = false;

        public function UI_CheckButton(_arg_1:Function=null, _arg_2:Object=null)
        {
            this.onChangeCallback = _arg_1;
            this.callbackParams = _arg_2;
            mouseChildren = false;
            this.backgroundCircle = new Sprite();
            this.backgroundCircle.y = 3;
            this.backgroundCircle.graphics.beginFill(2306616);
            this.backgroundCircle.graphics.drawCircle(6, 6, 6);
            this.backgroundCircle.graphics.endFill();
            this.backgroundCircle.filters = new Array(new BevelFilter(1, 45, 0, 1, 6325657, 1, 1, 1, 1, 3));
            this.checkCircle = new Sprite();
            this.checkCircle.graphics.beginFill(11059144);
            this.checkCircle.graphics.drawCircle(6, 6, 3);
            this.checkCircle.y = 3;
            addChild(this.backgroundCircle);
            graphics.beginFill(0, 0);
            graphics.drawRect(0, 0, 40, 18);
            graphics.endFill();
            this.textField = TextUtility.createVerdanaTextField();//_SafeStr_12797._SafeStr_5692();
            this.textField.autoSize = TextFieldAutoSize.LEFT;
            this.textField.embedFonts = TextUtility.useEmbeddedFonts;//_SafeStr_12797._SafeStr_5689;
            this.textField.x = 15;
            addChild(this.textField);
            addEventListener(MouseEvent.MOUSE_DOWN, this.check_button_exec);
            UIHoverEffect.setHoverEffect(this, true, true);//_SafeStr_12714._SafeStr_11094(this, true, true);
        }

        public function check_button_exec(_arg_1:Event):void
        {
            this.setSelected((!(this.isSelected)));
            if (this.onChangeCallback != null)
            {
                if (this.callbackParams !== null)
                {
                    this.onChangeCallback(this.isSelected, this.callbackParams);
                }
                else
                {
                    this.onChangeCallback(this.isSelected);
                };
            };
        }

        public function setSelected(_arg_1:Boolean):void
        {
            this.isSelected = _arg_1;
            if (this.isSelected)
            {
                addChild(this.checkCircle);
            }
            else
            {
                if (this.checkCircle.parent)
                {
                    this.checkCircle.parent.removeChild(this.checkCircle);
                };
            };
        }

        public function updateLayout():void
        {
            this.backgroundCircle.y = (-5 + (this.textField.textHeight / 2));
            this.checkCircle.y = this.backgroundCircle.y;
        }


    }
}