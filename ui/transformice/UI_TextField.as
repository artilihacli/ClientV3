package ui.transformice
{
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import flash.text.StyleSheet;

    public class UI_TextField extends TextField 
    {

        public function UI_TextField(_arg_1:String="", _arg_2:int=0, _arg_3:int=20, _arg_4:TextFormat=null, _arg_5:Boolean=false)
        {
            mouseEnabled = false;
            mouseWheelEnabled = false;
            multiline = false;
            wordWrap = false;
            if (_arg_4)
            {
                defaultTextFormat = _arg_4;
            }
            else
            {
                defaultTextFormat = UITheme.DEFAULT.defaultTextFormat;
            };
            if (_arg_5)
            {
                styleSheet = DomainManager.gameStyleSheet;//_SafeStr_12557._SafeStr_4960._SafeStr_38;
            };
            if (_arg_1)
            {
                text = _arg_1;
            };
            if (0 == _arg_2)
            {
                height = _arg_3;
                autoSize = TextFieldAutoSize.LEFT;
            }
            else
            {
                if (_arg_3 == 0)
                {
                    width = _arg_2;
                    multiline = true;
                    wordWrap = true;
                    autoSize = TextFieldAutoSize.LEFT;
                }
                else
                {
                    width = _arg_2;
                    height = _arg_3;
                };
            };
        }

        public function setCursorPosition(_arg_1:int):void
        {
            var _local_2:int = ((_arg_1 >= 0) ? _arg_1 : ((text.length + 1) - _arg_1));
            setSelection(_local_2, _local_2);
        }

        public function setItalic(_arg_1:Boolean=true):UI_TextField
        {
            var _local_2:TextFormat = defaultTextFormat;
            _local_2.italic = _arg_1;
            return (this.changeTextFormat(_local_2));
        }

        public function setFontSize(_arg_1:int):UI_TextField
        {
            var _local_2:TextFormat = defaultTextFormat;
            _local_2.size = _arg_1;
            return (this.changeTextFormat(_local_2));
        }

        public function setTextColor(_arg_1:int):UI_TextField
        {
            textColor = _arg_1;
            return (this);
        }

        public function changeTextFormat(_arg_1:TextFormat):UI_TextField
        {
            var _local_2:StyleSheet;
            if (styleSheet)
            {
                _local_2 = styleSheet;
                styleSheet = null;
            };
            defaultTextFormat = _arg_1;
            setTextFormat(_arg_1);
            if (_local_2)
            {
                styleSheet = _local_2;
            };
            return (this);
        }

        public function move(_arg_1:int, _arg_2:int):void
        {
            x = (x + _arg_1);
            y = (y + _arg_2);
        }

        public function getFontSize():int
        {
            return (parseInt(String(defaultTextFormat.size)));
        }

        public function setStyleSheet(_arg_1:StyleSheet):UI_TextField
        {
            styleSheet = _arg_1;
            return (this);
        }

        public function setFont(_arg_1:String):UI_TextField
        {
            var _local_2:TextFormat = defaultTextFormat;
            _local_2.font = _arg_1;
            return (this.changeTextFormat(_local_2));
        }

        public function applyDefaultStyleSheet():UI_TextField
        {
            styleSheet = DomainManager.gameStyleSheet;
            return (this);
        }

        public function setBold(_arg_1:Boolean=true):UI_TextField
        {
            var _local_2:TextFormat = defaultTextFormat;
            _local_2.bold = _arg_1;
            return (this.changeTextFormat(_local_2));
        }

        public function setAlignment(_arg_1:String):UI_TextField
        {
            var _local_2:TextFormat = defaultTextFormat;
            _local_2.align = _arg_1;
            return (this.changeTextFormat(_local_2));
        }

        public function centerVertically():UI_TextField
        {
            if (!multiline)
            {
                y = (y + Math.round(((height - (textHeight + 4)) / 2)));
            }
            else
            {
                if (parent)
                {
                    if (((parent.parent) && (parent.parent as UI_Element)))
                    {
                        y = (((parent.parent as UI_Element)._height - (textHeight + 4)) / 2);
                    }
                    else
                    {
                        y = ((-(4 + textHeight) + parent.height) / 2);
                    };
                };
            };
            return (this);
        }


    }
}//package 