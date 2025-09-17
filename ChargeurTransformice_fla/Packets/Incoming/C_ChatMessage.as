package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;

	public class C_ChatMessage extends IncomingPacket {

        public var playerName:String;
        public var message:String;
        public var arg:Boolean;

        public function C_ChatMessage(_buffer:ByteArray) {
            super(_buffer);
            this.playerName = _buffer.readUTF();
            this.message = _buffer.readUTF();
            this.arg = _buffer.readBoolean();
        }

    }

}