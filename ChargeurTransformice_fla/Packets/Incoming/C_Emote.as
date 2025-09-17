package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;

	public class C_Emote extends IncomingPacket {

        public var playerCode:int;
        public var emote:int;
        public var flag:String;
        public var isFromLua:Boolean;

        public function C_Emote(_buffer:ByteArray) {
            super(_buffer);
            this.playerCode = _buffer.readInt();
            this.emote = _buffer.readByte();
            if(this.emote == 10) {
                this.flag = _buffer.readUTF();       
            }
            this.isFromLua = _buffer.readBoolean();
        }

    }

}