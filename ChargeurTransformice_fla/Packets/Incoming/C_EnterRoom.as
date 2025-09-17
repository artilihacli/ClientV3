package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;

	public class C_EnterRoom extends IncomingPacket {

        public var official:Boolean;
        public var roomName:String;
        public var community:String;

        public function C_EnterRoom(_buffer:ByteArray) {
            super(_buffer);
            this.official = _buffer.readBoolean();
            this.roomName = _buffer.readUTF();
            this.community = _buffer.readUTF();
        }

    }

}