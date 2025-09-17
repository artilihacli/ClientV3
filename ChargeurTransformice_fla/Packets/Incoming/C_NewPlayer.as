package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;
    import ChargeurTransformice_fla.Models.Player;

	public class C_NewPlayer extends IncomingPacket {

        public var player:Player;
        public var skipAnim:Boolean;
        public var refreshMenu:Boolean;

        public function C_NewPlayer(_buffer:ByteArray) {
            super(_buffer);
            this.player = new Player(_buffer);
            this.skipAnim = _buffer.readBoolean();
            this.refreshMenu = _buffer.readBoolean();
        }

    }

}
