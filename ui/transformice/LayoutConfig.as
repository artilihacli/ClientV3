package ui.transformice
{
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class LayoutConfig 
    {

        public static const DEFAULT_HORIZONTAL:LayoutConfig = new LayoutConfig(LayoutDirection.HORIZONTAL);//PREP UI 1
        public static const DEFAULT_VERTICAL:LayoutConfig = new LayoutConfig(LayoutDirection.VERTICAL);//PREP UI 4

        public var direction:LayoutDirection;
        public var padding:int = 0;
        public var horizontalSpacing:int = 2;
        public var verticalSpacing:int = 2;
        public var customPositions:Vector.<int>;

        public function LayoutConfig(_arg_1:LayoutDirection, _arg_2:int=2, _arg_3:int=0)
        {
            this.direction = _arg_1;
            this.horizontalSpacing = _arg_2;
            this.verticalSpacing = _arg_2;
            this.padding = _arg_3;
        }

        public static function createCustomLayout(... _args):LayoutConfig
        {
            var _local_2:LayoutConfig = new LayoutConfig(LayoutDirection.CUSTOM);
            _local_2.customPositions = new Vector.<int>();
            _local_2.customPositions.push.apply(null, _args);
            return (_local_2);
        }


        public function isHorizontalLayout():Boolean
        {
            return (((this.direction == LayoutDirection.WRAP_HORIZONTAL) || (this.direction == LayoutDirection.HORIZONTAL)) || (this.direction == LayoutDirection.REVERSE_HORIZONTAL));
        }

        public function setCustomPositions(_arg_1:Vector.<int>):LayoutConfig
        {
            if (this.direction != LayoutDirection.CUSTOM)
            {
                return (this);
            };
            this.customPositions = _arg_1;
            return (this);
        }

        public function setPadding(_arg_1:int):LayoutConfig
        {
            this.padding = _arg_1;
            return (this);
        }


    }

}