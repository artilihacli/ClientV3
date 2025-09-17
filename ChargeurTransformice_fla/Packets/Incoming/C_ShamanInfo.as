package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;

	public class C_ShamanInfo extends IncomingPacket {

        public var firstShamanID:int;
        public var secondShamanID:int;
        public var firstShamanType:int;
        public var secondShamanType:int;
        public var firstShamanSkillsCount:int;
        public var secondShamanSkillsCount:int;
        public var firstShamanBadge:int;
        public var secondShamanBadge:int;
        public var firstShamanNoSkills:Boolean;
        public var secondShamanNoSkills:Boolean;


        public function C_ShamanInfo(_buffer:ByteArray) {
            super(_buffer);
            this.firstShamanID = _buffer.readInt();
            this.secondShamanID = _buffer.readInt();
            this.firstShamanType = _buffer.readByte();
            this.secondShamanType = _buffer.readByte();
            this.firstShamanSkillsCount = _buffer.readShort();
            this.secondShamanSkillsCount = _buffer.readShort();
            this.firstShamanBadge = _buffer.readShort();
            this.secondShamanBadge = _buffer.readShort();
            this.firstShamanNoSkills = _buffer.readBoolean();
            this.secondShamanNoSkills = _buffer.readBoolean();
            
        }

    }

}