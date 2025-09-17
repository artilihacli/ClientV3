package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;

	public class C_Login extends IncomingPacket {

        public var playerID:int;
        public var playerName:String;
        public var playerTime:int;
        public var langueID:int;
        public var playerCode:int;
        public var isGuest:Boolean;
        public var perms:Array;
        public var isAdmin:Boolean;
        public var communities:Dictionary;

        public function C_Login(_buffer:ByteArray) {
            super(_buffer);
            this.playerID = _buffer.readInt();
            this.playerName = _buffer.readUTF();
            this.playerTime = _buffer.readInt();
            this.langueID = _buffer.readByte();
            this.playerCode = _buffer.readInt();
            this.isGuest = !_buffer.readBoolean();

            this.perms = new Array();
            var permsCount:int = _buffer.readByte();
            for (var i:int = 0; i < permsCount; i++) {
                this.perms.push(_buffer.readByte());
            }

            this.isAdmin = _buffer.readBoolean();
            _buffer.readShort(); // Not Implemented

            this.communities = new Dictionary();
            var commCount:int = _buffer.readUnsignedShort();
            for (var j:int = 0; j < commCount; j++) {
                this.communities[_buffer.readUTF()] = _buffer.readUTF();
            }


        }

    }

}