package ui.transformice
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;
    import flash.text.StyleSheet;
	import flash.display.*;
	import ChargeurTransformice_fla.*;
    public class DomainManager 
    {

        public static var tfm:*;
        public static var stage:Stage;
        public static var gameStyleSheet:StyleSheet = new StyleSheet(); // _SafeStr_38
        public static var isAndroid:Boolean = false;
        public static var font:String = "Verdana"; 
        public static const scaleConstant:Number = 1; // _SafeStr_12557._SafeStr_4947

        public static const boxTitleColor:int = 16767377; //_SafeStr_13340._SafeStr_5421

        public static function getDefinition(_arg_1:String): MovieClip
        {
            return Keys.instance.domain_manager_class[Keys.instance.get_definition](_arg_1);
        }

        public static function loadImage(_arg_1:String, _arg_2:String="http://www.transformice.com/images/"): Bitmap
        {
            return Keys.instance.domain_manager_class[Keys.instance.load_img](_arg_1,_arg_2);
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

        public static function concatArray(_arg_1:Object, _arg_2:Object, _arg_3:Boolean=false):Array
        {
            var _local_4:Array;
            if (_arg_1 === null)
            {
                return ([_arg_2]);
            };
            if (_arg_3)
            {
                return ([_arg_2].concat(_arg_1));
            };
            if (((!(_arg_3)) && (_arg_1 is Array)))
            {
                return ((_arg_1 as Array).concat(_arg_2));
            };
            _local_4 = new Array();
            if (_arg_3)
            {
                _local_4.push(_arg_2, _arg_1);
            }
            else
            {
                _local_4.push(_arg_1, _arg_2);
            };
            return (_local_4);
        }

            //        public var _SafeStr_38:StyleSheet = new StyleSheet();
            // this._SafeStr_38.setStyle("BV", {"color":"#2F7FCC"});
            // this._SafeStr_38.setStyle("R", {"color":"#CB546B"});
            // this._SafeStr_38.setStyle("BL", {"color":"#6C77C1"});
            // this._SafeStr_38.setStyle("J", {"color":"#BABD2F"});
            // this._SafeStr_38.setStyle("N", {"color":"#C2C2DA"});
            // this._SafeStr_38.setStyle("N2", {"color":"#9292AA"});
            // this._SafeStr_38.setStyle("G", {"color":"#60608F"});
            // this._SafeStr_38.setStyle("V", {"color":"#009D9D"});
            // this._SafeStr_38.setStyle("D", {"color":"#FFD991"});
            // this._SafeStr_38.setStyle("O", {"color":"#F79337"});
            // this._SafeStr_38.setStyle("VP", {"color":"#2ECF73"});
            // this._SafeStr_38.setStyle("VI", {"color":"#C53DFF"});
            // this._SafeStr_38.setStyle("ROSE", {"color":"#ED67EA"});
            // this._SafeStr_38.setStyle("CH", {"color":"#98E2EB"});
            // this._SafeStr_38.setStyle("CH2", {"color":"#FEB1FC"});
            // this._SafeStr_38.setStyle("T", {"color":"#A4CF9E"});
            // this._SafeStr_38.setStyle("TI", {"fontSize":"14"});
            // this._SafeStr_38.setStyle("PT", {"color":"#2EBA7E"});
            // this._SafeStr_38.setStyle("S", {"color":"#CAA4CF"});
            // this._SafeStr_38.setStyle("PS", {"color":"#F1C4F6"});
            // this._SafeStr_38.setStyle("CEP", {"color":"#F0A78E"});
            // this._SafeStr_38.setStyle("CE", {"color":"#E88F4F"});
            // this._SafeStr_38.setStyle("CS", {"color":"#EFCE8F"});
            // this._SafeStr_38.setStyle("FC", {"color":"#FF8547"});
            // this._SafeStr_38.setStyle("TD", {"textAlign":"right"});
            // this._SafeStr_38.setStyle("TG", {"textAlign":"left"});
            // this._SafeStr_38.setStyle("a:hover", {"color":"#2ECF73"});
            // this._SafeStr_38.setStyle("a:active", {"color":"#E9E654"});
            // this._SafeStr_38.setStyle("CL", {
            //     "fontSize":"11",
            //     "\x04\x02\x06\x02\x07\b\x02\x06\x05\x02\x02":"0"
            // });
            // var _SafeStr_13452:int;
            // var _SafeStr_13456:int = this._SafeStr_38.styleNames.length;
            // while (_SafeStr_13452 < _SafeStr_13456)
            // {
            //     _SafeStr_13454 = _SafeStr_12557._SafeStr_4960._SafeStr_38.styleNames[_SafeStr_13452];
            //     _SafeStr_429 = _SafeStr_12557._SafeStr_4960._SafeStr_38.getStyle(_SafeStr_13454);
            //     _SafeStr_429.display = "inline";
            //     this._SafeStr_38.setStyle(_SafeStr_13454, _SafeStr_429);
            //     _SafeStr_13452 = (_SafeStr_13452 + 1);
            // };


    }

}