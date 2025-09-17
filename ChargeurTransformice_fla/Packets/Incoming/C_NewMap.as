package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;

	public class C_NewMap extends IncomingPacket {

        public var mapCode:int;
        public var playerCount:int;
        public var roundCode:int;
        public var XML:String;
        public var mapAuthor:String;
        public var mapCategory:int;
        public var isMirrored:Boolean;
        public var hasConjuration:Boolean;
        public var hasMiceCollisions:Boolean;
        public var hasFallDamage:Boolean;
        public var miceWeight:int;

        public function C_NewMap(_buffer:ByteArray) {
            super(_buffer);
            this.mapCode = _buffer.readInt();
            this.playerCount = _buffer.readShort();
            this.roundCode = _buffer.readByte();
            this.XML = readXML();
            this.mapAuthor = _buffer.readUTF();
            this.mapCategory = _buffer.readByte();
            this.isMirrored = _buffer.readBoolean();
            this.hasConjuration = _buffer.readBoolean();
            this.hasMiceCollisions = _buffer.readBoolean();
            this.hasFallDamage = _buffer.readBoolean();
            this.miceWeight = _buffer.readInt();
        }

    }

}