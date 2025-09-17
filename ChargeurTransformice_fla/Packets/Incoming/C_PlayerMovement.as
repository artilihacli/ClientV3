package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;

	public class C_PlayerMovement extends IncomingPacket {

        public var playerCode:int;
        public var movingRight:Boolean;
        public var movingLeft:Boolean;
        public var x:int;
        public var y:int;
        public var vx:int;
        public var vy:int;
        public var frictionCharge:int;
        public var frictionLossRate:int;
        public var jump:Boolean;
        public var jumpImg:int;
        public var portal:int;
        
        public var angle:int;
        public var velAngle:int;
        public var fixedRotation:Boolean;

        public function C_PlayerMovement(_buffer:ByteArray) {
            super(_buffer);
            this.playerCode = readNumber(_buffer);
            this.movingRight = _buffer.readBoolean();
            this.movingLeft = _buffer.readBoolean();
            this.x = readNumber(_buffer);
            this.y = readNumber(_buffer);
            this.vx = readNumber(_buffer);
            this.vy = readNumber(_buffer);
            this.frictionCharge = readNumber(_buffer);
            this.frictionLossRate = readNumber(_buffer);
            this.jump = _buffer.readBoolean();
            this.jumpImg = readNumber(_buffer);
            this.portal = readNumber(_buffer);
            if (_buffer.bytesAvailable > 0) {
                this.angle = readNumber(_buffer);
                this.velAngle = readNumber(_buffer);
                this.fixedRotation = _buffer.readBoolean();
            }

        }

    }

}