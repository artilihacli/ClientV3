package ChargeurTransformice_fla.Packets.Incoming {
	import flash.utils.*;

	public class IncomingPacket {

        public var C:int;
        public var CC:int;
        public var buffer:ByteArray;

        public function IncomingPacket(_buffer:ByteArray) {
            buffer = _buffer;
            buffer.position = 0;
            this.C = buffer.readByte();
            this.CC = buffer.readByte();
        }

        public function readXML():String
        {
            var _local_1:int = this.buffer.readInt();
            if (!_local_1)
            {
                return ("");
            };
            var _local_2:ByteArray = new ByteArray();
            this.buffer.readBytes(_local_2, 0, _local_1);
            _local_2.uncompress("zlib");
            _local_2.position = 0;
            return _local_2.readUTFBytes(_local_2.length);
        }

        public static function readNumber(_arg_1:ByteArray):int
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int = -1;
            do 
            {
                _local_3 = _arg_1.readByte();
                _local_2 |= (_local_3 & 0x7F) << (7 * _local_4);
                _local_5 <<= 7;
                _local_4++;
            } while ((_local_3 & 0x80) == 128 && _local_4 < 5);
            if (((_local_5 >> 1) & _local_2) != 0)
            {
                _local_2 |= _local_5;
            };
            return _local_2;
        }


    }

}