package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;

	public class C_Crouch extends IncomingPacket {

        public var playerCode:int;
        public var crouch:int;

        public function C_Crouch(_buffer:ByteArray) {
            super(_buffer);
            this.playerCode = _buffer.readInt();
            this.crouch = _buffer.readByte();
        }

    }

}