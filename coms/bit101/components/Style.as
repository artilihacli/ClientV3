package coms.bit101.components
{
    import flash.filters.BevelFilter;
    import flash.text.TextFormat;
    import flash.text.StyleSheet;
    import flash.geom.ColorTransform;
    import flash.events.MouseEvent;
    import flash.display.Sprite;
    import flash.display.*;
    import flash.events.*;
    import flash.filters.*;
    import flash.text.*;
    import flash.geom.*;

    public class Style 
    {

        public static var TEXT_BACKGROUND:uint = 0xFFFFFF;
        public static var BACKGROUND:uint = 0xCCCCCC;
        public static var BUTTON_FACE:uint = 3952740;
        public static var BUTTON_DOWN:uint = 2438461;
        public static var FILTRE_BOUTON:Array = new Array(new BevelFilter(1, 45, 6126992, 1, 0, 1, 1, 1, 1));
        public static var FILTRE_BOUTON_ENFONCE:Array = new Array(new BevelFilter(1, 45, 0, 1, 6126992, 1, 1, 1, 1));
        public static var EFFET_BISEAU_FENETRE:Array = new Array(new BevelFilter(1, 45, 6983586, 1, 0, 1, 1, 1, 1));
        public static var FOND_TITRE_FENETRE:int = 2570047;
        public static var FOND_FENETRE:int = 3294800;
        public static var TEXTE_TITRE_FENETRE:TextFormat = new TextFormat("Tahoma", 16, 0x9D9D, true);
        public static var COULEUR_TEXTE_SAISIE:int = 4513245;
        public static var COULEUR_FOND_TEXTE_SAISIE:int = 3952740;
        public static var FILTRE_FOND_SAISIE:Array = new Array(new BevelFilter(1, 45, 0, 1, 6126992, 1, 1, 1, 1));
        public static var INPUT_TEXT:uint = 0x333333;
        public static var COULEUR_TEXTE_DEFAUT:uint = 12763866;
        public static var DROPSHADOW:uint = 0;
        public static var PANEL:uint = 0xF3F3F3;
        public static var PROGRESS_BAR:uint = 0xFFFFFF;
        public static var LIST_DEFAULT:uint = 0xFFFFFF;
        public static var LIST_ALTERNATE:uint = 0xF3F3F3;
        public static var LIST_SELECTED:uint = 0xCCCCCC;
        public static var LIST_ROLLOVER:uint = 0xDDDDDD;
        public static var SCROLLBAR_MARGIN:int = 1;
        public static var SCROLLBAR_SIZE:int = 10;
        public static var embedFonts:Boolean = false;
        public static var x_policeInterface:String = "Verdana";
        public static var fontSize:Number = 11;
        public static const DARK:String = "dark";
        public static const LIGHT:String = "light";
        public static const TRANSFORMICE:String = "transformice";
        public static const MODOPWET:String = "pwet";
        public static var GLOBAL_STYLESHEET:StyleSheet = new StyleSheet();
        private static const couleurLumiere:ColorTransform = new ColorTransform(1.3, 1.3, 1.3);
        private static const couleurNormal:ColorTransform = new ColorTransform();


        public static function initialisationStyle():void
        {
            GLOBAL_STYLESHEET.setStyle("a:hover", {"color":"#2ECF73"});
            GLOBAL_STYLESHEET.setStyle("a:active", {"color":"#2ECF73"});
            GLOBAL_STYLESHEET.setStyle("BL", {"color":"#6C77C1"});
            GLOBAL_STYLESHEET.setStyle("BV", {"color":"#2F7FCC"});
            GLOBAL_STYLESHEET.setStyle("CE", {"color":"#E88F4F"});
            GLOBAL_STYLESHEET.setStyle("CEP", {"color":"#F0A78E"});
            GLOBAL_STYLESHEET.setStyle("CH", {"color":"#98E2EB"});
            GLOBAL_STYLESHEET.setStyle("CS", {"color":"#EFCE8F"});
            GLOBAL_STYLESHEET.setStyle("G", {"color":"#60608F"});
            GLOBAL_STYLESHEET.setStyle("J", {"color":"#BABD2F"});
            GLOBAL_STYLESHEET.setStyle("N", {"color":"#C2C2DA"});
            GLOBAL_STYLESHEET.setStyle("N2", {"color":"#9292AA"});
            GLOBAL_STYLESHEET.setStyle("PT", {"color":"#2EBA7E"});
            GLOBAL_STYLESHEET.setStyle("PS", {"color":"#F1C4F6"});
            GLOBAL_STYLESHEET.setStyle("R", {"color":"#CB546B"});
            GLOBAL_STYLESHEET.setStyle("ROSE", {"color":"#ED67EA"});
            GLOBAL_STYLESHEET.setStyle("S", {"color":"#CAA4CF"});
            GLOBAL_STYLESHEET.setStyle("T", {"color":"#A4CF9E"});
            GLOBAL_STYLESHEET.setStyle("TD", {"textAlign":"right"});
            GLOBAL_STYLESHEET.setStyle("TG", {"textAlign":"left"});
            GLOBAL_STYLESHEET.setStyle("TI", {"fontSize":"14"});
            GLOBAL_STYLESHEET.setStyle("V", {"color":"#009D9D"});
            GLOBAL_STYLESHEET.setStyle("VP", {"color":"#2ECF73"});
            GLOBAL_STYLESHEET.setStyle("VI", {"color":"#C53DFF"});
        }

        public static function setStyle(_arg_1:String):void
        {
            switch (_arg_1)
            {
                case TRANSFORMICE:
                    Style.embedFonts = false;
                    Style.fontSize = 11;
                    Style.COULEUR_TEXTE_DEFAUT = 12763866;
                    Style.BACKGROUND = 3294800;
                    Style.TEXT_BACKGROUND = 3294800;
                    Style.PANEL = 3294800;
                    Style.BUTTON_FACE = 3952740;
                    Style.BUTTON_DOWN = 2438461;
                    Style.SCROLLBAR_MARGIN = 0;
                    Style.SCROLLBAR_SIZE = 4;
                    Style.LIST_DEFAULT = 3294800;
                    Style.LIST_SELECTED = 2514011;
                    Style.LIST_ROLLOVER = 2511196;
                    return;
                case MODOPWET:
                    Style.fontSize = 10;
                    Style.COULEUR_TEXTE_DEFAUT = 0x9D9D;
                    Style.BUTTON_FACE = 0;
                    Style.BUTTON_DOWN = 0;
                    Style.LIST_DEFAULT = 0x111111;
                    Style.LIST_SELECTED = 0x222222;
                    Style.LIST_ROLLOVER = 0x444444;
                    return;
                case DARK:
                    Style.BACKGROUND = 0x444444;
                    Style.BUTTON_FACE = 0x666666;
                    Style.BUTTON_DOWN = 0x222222;
                    Style.INPUT_TEXT = 0xBBBBBB;
                    Style.COULEUR_TEXTE_DEFAUT = 0xCCCCCC;
                    Style.PANEL = 0x666666;
                    Style.PROGRESS_BAR = 0x666666;
                    Style.TEXT_BACKGROUND = 0x555555;
                    Style.LIST_DEFAULT = 0x444444;
                    Style.LIST_ALTERNATE = 0x393939;
                    Style.LIST_SELECTED = 0x666666;
                    Style.LIST_ROLLOVER = 0x777777;
                    return;
                case LIGHT:
                default:
                    Style.BACKGROUND = 0xCCCCCC;
                    Style.BUTTON_FACE = 0xFFFFFF;
                    Style.BUTTON_DOWN = 0xEEEEEE;
                    Style.INPUT_TEXT = 0x333333;
                    Style.COULEUR_TEXTE_DEFAUT = 0x666666;
                    Style.PANEL = 0xF3F3F3;
                    Style.PROGRESS_BAR = 0xFFFFFF;
                    Style.TEXT_BACKGROUND = 0xFFFFFF;
                    Style.LIST_DEFAULT = 0xFFFFFF;
                    Style.LIST_ALTERNATE = 0xF3F3F3;
                    Style.LIST_SELECTED = 0xCCCCCC;
                    Style.LIST_ROLLOVER = 0xDDDDDD;
            };
        }

        public static function effetLumiere(_arg_1:Sprite, _arg_2:Boolean, _arg_3:Boolean=false):void
        {
            if (_arg_2)
            {
                _arg_1.mouseEnabled = true;
                _arg_1.addEventListener(MouseEvent.MOUSE_OVER, lumiereSouris1);
                _arg_1.addEventListener(MouseEvent.MOUSE_OUT, lumiereSouris2);
                if (_arg_3)
                {
                    _arg_1.useHandCursor = true;
                    _arg_1.buttonMode = true;
                };
            }
            else
            {
                _arg_1.removeEventListener(MouseEvent.MOUSE_OVER, lumiereSouris1);
                _arg_1.removeEventListener(MouseEvent.MOUSE_OUT, lumiereSouris2);
                _arg_1.transform.colorTransform = couleurNormal;
                _arg_1.useHandCursor = false;
                _arg_1.buttonMode = false;
            };
        }

        private static function lumiereSouris1(_arg_1:MouseEvent):void
        {
            var _local_2:* = (_arg_1.currentTarget as Sprite);
            _local_2.transform.colorTransform = couleurLumiere;
        }

        private static function lumiereSouris2(_arg_1:MouseEvent):void
        {
            var _local_2:* = (_arg_1.currentTarget as Sprite);
            _local_2.transform.colorTransform = couleurNormal;
        }


    }
}

