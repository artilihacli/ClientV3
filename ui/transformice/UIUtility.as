package ui.transformice
{
    import flash.geom.ColorTransform;
    import __AS3__.vec.Vector;
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.display.DisplayObjectContainer;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.geom.Rectangle;
    import flash.display.InteractiveObject;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.utils.getTimer;
    import __AS3__.vec.*;

    public class UIUtility 
    {

        public static const HIGHLIGHT_TRANSFORM:ColorTransform = new ColorTransform(1.3, 1.3, 1.3); // _SafeStr_11085
        public static const DEFAULT_TRANSFORM:ColorTransform = new ColorTransform(); // _SafeStr_11086
        //public static var activeAnimations:Vector.<UIAnimation> = new Vector.<UIAnimation>(); // _SafeStr_11087
        public static var animationFrameListenerActive:Boolean = false; // _SafeStr_11088

        // public static function removeAnimation(displayObject:DisplayObject):void // _SafeStr_11089
        // {
        //     var i:int = -1;
        //     var length:int = UIUtility.activeAnimations.length;
        //     while (++i < length)
        //     {
        //         if (UIUtility.activeAnimations[i].target == displayObject) // _SafeStr_2871
        //         {
        //             UIUtility.activeAnimations.splice(i, 1);
        //             i--;
        //             length--;
        //         };
        //     };
        // }

        public static function drawDebugRect(x:int, y:int, width:int, height:int, container:DisplayObjectContainer, color:int=-1, name:String=""):void // _SafeStr_11090
        {
            var sprite:Sprite;
            var finalColor:int = int(((color != -1) ? color : int((Math.random() * 0x1000000))));
            sprite = new Sprite();
            sprite.name = name;
            sprite.mouseEnabled = false;
            sprite.graphics.lineStyle(1, finalColor);
            sprite.graphics.drawRect(0, 0, width, height);
            sprite.graphics.endFill();
            sprite.x = x;
            sprite.y = y;
            if (container)
            {
                container.addChild(sprite);
            };
        }

        // public static function createAnimation(target:DisplayObject, duration:int, easingFunction:Function=null, delay:int=0, onComplete:Function=null, onCompleteParams:Object=null):UIAnimation // _SafeStr_11091
        // {
        //     var animation:UIAnimation = new UIAnimation(target, duration, easingFunction, delay, onComplete, onCompleteParams);
        //     UIUtility.activeAnimations.push(animation);
        //     if (!UIUtility.animationFrameListenerActive)
        //     {
        //         UIUtility.animationFrameListenerActive = true;
        //         DomainManager.tfm.addEventListener("enterFrame", UIUtility.updateAnimations); // _SafeStr_4697
        //     };
        //     return (animation);
        // }
        
        // public static function _SafeStr_11091(_arg_1:DisplayObject, _arg_2:int, _arg_3:Function=null, _arg_4:int=0, _arg_5:Function=null, _arg_6:Object=null):_SafeStr_13279
        // {
        //     var _local_7:_SafeStr_13279 = new _SafeStr_13279(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
        //     _SafeStr_13153._SafeStr_11087.push(_local_7);
        //     if (!_SafeStr_13153._SafeStr_11088)
        //     {
        //         _SafeStr_13153._SafeStr_11088 = true;
        //         _SafeStr_12557._SafeStr_4960.addEventListener("enterFrame", _SafeStr_13153._SafeStr_4697);
        //     };
        //     return (_local_7);
        // }

        public static function addCloseButton(uiSprite:UI_Sprite, onCloseHandler:Function):void // _SafeStr_11092
        {
            var closeButton:Sprite;
            closeButton = DomainManager.getDefinition("$Fermer");
            // if (DomainManager.tfm.isHighDPI)
            // {
            //     closeButton.scaleX = (closeButton.scaleY = 2);
            // };
            closeButton.x = ((uiSprite._width - (closeButton.width / 2)) - 5);
            closeButton.y = (-(closeButton.height / 2) + 5);
            UIUtility.setButtonStyle(closeButton, true);
            closeButton.addEventListener(MouseEvent.MOUSE_DOWN, onCloseHandler);
            closeButton.cacheAsBitmap = true;
            uiSprite.addChild(closeButton);
        }

        // public static function updateAnimations(event:Event):void // _SafeStr_4697
        // {
        //     var animation:UIAnimation;
        //     var elapsed:int;
        //     var progress:Number;
        //     var currentTime:int = getTimer();//Client.getTime();
        //     var i:int = -1;
        //     var length:int = UIUtility.activeAnimations.length;
        //     while (++i < length)
        //     {
        //         animation = UIUtility.activeAnimations[i];
        //         if (currentTime >= animation.startTime) // _SafeStr_1568
        //         {
        //             elapsed = (currentTime - animation.startTime);
        //             progress = (elapsed / animation.duration); // _SafeStr_2885
        //             if (progress >= 1)
        //             {
        //                 if (animation.animateX) // _SafeStr_2889
        //                 {
        //                     animation.target.x = animation.endX; // _SafeStr_2119
        //                 };
        //                 if (animation.animateY) // _SafeStr_2890
        //                 {
        //                     animation.target.y = animation.endY; // _SafeStr_2120
        //                 };
        //                 if (animation.animateAlpha) // _SafeStr_2891
        //                 {
        //                     animation.target.alpha = animation.endAlpha; // _SafeStr_2893
        //                 };
        //                 if (animation.animateColor) // _SafeStr_2888
        //                 {
        //                     animation.target.transform.colorTransform = new ColorTransform(animation.endRed, animation.endGreen, animation.endBlue); // _SafeStr_2877, _SafeStr_2880, _SafeStr_2883
        //                 };
        //                 if (animation.hasCustomUpdate) // _SafeStr_2895
        //                 {
        //                     animation.customUpdateFunction(animation.target, 1); // _SafeStr_2896
        //                 };
        //                 UIUtility.activeAnimations.splice(i, 1);
        //                 i--;
        //                 length--;
        //                 if (animation.onComplete != null) // _SafeStr_2886
        //                 {
        //                     DomainManager.callFunction(animation.onComplete, animation.onCompleteParams); // _SafeStr_2887
        //                 };
        //             }
        //             else
        //             {
        //                 if (animation.animateX)
        //                 {
        //                     if (animation.easingFunction == null) // _SafeStr_1533
        //                     {
        //                         animation.target.x = (animation.startX + (animation.deltaX * progress)); // _SafeStr_2872, _SafeStr_2874
        //                     }
        //                     else
        //                     {
        //                         animation.target.x = animation.easingFunction(progress, animation.startX, animation.deltaX, 1);
        //                     };
        //                 };
        //                 if (animation.animateY)
        //                 {
        //                     if (null == animation.easingFunction)
        //                     {
        //                         animation.target.y = (animation.startY + (animation.deltaY * progress)); // _SafeStr_2873, _SafeStr_2875
        //                     }
        //                     else
        //                     {
        //                         animation.target.y = animation.easingFunction(progress, animation.startY, animation.deltaY, 1);
        //                     };
        //                 };
        //                 if (animation.animateAlpha)
        //                 {
        //                     if (animation.easingFunction == null)
        //                     {
        //                         animation.target.alpha = (animation.startAlpha + (animation.deltaAlpha * progress)); // _SafeStr_2892, _SafeStr_2894
        //                     }
        //                     else
        //                     {
        //                         animation.target.alpha = animation.easingFunction(progress, animation.startAlpha, animation.deltaAlpha, 1);
        //                     };
        //                 };
        //                 if (animation.animateColor)
        //                 {
        //                     if (null == animation.easingFunction)
        //                     {
        //                         animation.target.transform.colorTransform = new ColorTransform((animation.startRed + (animation.deltaRed * progress)), (animation.startGreen + (animation.deltaGreen * progress)), (animation.startBlue + (animation.deltaBlue * progress))); // _SafeStr_2876, _SafeStr_2878, _SafeStr_2879, _SafeStr_2881, _SafeStr_2882, _SafeStr_2884
        //                     }
        //                     else
        //                     {
        //                         animation.target.transform.colorTransform = new ColorTransform(animation.easingFunction(progress, animation.startRed, animation.deltaRed, 1), animation.easingFunction(progress, animation.startGreen, animation.deltaGreen, 1), animation.easingFunction(progress, animation.startBlue, animation.deltaBlue, 1));
        //                     };
        //                 };
        //                 if (animation.hasCustomUpdate)
        //                 {
        //                     if (animation.easingFunction == null)
        //                     {
        //                         animation.customUpdateFunction(animation.target, progress);
        //                     }
        //                     else
        //                     {
        //                         animation.customUpdateFunction(animation.target, animation.easingFunction(progress, 0, 1, 1));
        //                     };
        //                 };
        //             };
        //         };
        //     };
        //     if (0 == UIUtility.activeAnimations.length)
        //     {
        //         UIUtility.animationFrameListenerActive = false;
        //         DomainManager.tfm.removeEventListener("enterFrame", UIUtility.updateAnimations);
        //     };
        // }

        public static function debugDrawSprite(displayObject:DisplayObject, color:int=-1, width:Number=-1, height:Number=-1):void // _SafeStr_11093
        {
            var existingDebug:Sprite;
            var finalWidth:Number;
            var finalHeight:Number;
            var container:DisplayObjectContainer;
            var crosshair:Sprite;
            return;
            var debugName:String = ("spriteDebug_" + DebugUtil.getObjectId(displayObject));
            if ((displayObject is DisplayObjectContainer))
            {
                existingDebug = ((displayObject as DisplayObjectContainer).getChildByName(debugName) as Sprite);
                if (existingDebug)
                {
                    existingDebug.parent.removeChild(existingDebug);
                };
            }
            else
            {
                if (displayObject.parent)
                {
                    existingDebug = (displayObject.parent.getChildByName(debugName) as Sprite);
                    if (existingDebug)
                    {
                        existingDebug.parent.removeChild(existingDebug);
                    };
                };
            };
            if (width != -1)
            {
                finalWidth = width;
            }
            else
            {
                if ((displayObject is UI_Sprite))
                {
                    finalWidth = UI_Sprite(displayObject)._width;
                }
                else
                {
                    finalWidth = displayObject.width;
                };
            };
            if (height != -1)
            {
                finalHeight = height;
            }
            else
            {
                if ((displayObject is UI_Sprite))
                {
                    finalHeight = UI_Sprite(displayObject)._height;
                }
                else
                {
                    finalHeight = displayObject.height;
                };
            };
            var bounds:Rectangle = displayObject.getRect(displayObject);
            var offsetX:int;
            var offsetY:int;
            if ((displayObject is DisplayObjectContainer))
            {
                if (!(displayObject is UI_Element))
                {
                    offsetX = bounds.left;
                    offsetY = bounds.top;
                };
                container = DisplayObjectContainer(displayObject);
            }
            else
            {
                if (displayObject.parent)
                {
                    offsetX = (bounds.left + displayObject.x);
                    offsetY = (bounds.top + displayObject.y);
                    container = displayObject.parent;
                };
            };
            if (!container)
            {
                return;
            };
            UIUtility.drawDebugRect(offsetX, offsetY, finalWidth, finalHeight, container, color, debugName);
            crosshair = new Sprite();
            crosshair.mouseEnabled = false;
            crosshair.graphics.lineStyle(1, (Math.random() * 0x1000000));
            crosshair.graphics.moveTo(-5, 0);
            crosshair.graphics.lineTo(5, 0);
            crosshair.graphics.moveTo(0, -5);
            crosshair.graphics.lineTo(0, 5);
            crosshair.graphics.endFill();
            crosshair.x = 0;
            crosshair.y = 0;
            container.addChild(crosshair);
        }

        public static function onMouseOut(event:MouseEvent):void
        {
            var sprite:Sprite = (event.currentTarget as Sprite);
            sprite.transform.colorTransform = UIUtility.DEFAULT_TRANSFORM;
        }

        public static function onMouseOver(event:MouseEvent):void
        {
            var sprite:Sprite = (event.currentTarget as Sprite);
            sprite.transform.colorTransform = UIUtility.HIGHLIGHT_TRANSFORM;
        }

        public static function setButtonStyle(sprite:Sprite, enable:Boolean=true):void // _SafeStr_11094
        {
            if (enable)
            {
                sprite.addEventListener(MouseEvent.MOUSE_OVER, UIUtility.onMouseOver);
                sprite.addEventListener(MouseEvent.MOUSE_OUT, UIUtility.onMouseOut);
            }
            else
            {
                sprite.removeEventListener(MouseEvent.MOUSE_OVER, UIUtility.onMouseOver);
                sprite.removeEventListener(MouseEvent.MOUSE_OUT, UIUtility.onMouseOut);
                sprite.transform.colorTransform = UIUtility.DEFAULT_TRANSFORM;
            };
            sprite.useHandCursor = enable;
            sprite.buttonMode = enable;
        }

        public static function setFocus(interactiveObject:InteractiveObject):void // _SafeStr_11095
        {
            DomainManager.stage.focus = interactiveObject;
        }

        public static function applyColorTint(displayObject:DisplayObject, color:int):void // _SafeStr_892
        {
            displayObject.transform.colorTransform = new ColorTransform((((color >> 16) & 0xFF) / 128), (((color >> 8) & 0xFF) / 128), ((color & 0xFF) / 128));
        }

        public static function scaleBitmapData(bitmapData:BitmapData, scaleX:Number, scaleY:Number=0):BitmapData // _SafeStr_11096
        {
            if (0 == scaleY)
            {
                scaleY = scaleX;
            };
            var newWidth:int = Math.round((bitmapData.width * scaleX));
            var newHeight:int = Math.round((scaleY * bitmapData.height));
            var scaledBitmap:BitmapData = new BitmapData(newWidth, newHeight, bitmapData.transparent, 0);
            var matrix:Matrix = new Matrix();
            matrix.scale(scaleX, scaleY);
            scaledBitmap.draw(bitmapData, matrix, null, null, null, true);
            return (scaledBitmap);
        }

    }
}
