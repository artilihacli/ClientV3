package ChargeurTransformice_fla {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.net.*;
	import flash.system.*;
	import flash.text.*;
	import ChargeurTransformice_fla.Interface.*;
	import ChargeurTransformice_fla.*;
	import ChargeurTransformice_fla.Packets.*;
	import ChargeurTransformice_fla.Packets.Incoming.*;
	import ChargeurTransformice_fla.Hacks;
	import ChargeurTransformice_fla.Models.Player;
	public class Client {

		public static var HostURL = "http://127.0.0.1:8090/";

		public static var Menu:MainMenu;

		public static var roundCode:int;

		public static var currentMap:C_NewMap;

		public static function handlePacket(packet:ByteArray):void {
			var C:uint = packet.readUnsignedByte();
			var CC:uint = packet.readUnsignedByte();
			//trace("Incoming packet " + packet.length + ":" + C + "," + CC);
			if(C == 5 && CC == 2) {
				currentMap = new C_NewMap(packet);
				roundCode = currentMap.roundCode;
			} else if (C == 5 && CC == 20) {
				var shamanObjectPacket = new C_ShamanObject(packet);
			} else if (C == 5 && CC == 21) {
				var enterRoomPacket = new C_EnterRoom(packet);
			} else if (C == 4 && CC == 9) {
				var crouchPacket = new C_Crouch(packet);
			} else if (C == 6 && CC == 6) {
				var chatMessage:C_ChatMessage = new C_ChatMessage(packet);
			} else if (C == 8 && CC == 1) {
				var emote:C_Emote = new C_Emote(packet);
			} else if (C == 8 && CC == 6) {
				var playerWin:C_PlayerWin = new C_PlayerWin(packet);
			} else if (C == 8 && CC == 11) {
				var shamanInfo:C_ShamanInfo = new C_ShamanInfo(packet);
			} else if (C == 8 && CC == 44) {
				// disable animations player raise
			} else if (C == 26 && CC == 2) {
				var loginData:C_Login = new C_Login(packet);
			} else if (C == 144 && CC == 1) {
				var playerList:C_PlayerList = new C_PlayerList(packet);
			} else if (C == 144 && CC == 2) {
				var newPlayer:C_NewPlayer = new C_NewPlayer(packet);
			} else if (C == 144 && CC == 6) {
				var playerGetCheese:C_PlayerGetCheese = new C_PlayerGetCheese(packet);
			} else if (C == 144 && CC == 28) {
				var playerMovement:C_PlayerMovement = new C_PlayerMovement(packet);
			}


			packet.position = 0;
			SocketHandler.handleInboundPacket(packet);
		}


		public static function loop(param1:Event):void {
			SocketHandler.checkMainSocket();
			SocketHandler.checkBulleSocket();
			if(HackStates.ImmortalMouse) Hacks.tempsPartieZero = int.MAX_VALUE; 

		}


		public static function filterPacket(bufferData:ByteArray) : Boolean
		{
			bufferData.position = 0;
			var C:uint = bufferData.readUnsignedByte();
			var CC:uint = bufferData.readUnsignedByte();



			return false;
		}


	}
}