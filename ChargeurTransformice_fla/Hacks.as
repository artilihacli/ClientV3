package ChargeurTransformice_fla {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.net.*;
	import flash.system.*;
	import flash.text.*;
	import ChargeurTransformice_fla.Interface.*;
    import ChargeurTransformice_fla.Packets.*;

	public class Hacks {


		public static function create_shaman_object(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=0, _arg_5:Number=0, _arg_6:Number=0, _arg_7:Boolean=true):void
        {
            try
            {
                Keys.Transformice[Keys.instance.player][Keys.instance.player_is_shaman] = true;
                Keys.instance.CSync_class[Keys.instance.Synchroniseur] = true;
            }
            catch(E:Error)
            {
            };
            Keys.instance.create_class[Keys.instance.create_function](_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7);
        }

        public static function teleport():void {
			SocketHandler.handleInboundPacket(new I_MovePlayer(Hacks.mouseX, Hacks.mouseY, false, 0, 0, false));
        }

        public static function fakeTeleport():void {
            var player:* = Keys.Transformice[Keys.instance.player];
            if (player == null) return;
            player.x = Hacks.mouseX;
            player.y = Hacks.mouseY;
        }

        public static function quickTeleport():void {
            var player:* = Keys.Transformice[Keys.instance.player];
            if (player == null) return;
            var _x:Number = player.x;
            var _y:Number = player.y;
            SocketHandler.handleInboundPacket(new I_MovePlayer(Hacks.mouseX, Hacks.mouseY, false, 0, 0, false));
            setTimeout(SocketHandler.handleInboundPacket, 10, new I_MovePlayer(_x, _y, false, 0, 0, false));
        }

        public static function fly():void {
            SocketHandler.handleInboundPacket(new I_MovePlayer(0, 0, false, 0, -50, false));
        }

        public static function spFly():void {
            var player:* = Keys.Transformice[Keys.instance.player];
            if (player == null) return;
            create_shaman_object(24, player.x, player.y + 10);
        }

        public static function hideShowCheese():void {
            var player:* = Keys.Transformice[Keys.instance.player];
            if (player == null) return;
            player[Keys.instance.player_has_cheese] = !player[Keys.instance.player_has_cheese];
        }

        public static function instantWin():void {
            //SocketHandler.handleInboundPacket(new I_PlayerVictory());
        }

        public static function get mouseX():Number {
            if (Keys.instance.map_class && Keys.instance.map_class[Keys.instance.map_instance]) {
                return Keys.instance.map_class[Keys.instance.map_instance].mouseX;
            }
            return Keys.Transformice.stage.mouseX;
        }

        public static function get mouseY():Number {
            if (Keys.instance.map_class && Keys.instance.map_class[Keys.instance.map_instance]) {
				return Keys.instance.map_class[Keys.instance.map_instance].mouseY;
			}
            return Keys.Transformice.stage.mouseY;
        }

        public static function set tempsPartieZero(param1:int): void {
            Keys.Transformice["tempsPartieZero"] = param1;
        }

	}
}