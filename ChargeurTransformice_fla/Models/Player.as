package ChargeurTransformice_fla.Models {
	import flash.utils.*;


	public class Player {

		public var playerName:String;
		public var playerCode:int;
		public var isShaman:Boolean;
        public var stateDead:int;
        public var score:int;
        public var cheeseCount:int;
        public var title:int;
        public var titleStars:int;
        public var gender:int;
        public var avatar:String;
        public var mouseLook:String;
        public var rasterisation:Boolean;
        public var mouseColor:int;
        public var shamanColor:int;
        public var unknownStat:int;
        public var nameColor:int;
        public var cheeseCode:int;

        public function Player(_buffer:ByteArray) {
            this.playerName = _buffer.readUTF();
            this.playerCode = _buffer.readInt();
            this.isShaman = _buffer.readBoolean();
            this.stateDead = _buffer.readByte();
            this.score = _buffer.readShort();
            this.cheeseCount = _buffer.readByte();
            this.title = _buffer.readShort();
            this.titleStars = _buffer.readByte();
            this.gender = _buffer.readByte();
            this.avatar = _buffer.readUTF();
            this.mouseLook = _buffer.readUTF();
            this.rasterisation = _buffer.readBoolean();
            this.mouseColor = _buffer.readInt();
            this.shamanColor = _buffer.readInt();
            this.unknownStat = _buffer.readInt();
            this.nameColor = _buffer.readInt();
            this.cheeseCode = _buffer.readUnsignedByte();
        }

    }

}