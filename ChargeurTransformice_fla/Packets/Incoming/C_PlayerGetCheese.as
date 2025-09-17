package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;

	public class C_PlayerGetCheese extends IncomingPacket {

        public var playerCode:int;
        public var cheeses:int;

        public function C_PlayerGetCheese(_buffer:ByteArray) {
            super(_buffer);
            this.playerCode = _buffer.readInt();
            this.cheeses = _buffer.readByte();
        }

    }

}