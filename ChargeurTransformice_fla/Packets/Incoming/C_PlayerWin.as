package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;

	public class C_PlayerWin extends IncomingPacket {

        public var type:int;
        public var playerCode:int;
        public var score:int;
        public var order:int;
        public var time:int;

        public function C_PlayerWin(_buffer:ByteArray) {
            super(_buffer);
            this.type = _buffer.readByte();
            this.playerCode = _buffer.readInt();
            this.score = _buffer.readShort();
            this.order = _buffer.readByte();
            this.time = _buffer.readUnsignedShort();
        }

    }

}