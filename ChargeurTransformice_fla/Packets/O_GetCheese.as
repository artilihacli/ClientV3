package ChargeurTransformice_fla.Packets {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.net.*;
	import flash.system.*;
	import flash.text.*;
    import ChargeurTransformice_fla.SocketHandler;

	public class O_GetCheese extends OutboundPacket {

        public function O_GetCheese(roundCode:int) {
            super(5, 19);
            writeInt();
            writeShort();
            writeShort();
            writeByte();
            writeByte();
            writeShort();
        }

    }

}