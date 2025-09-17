package ui.transformice
{
    import flash.text.TextFormat;
    import flash.text.TextField;
    import flash.filters.GlowFilter;
    import flash.text.AntiAliasType;
    import flash.text.GridFitType;

    /**
     * TextUtility - Utility class for text operations and TextField creation
     * Provides text formatting, encoding/decoding and specialized TextField creation
     * Deobfuscated from original _SafeStr_12797 class
     */
    public class TextUtility //_SafeStr_12797
    {

        public static var useEmbeddedFonts:Boolean = false; // _SafeStr_5689


        /**
         * Truncate text to specified length with optional ellipsis
         * @param text The text to truncate
         * @param maxLength Maximum length allowed
         * @param addEllipsis Whether to add ellipsis (...) at the end
         * @return Truncated text
         */
        public static function truncateText(text:String, maxLength:int, addEllipsis:Boolean):String //_SafeStr_5690
        {
            if (!text)
            {
                return ("");
            };
            if (maxLength >= text.length)
            {
                return (text);
            };
            if (addEllipsis)
            {
                return (text.substr((maxLength - 1)) + "…");
            };
            return (text.substr(maxLength));
        }

        /**
         * Decode HTML entities in text
         * @param text The text to decode
         * @param decodeAmp Whether to decode &amp; entities
         * @return Decoded text
         */
        public static function decodeHtmlEntities(text:String, decodeAmp:Boolean=true):String //_SafeStr_5691
        {
            if (!text)
            {
                return ("");
            };
            text = text.replace(/&lt;/g, "<");
            if (decodeAmp)
            {
                text = text.replace(/&amp;/g, "&");
            };
            return (text);
        }

        /**
         * Create a standard Verdana TextField from template
         * @return Configured TextField
         */
        public static function createVerdanaTextField():TextField //_SafeStr_5692
        {
            var format:TextFormat;
            var textField:TextField = (DomainManager.getDefinition("$TexteVerda").getChildByName("_T") as TextField);
            if (!TextUtility.useEmbeddedFonts) //_SafeStr_5689
            {
                format = textField.defaultTextFormat;
                textField.embedFonts = true;
                format.font = DomainManager.font;//_SafeStr_13046._SafeStr_8905;
                textField.defaultTextFormat = format;
            };
            return (textField);
        }

        /**
         * Encode text for HTML display
         * @param text The text to encode
         * @param encodeAmp Whether to encode & characters
         * @return HTML-encoded text
         */
        public static function encodeHtmlEntities(text:String, encodeAmp:Boolean=true):String //_SafeStr_5693
        {
            if (!text)
            {
                return ("");
            };
            if (encodeAmp)
            {
                text = text.replace(/&/g, "&amp;");
            };
            return (text.replace(/</g, "&lt;"));
        }

        /**
         * Create a UI_TextField with Soopafresh font and glow effect
         * @param text Initial text content
         * @param width TextField width
         * @param height TextField height
         * @return Configured UI_TextField with special styling
         */
        public static function createSoopaTextField(text:String="", width:int=0, height:int=20):UI_TextField //_SafeStr_5694
        {
            var textField:UI_TextField = new UI_TextField(text, width, height);
            textField.embedFonts = true;
            var format:TextFormat = textField.defaultTextFormat;
            format.font = "Soopafresh";
            format["leading"] = 2;
            textField.defaultTextFormat = format;
            textField.setTextFormat(format);
            textField.filters = new Array(new GlowFilter(0, 1, 5, 5, 8));
            textField.antiAliasType = AntiAliasType.ADVANCED;
            textField.gridFitType = GridFitType.PIXEL;
            return (textField);
        }

        /**
         * Create a Soopafresh TextField from template
         * @return Configured TextField
         */
        public static function createSoopaTemplateField():TextField //_SafeStr_5695
        {
            return (DomainManager.getDefinition("$TexteSoopa").getChildByName("_T") as TextField);
        }


    }
}//package
