package ui.transformice
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.events.Event;
    import flash.geom.Matrix;

    public class UI_Image extends UI_Sprite 
    {

        public var bitmap:Bitmap; // _SafeStr_1872
        public var originalWidth:int; // _SafeStr_51
        public var originalHeight:int; // _SafeStr_66
        public var offsetX:int; // _SafeStr_1199
        public var offsetY:int; // _SafeStr_1200
        public var imageScaleX:Number = 1; // _SafeStr_1873
        public var imageScaleY:Number = 1; // _SafeStr_1874
        public var originalBitmapData:BitmapData; // _SafeStr_1875
        public var maxWidth:int; // _SafeStr_1876
        public var maxHeight:int; // _SafeStr_1877
        public var needsAutoResize:Boolean = false; // _SafeStr_1878
        public var needsScaleToFit:Boolean = false; // _SafeStr_1879
        public var centerWidth:int; // _SafeStr_1880
        public var centerHeight:int; // _SafeStr_1881
        public var onLoadCallback:Function; // _SafeStr_1882
        public var onLoadParams:Object; // _SafeStr_1883

        public function UI_Image(imagePath:String=null, imageWidth:int=0, imageHeight:int=0, offsetX:int=0, offsetY:int=0)
        {
            super(imageWidth, imageHeight);
            this.originalWidth = imageWidth;
            this.originalHeight = imageHeight;
            this.offsetX = offsetX;
            this.offsetY = offsetY;
            mouseEnabled = false;
            mouseChildren = false;
            if (imagePath)
            {
                this.loadImage(imagePath); // _SafeStr_1887
            };
        }

        public function centerHorizontally():void // _SafeStr_1884
        {
            this.bitmap.x = (int(((((this.centerWidth) ? this.centerWidth : _width) - this.bitmap.width) / 2)) + this.offsetX);
        }

        public function setMaxSize(maxWidth:int, maxHeight:int):UI_Image // _SafeStr_1885
        {
            this.maxWidth = maxWidth;
            this.maxHeight = maxHeight;
            if (this.bitmap.bitmapData)
            {
                this.scaleToFit(); // _SafeStr_1895
            }
            else
            {
                this.bitmap.addEventListener("complete", this.onImageLoaded); // _SafeStr_1193
                this.needsScaleToFit = true;
            };
            return (this);
        }

        public function setBitmap(bitmapImage:Bitmap, newOffsetX:Number=NaN, newOffsetY:Number=NaN):UI_Image // _SafeStr_1886
        {
            if (((this.bitmap) && (this.bitmap.parent)))
            {
                this.bitmap.parent.removeChild(this.bitmap);
            };
            if (!isNaN(newOffsetX))
            {
                this.offsetX = newOffsetX;
            };
            if (!isNaN(newOffsetY))
            {
                this.offsetY = newOffsetY;
            };
            this.bitmap = bitmapImage;
            this.bitmap.x = this.offsetX;
            this.bitmap.y = this.offsetY;
            addChildAt(this.bitmap, 0);
            return (this);
        }

        public function loadImage(imagePath:String):UI_Image // _SafeStr_1887
        {
            if (((this.bitmap) && (this.bitmap.parent)))
            {
                this.bitmap.parent.removeChild(this.bitmap);
            };
            var baseUrl:String = ((imagePath.indexOf("://") > -1) ? "" : "http://www.transformice.com/images/");
            this.bitmap = DomainManager.loadImage(imagePath, baseUrl);
            this.bitmap.x = this.offsetX;
            this.bitmap.y = this.offsetY;
            addChildAt(this.bitmap, 0);
            return (this);
        }

        public function setOnLoadCallback(callback:Function, params:Object=null):void // _SafeStr_1888
        {
            this.onLoadCallback = callback;
            this.onLoadParams = params;
            this.bitmap.addEventListener("complete", this.onImageLoaded); // _SafeStr_1193
            if (((this.bitmap.bitmapData) && (!(this.onLoadCallback == null))))
            {
               DomainManager.callFunction(this.onLoadCallback, this.onLoadParams);
            };
        }

        public function onScaleChanged(event:Event):void // _SafeStr_1889
        {
            this.applyScale(); // _SafeStr_1893
        }

        public function onImageLoaded(event:Event):void // _SafeStr_1193
        {
            this.bitmap.removeEventListener("complete", this.onImageLoaded);
            if (this.needsScaleToFit)
            {
                this.needsScaleToFit = false;
                this.scaleToFit(); // _SafeStr_1895
            };
            if (this.needsAutoResize)
            {
                this.needsAutoResize = false;
                this.centerImage(); // _SafeStr_1896
            };
            if (this.onLoadCallback != null)
            {
                DomainManager.callFunction(this.onLoadCallback, this.onLoadParams);
            };
        }

        public function setCenterArea(centerWidth:int=0, centerHeight:int=0):UI_Image // _SafeStr_1890
        {
            this.centerWidth = centerWidth;
            this.centerHeight = centerHeight;
            if (this.bitmap.bitmapData)
            {
                this.centerImage(); // _SafeStr_1896
            }
            else
            {
                this.bitmap.addEventListener("complete", this.onImageLoaded); // _SafeStr_1193
                this.needsAutoResize = true;
            };
            return (this);
        }

        public function resizeToFit(targetWidth:int, targetHeight:int):UI_Image // _SafeStr_1891
        {
            return (this.setScale((targetWidth / this.originalWidth), (targetHeight / this.originalHeight))); // _SafeStr_1897
        }

        public function isLoaded():Boolean // _SafeStr_1892
        {
            return Boolean(this.bitmap.bitmapData);
        }

        public function applyScale():void // _SafeStr_1893
        {
            var scaledBitmapData:BitmapData;
            var newBitmap:Bitmap;
            if (this.bitmap.parent)
            {
                removeChild(this.bitmap);
            };
            if (!this.originalBitmapData)
            {
                this.originalBitmapData = this.bitmap.bitmapData;
            };
            this.bitmap.bitmapData = null;
            if (((this.imageScaleX == 1) && (this.imageScaleY == 1)))
            {
                scaledBitmapData = this.originalBitmapData;
            }
            else
            {
                scaledBitmapData = scaleBitmapData(this.originalBitmapData, this.imageScaleX, this.imageScaleY);
            };
            newBitmap = new Bitmap(scaledBitmapData);
            _width = newBitmap.bitmapData.width;
            _height = newBitmap.bitmapData.height;
            this.bitmap = newBitmap;
            addChildAt(newBitmap, 0);
        }

        public function disposeBitmap():void // _SafeStr_1894
        {
            this.bitmap.bitmapData = null;
            this.originalBitmapData = null;
        }

        public function update_box(fillColor:int=0, alpha:Number=1):UI_Image
        {
            graphics.beginFill(fillColor, alpha);
            graphics.drawRect(0, 0, _width, _height);
            graphics.endFill();
            return (this);
        }

        public function scaleToFit():void // _SafeStr_1895
        {
            var scaleRatio:Number = (this.maxWidth / this.bitmap.bitmapData.width);
            var heightRatio:Number = (this.maxHeight / this.bitmap.bitmapData.height);
            if (heightRatio < scaleRatio)
            {
                scaleRatio = heightRatio;
            };
            if (scaleRatio < 1)
            {
                this.setScale(scaleRatio); // _SafeStr_1897
                _width = this.maxWidth;
                _height = this.maxHeight;
            };
        }

        public function centerImage():void // _SafeStr_1896
        {
            this.bitmap.x = (int(((((this.centerWidth) ? this.centerWidth : _width) - this.bitmap.width) / 2)) + this.offsetX);
            this.bitmap.y = (int(((((this.centerHeight) ? this.centerHeight : this.maxHeight) - this.bitmap.height) / 2)) + this.offsetY);
        }

        public function setScale(scaleX:Number, scaleY:Number=0):UI_Image // _SafeStr_1897
        {
            if (0 == scaleY)
            {
                scaleY = scaleX;
            };
            if (((scaleX == this.imageScaleX) && (scaleY == this.imageScaleY)))
            {
                return (this);
            };
            this.imageScaleX = scaleX;
            this.imageScaleY = scaleY;
            _width = (_width * scaleX);
            _height = (_height * scaleY);
            if (this.bitmap.bitmapData)
            {
                this.applyScale(); // _SafeStr_1893
            }
            else
            {
                this.bitmap.addEventListener("complete", this.onScaleChanged); // _SafeStr_1889
            };
            return (this);
        }


        public static function scaleBitmapData(_arg_1:BitmapData, _arg_2:Number, _arg_3:Number=0):BitmapData
        {
            if (0 == _arg_3)
            {
                _arg_3 = _arg_2;
            };
            var _local_4:int = Math.round((_arg_1.width * _arg_2));
            var _local_5:int = Math.round((_arg_3 * _arg_1.height));
            var _local_6:BitmapData = new BitmapData(_local_4, _local_5, _arg_1.transparent, 0);
            var _local_7:Matrix = new Matrix();
            _local_7.scale(_arg_2, _arg_3);
            _local_6.draw(_arg_1, _local_7, null, null, null, true);
            return (_local_6);
        }


    }
}//package