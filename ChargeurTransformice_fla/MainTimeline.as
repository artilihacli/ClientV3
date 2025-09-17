package ChargeurTransformice_fla {
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.net.*;
	import flash.system.*;
	import flash.text.*;
	import ChargeurTransformice_fla.Interface.*;
	import ui.transformice.*;
	
	public class MainTimeline extends MovieClip {

		public static var HostURL = "http://127.0.0.1:8090/";

		public static var instance:MainTimeline;
		
		public var _C: MovieClip;

		public var Charge: Number;

		public var Chargeur: Loader;

		public var P: Number;

		public var date: Date;

		public var ChargementText: TextField;

		public function MainTimeline() {
			super();
			instance = this;
			this.ChargementText = new TextField();
			this.ChargementText.defaultTextFormat = new TextFormat("Courier New", 11, 4345711, true, null, null, null, null, TextFormatAlign.CENTER);
			this.ChargementText.height = 50;
			this.ChargementText.multiline = true;
			this.ChargementText.wordWrap = false;
			this.ChargementText.width = this._C.width;
			this.ChargementText.y = 390;
			this.ChargementText.x = 300;
			this._C.addChild(this.ChargementText);
			this.ChargementText.text = "0%";
			this.Load_Keys();
		}


		public function Load_Transformice(): void {
			this.Charge = 0;
			this._C._B.width = 1;
			this.Chargeur = new Loader();
			this.Chargeur.mouseEnabled = false;
			this.P = 0;
			this.Chargeur.contentLoaderInfo.addEventListener(Event.COMPLETE, this.Chargement_Ok);
			this.Chargeur.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.Chargement_EnCours);
			stage.addChild(this.Chargeur);
			this.date = new Date();
			this.Chargeur.load(new URLRequest(HostURL + "Transformice.swf?n=" + this.date.time));
		}

		public function Chargement_EnCours(param1: ProgressEvent): void {
			if (param1.bytesLoaded > this.Charge) {
				this.Charge = param1.bytesLoaded;
			}
			var _loc2_: Number = param1.bytesTotal;
			this.P = this.Charge / _loc2_;
			this._C._B.width = this.P * 200;
			this.ChargementText.text = "Keys Loaded.\nTransformice Loading: " + int(this.P*100) + "%";
		}

		public function Chargement_Ok(param1: Event): void {
			this.Chargeur.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.Chargement_Ok);
			this.Chargeur.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.Chargement_EnCours);
			this.Charge = 0;
			removeChild(this._C);
			this.InitTransformice(param1);
		}

		public function Load_Keys(): void {
			Security.allowDomain("*");
			this._C._B.width = 1;
			this._C.mouseEnabled = false;
			this._C.mouseChildren = false;
			var KeysLoader: URLLoader = new URLLoader();
			KeysLoader.addEventListener(ProgressEvent.PROGRESS, this.Keys_Loading);
			KeysLoader.addEventListener(Event.COMPLETE, this.Keys_Loaded);
			var KeysRequest: URLRequest = new URLRequest(HostURL + "get_keys?d=" + new Date().time);
			KeysRequest.method = URLRequestMethod.GET;
			KeysLoader.load(KeysRequest);
		}

		public function Keys_Loading(param1: ProgressEvent): void {
			var ratio:Number = param1.bytesLoaded / param1.bytesTotal;
			this._C._B.width = ratio * 200;
			this.ChargementText.text = "Keys Loading: " + int(ratio*100) + "%";
		}

		public function Keys_Loaded(param1: Event): void {
			new Keys(param1.target.data);
			this.ChargementText.text = "Keys Loaded.";
			this.Load_Transformice();
		}
	
		public function InitTransformice(param1: Event) : void {
			Keys.Transformice = param1.currentTarget.content;
			Keys.Transformice[Keys.instance.bypass_code] = 8125;
			Keys.TFMLoaderInfo = LoaderInfo(param1.target);
			Keys.instance.parse_classes();
			Keys.instance.CheckKeys();
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN,KeyboardHandler.Parse_KeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,KeyboardHandler.Parse_KeyUp);
			DomainManager.tfm = Keys.Transformice;
			DomainManager.stage = Keys.Transformice.stage;

			stage.addEventListener(Event.ENTER_FRAME, Client.loop);
			trace("Transformice Initialized");
			if(Keys.instance.socket_class)
			{
				trace("Binding Filter Function...");
				try{
					Keys.instance.socket_class["filterFunc"] = Client.filterPacket;
					trace("Filter Function Bound");
				}
				catch(error:Error){ trace(error.toString());}
			}

			//new UI_Sprite(100,100);
		}
	
	
	}
}