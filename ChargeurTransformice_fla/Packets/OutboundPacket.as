package ChargeurTransformice_fla.Packets {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.net.*;
	import flash.system.*;
	import flash.text.*;
    import ChargeurTransformice_fla.SocketHandler;

	public class OutboundPacket extends ByteArray {

        public var C:int; // Command
        public var CC:int; // Command Code

        public function OutboundPacket(C:int, CC:int) {
            super();
            this.C = C;
            this.CC = CC;
            this.writeByte(C);
            this.writeByte(CC);
        }

        public function writeNumber(param2:int) : void
        {
            var _loc3_:* = param2 >> 7;
            var _loc4_:Boolean = true;
            var _loc5_:int = (param2 & 2147483648) == 0 ? 0 : int(-1);
            while(_loc4_)
            {
                _loc4_ = _loc3_ != _loc5_ || (_loc3_ & 1) != (param2 >> 6 & 1);
                this.writeByte(param2 & 127 | (!!_loc4_ ? 128 : 0));
                param2 = _loc3_;
                _loc3_ >>= 7;
            }
        }

        public function sendMain():void {
            var packet:* = new Keys.instance.packet_out_class(C,CC);
            packet[Keys.instance.packet_out_bytes] = this;
            SocketHandler.sendMainPacket(packet);
        }

        public function sendBulle():void {
            var packet:* = new Keys.instance.packet_out_class(C,CC);
            packet[Keys.instance.packet_out_bytes] = this;
            SocketHandler.sendBullePacket(packet);
        }   

    }

}