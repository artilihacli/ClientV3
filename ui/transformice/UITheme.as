package ui.transformice
{
    import flash.text.TextFormat;
    import flash.filters.BevelFilter;

    public class UITheme 
    {

        public static var DEFAULT = new UITheme(); // defaultTheme

        public var debugMode:Boolean = false; // _SafeStr_2021
        public var backgroundColor:int = 6976661; // _SafeStr_1996
        public var debugText:String; // _SafeStr_2022
        public var largeFontSize:int = 16; // _SafeStr_2023
        public var defaultFontSize:int = 12; // _SafeStr_2024
        public var baseFontSize:int = defaultFontSize; // _SafeStr_2025
        public var defaultTextFormat:TextFormat = new TextFormat("Verdana", baseFontSize, 12763866); // _SafeStr_2026
        public var altTextFormat:TextFormat = new TextFormat("Verdana", baseFontSize, 0xBBBB); // _SafeStr_2027
        public var primaryColor:int = 1189417; // _SafeStr_2028
        public var textColor:int = 12763866; // _SafeStr_2029
        public var highlightColor:int = 16244891; // _SafeStr_2030
        public var secondaryColor:int = 0x999999; // _SafeStr_2031
        public var buttonBackgroundAsset:String = "$FondBouton"; // _SafeStr_2032
        public var defaultFilters:Array = new Array(new BevelFilter(1, 45, 0xFFFFFF, 0.5, 0, 1, 1, 1)); // _SafeStr_2033
        public var buttonHeight:int = 20; // _SafeStr_2034
        public var windowBackgroundAsset:String = "$FenetreBase"; // _SafeStr_2035
        public var titleBackgroundAsset:String = "$I_FondTitre"; // _SafeStr_2036
        public var closeButtonNormalAsset:String = "$I_Croix1"; // _SafeStr_2037
        public var closeButtonHoverAsset:String = "$I_Croix2"; // _SafeStr_2038
        public var closeButtonOffset:int = -10; // _SafeStr_2039
        public var customAsset:String; // _SafeStr_2040
        public var borderLightColor:int = 3500917; // _SafeStr_2041
        public var borderDarkColor:int = 858652; // _SafeStr_2042
        public var shadowColor:int = 0; // _SafeStr_2043
        public var accentColor1:int = 1981762; // _SafeStr_2044
        public var accentColor2:int = 16764812; // _SafeStr_2045
        public var accentColor3:int = 1981762; // _SafeStr_2046
        public var accentColor4:int = 2108723; // _SafeStr_2047
        public var scrollbarWidth:int = 2; // _SafeStr_2048
        public var scrollbarBackgroundColor:int = 0x2222; // _SafeStr_2049
        public var scrollbarColor:int = 0x8888; // scrollbarColor (already named)
        public var listItemColor1:int = 15309835; // _SafeStr_2050
        public var listItemColor2:int = 2246221; // _SafeStr_2051
        public var listItemColor3:int = 2243405; // _SafeStr_2052
        public var listItemColor4:int = 2578772; // _SafeStr_2053
        public var statusColor1:int = 1189161; // _SafeStr_2054
        public var statusColor2:int = 3101273; // _SafeStr_2055
        public var statusColor3:int = 2510420; // _SafeStr_2056

    }
}
