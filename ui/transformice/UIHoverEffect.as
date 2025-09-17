package ui.transformice
{
    import flash.geom.ColorTransform;
    import flash.utils.Dictionary;
    import flash.events.MouseEvent;
    import flash.display.Sprite;

    /**
     * UIHoverEffect - Utility class for managing hover effects on UI components
     * Provides color transform effects when mouse enters/leaves components
     * Deobfuscated from original _SafeStr_12714 class
     */
    public class UIHoverEffect 
    {

        public static const HOVER_COLOR_TRANSFORM:ColorTransform = new ColorTransform(1.3, 1.3, 1.3); // _SafeStr_11085 - brightens on hover
        public static const NORMAL_COLOR_TRANSFORM:ColorTransform = new ColorTransform(); // _SafeStr_11086 - normal state
        public static const ORIGINAL_TRANSFORMS:Dictionary = new Dictionary(); // _SafeStr_11104 - stores original color transforms


        /**
         * Enable or disable hover effects on a sprite
         * @param sprite The sprite to apply effects to
         * @param enable Whether to enable or disable hover effects
         * @param useCursor Whether to show hand cursor and button mode
         */
        public static function setHoverEffect(sprite:Sprite, enable:Boolean=true, useCursor:Boolean=true):void //_SafeStr_11094
        {
            if (enable)
            {
                UIHoverEffect.ORIGINAL_TRANSFORMS[sprite] = sprite.transform.colorTransform; //_SafeStr_11104
                sprite.mouseEnabled = true;
                sprite.addEventListener(MouseEvent.MOUSE_OVER, UIHoverEffect.add_background);
                sprite.addEventListener(MouseEvent.MOUSE_OUT, UIHoverEffect.remove_background);
                if (useCursor)
                {
                    sprite.useHandCursor = true;
                    sprite.buttonMode = true;
                };
            }
            else
            {
                sprite.mouseEnabled = false;
                sprite.removeEventListener(MouseEvent.MOUSE_OVER, UIHoverEffect.add_background);
                sprite.removeEventListener(MouseEvent.MOUSE_OUT, UIHoverEffect.remove_background);
                sprite.transform.colorTransform = ((UIHoverEffect.ORIGINAL_TRANSFORMS[sprite]) ? UIHoverEffect.ORIGINAL_TRANSFORMS[sprite] : UIHoverEffect.NORMAL_COLOR_TRANSFORM); //_SafeStr_11104, _SafeStr_11086
                sprite.useHandCursor = false;
                sprite.buttonMode = false;
                delete UIHoverEffect.ORIGINAL_TRANSFORMS[sprite]; //_SafeStr_11104
            };
        }

        public static function remove_background(event:MouseEvent):void
        {
            var sprite:Sprite = (event.currentTarget as Sprite);
            sprite.transform.colorTransform = ((UIHoverEffect.ORIGINAL_TRANSFORMS[sprite]) ? UIHoverEffect.ORIGINAL_TRANSFORMS[sprite] : UIHoverEffect.NORMAL_COLOR_TRANSFORM); //_SafeStr_11104, _SafeStr_11086
        }

        public static function add_background(event:MouseEvent):void
        {
            var sprite:Sprite = (event.currentTarget as Sprite);
            sprite.transform.colorTransform = UIHoverEffect.HOVER_COLOR_TRANSFORM; //_SafeStr_11085
        }


    }
}//package
