package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;

	public class C_ShamanObject extends IncomingPacket {

        public var objectID:int;
        public var objectCode:int;
        public var x:int;
        public var y:int;
        public var angle:int;
        public var vx:Number;
        public var vy:Number;
        public var contactListener:Boolean;
        public var collidable:Boolean;
        public var colors:Array;

        public function C_ShamanObject(_buffer:ByteArray) {
            super(_buffer);
            this.objectID = _buffer.readInt();
            this.objectCode = readNumber(_buffer);
            this.x = readNumber(_buffer);
            this.y = readNumber(_buffer);
            this.angle = readNumber(_buffer) / 100;
            this.vx = readNumber(_buffer) / 100;
            this.vy = readNumber(_buffer) / 100;
            this.contactListener = _buffer.readBoolean();
            this.collidable = _buffer.readBoolean();
            this.colors = new Array();
            var colorCount:int = _buffer.readByte();
            for (var i:int = 0; i < colorCount; i++) {
                this.colors.push(_buffer.readInt());
            }
            
        }

    }

}