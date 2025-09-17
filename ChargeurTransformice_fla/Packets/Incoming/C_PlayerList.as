package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;
    import ChargeurTransformice_fla.Models.Player;

	public class C_PlayerList extends IncomingPacket {

        public var players:Array;

        public function C_PlayerList(_buffer:ByteArray) {
            super(_buffer);
            var count:int = _buffer.readShort();
            players = new Array();
            for (var i:int = 0; i < count; i++) {
                players.push(new Player(_buffer));
            }
        }

    }

}