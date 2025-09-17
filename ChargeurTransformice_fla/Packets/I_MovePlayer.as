package ChargeurTransformice_fla.Packets {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.net.*;
	import flash.system.*;
	import flash.text.*;
    import ChargeurTransformice_fla.SocketHandler;

	public class I_MovePlayer extends InboundPacket {

        public function I_MovePlayer(x:int, y:int, relativePos:Boolean, vx:int, vy:int, relativeVel:Boolean) {
            super(8, 3);
            writeNumber(x);
            writeNumber(y);
            writeBoolean(relativePos);
            writeNumber(vx);
            writeNumber(vy);
            writeBoolean(relativeVel);
        }

    }

}