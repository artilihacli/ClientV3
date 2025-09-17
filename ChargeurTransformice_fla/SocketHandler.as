package ChargeurTransformice_fla {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.net.*;
	import flash.system.*;
	import flash.text.*;
	import ChargeurTransformice_fla.Interface.*;

	public class SocketHandler {

        public static var currentMainSocket:Socket;
        public static var currentBulleSocket:Socket;
        public static var currentMainSocketClass:*;
        public static var currentBulleSocketClass:*;


        public static function handleInboundPacket(packet:ByteArray):void {
            Keys.instance.packet_handler_class[Keys.instance.packet_handler](packet);
        }

        public static function sendMainPacket(packet:*):void {
            Keys.instance.socket_class[Keys.instance.main_socket_instance][Keys.instance.data_sender](packet);
        }

        public static function sendBullePacket(packet:*):void {
            Keys.instance.socket_class[Keys.instance.bulle_socket_instance][Keys.instance.data_sender](packet);
        }


        public static function checkMainSocket():void {
            
            if(Keys.instance.socket_class[Keys.instance.main_socket_instance] != currentMainSocketClass)
            {
                var socket:Socket = mainSocket;
                if(!socket) return;
                socket.removeEventListener(ProgressEvent.SOCKET_DATA,Keys.instance.socket_class[Keys.instance.main_socket_instance][Keys.instance.event_socket_data]);
                currentMainSocket = socket;
                socket.addEventListener(ProgressEvent.SOCKET_DATA, onMainSocketData);
                socket.addEventListener(Event.CLOSE, onMainSocketClosed);
                currentMainSocketClass = Keys.instance.socket_class[Keys.instance.main_socket_instance];
            }
        }

        public static function checkBulleSocket():void {
            if(Keys.instance.socket_class[Keys.instance.bulle_socket_instance] != currentBulleSocketClass)
            {
                var socket:Socket = bulleSocket;
                if(!socket) return;
                socket.removeEventListener(ProgressEvent.SOCKET_DATA,Keys.instance.socket_class[Keys.instance.bulle_socket_instance][Keys.instance.event_socket_data]);
                currentBulleSocket = socket;
                socket.addEventListener(ProgressEvent.SOCKET_DATA, onBulleSocketData);
                socket.addEventListener(Event.CLOSE, onBulleSocketClosed);
                currentBulleSocketClass = Keys.instance.socket_class[Keys.instance.bulle_socket_instance];
            }
        }

        public static function onMainSocketData(event:ProgressEvent):void {
            onSocketData(event, false, "main");
        }

        public static function onBulleSocketData(event:ProgressEvent):void {
            onSocketData(event, false, "bulle");
        }

        public static function onSocketData(_arg_1:ProgressEvent=null, _arg_2:Boolean=false, _arg_3:String=null):void
        {
            var _local_5:int;
            var _local_4:* = Keys.instance.socket_class[Keys.instance[(_arg_3 + "_socket_instance")]];
            var _local_6:Socket = _arg_3 == "main" ? mainSocket : bulleSocket;
            if (!_local_6.bytesAvailable)
            {
                return;
            };
            if (_arg_2)
            {
                _local_4[Keys.instance.data_id] = (_local_4[Keys.instance.data_id] + 1);
            }
            else
            {
                _local_4[Keys.instance.data_id] = 0;
            };
            if (!_local_4[Keys.instance.read_data])
            {
                do 
                {
                    if (!_local_6.bytesAvailable)
                    {
                        return;
                    };
                    _local_5 = (_local_6.readByte() & 0xFF);
                    _local_4[Keys.instance.data_len] = (_local_4[Keys.instance.data_len] | ((_local_5 & 0x7F) << (_local_4[Keys.instance.data_offset] * 7)));
                    _local_4[Keys.instance.data_offset] = (_local_4[Keys.instance.data_offset] + 1);
                } while ((((_local_5 & 0x80) == 128) && (_local_4[Keys.instance.data_offset] < 5)));
                _local_4[Keys.instance.read_data] = true;
            };
            if (((_local_4[Keys.instance.read_data]) && (_local_6.bytesAvailable >= _local_4[Keys.instance.data_len])))
            {
                _local_4[Keys.instance.socket_data].clear();
                try
                {
                    _local_6.readBytes(_local_4[Keys.instance.socket_data], 0, _local_4[Keys.instance.data_len]);
                    Client.handlePacket(_local_4[Keys.instance.socket_data]);
                }
                catch(e:Error)
                {
                    trace("Socket read error: " + e);
                };
                _local_4[Keys.instance.data_len] = 0;
                _local_4[Keys.instance.data_offset] = 0;
                _local_4[Keys.instance.read_data] = false;
                if (((_local_6.connected) && (_local_6.bytesAvailable)))
                {
                    if (_local_4[Keys.instance.data_id] < 200)
                    {
                        onSocketData(null, true, _arg_3);
                    }
                    else
                    {
                        onSocketData(null, false, _arg_3);
                    };
                };
            };
        }


        public static function onMainSocketClosed(param1:Event):void {
            param1.currentTarget.removeEventListener(ProgressEvent.SOCKET_DATA, onMainSocketData);
            param1.currentTarget.removeEventListener(Event.CLOSE, onMainSocketClosed);
        }

        public static function onBulleSocketClosed(param1:Event):void {
            param1.currentTarget.removeEventListener(ProgressEvent.SOCKET_DATA, onBulleSocketData);
            param1.currentTarget.removeEventListener(Event.CLOSE, onBulleSocketClosed);
        }

        public static function get mainSocket():Socket {
            var _loc2_:* = Keys.instance.socket_class[Keys.instance.main_socket_instance][Keys.instance.socket69]; //socket_index
            return Keys.Transformice["_nfs_801"](_loc2_) as Socket;
        }

        public static function get bulleSocket():Socket {
            var _loc2_:* = Keys.instance.socket_class[Keys.instance.bulle_socket_instance][Keys.instance.socket69];
            return Keys.Transformice["_nfs_801"](_loc2_) as Socket;
        }



    }

}