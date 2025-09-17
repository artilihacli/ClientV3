package ChargeurTransformice_fla.Interface.General {

	import ChargeurTransformice_fla.Keys;
	import ChargeurTransformice_fla.Interface.*;
	import flash.display.*;
	import coms.bit101.components.*;
	import flash.events.*;
	import ui.transformice.*;

	public class GeneticMenu extends UI_Element {

		public var SpriteSpeed: *;
		public var CheckBoxSpeed: CheckBox;
		public var SliderSpeed: Slider;
		public var SliderLabelSpeed: Label;

		public var SpriteJumpHeight: *;
		public var CheckBoxJumpHeight: CheckBox;
		public var SliderJumpHeight: Slider;
		public var SliderLabelJumpHeight: Label;

		public var SpriteAgility: *;
		public var CheckBoxAgility: CheckBox;
		public var SliderAgility: Slider;
		public var SliderLabelAgility: Label;

		public var SpritePulo: *;
		public var CheckBoxPulo: CheckBox;
		public var SliderPulo: Slider;
		public var SliderLabelPulo: Label;

		public var SpriteMouseSize: *;
		public var CheckBoxMouseSize: CheckBox;
		public var SliderMouseSize: Slider;
		public var SliderLabelMouseSize: Label;

		public var SpriteCheeseSize: *;
		public var CheckBoxCheeseSize: CheckBox;
		public var SliderCheeseSize: Slider;
		public var SliderLabelCheeseSize: Label;

		public var SpriteReduceMass: *;
		public var CheckBoxReduceMass: CheckBox;
		public var SliderReduceMass: Slider;
		public var SliderLabelReduceMass: Label;

		public var SpriteBornPeriod: *;
		public var CheckBoxBornPeriod: CheckBox;
		public var SliderBornPeriod: Slider;
		public var SliderLabelBornPeriod: Label;

		public var SpriteLeve: *;
		public var CheckBoxLeve: CheckBox;
		public var SliderLeve: Slider;
		public var SliderLabelLeve: Label;

		public static const _W = 360;
		public static const X_Check = 10;
		public static const X_Slider = 150;
		public static const Y_Check = 10;
		public static const Y_Spacing = 20;

		public function GeneticMenu()  {
			super(_W, 185);
			this.set_prep_ui(LayoutDirection.VERTICAL);

			//this.SpriteSpeed = new TFMSprite(360,30);
			this.SpriteSpeed = new UI_Element(_W, Y_Spacing);
            this.CheckBoxSpeed = new CheckBox(this.SpriteSpeed, X_Check, Y_Check, "Speed:");
            this.SliderSpeed = new Slider("horizontal", this.SpriteSpeed, X_Slider, Y_Check + 2, this.OnSliderSpeedChanged);
            this.SliderLabelSpeed = new Label(this.SliderSpeed._handle, 0, -4, 0, -1, 12501444);

			this.SpriteJumpHeight = new UI_Element(_W, Y_Spacing);
			this.CheckBoxJumpHeight = new CheckBox(this.SpriteJumpHeight, X_Check, Y_Check, "Jump Height:");
			this.SliderJumpHeight = new Slider("horizontal", this.SpriteJumpHeight, X_Slider, Y_Check + 2, this.OnSliderJumpHeightChanged);
			this.SliderLabelJumpHeight = new Label(this.SliderJumpHeight._handle, 0, -4, "0", -1, 12501444);
			
			// Agility
			this.SpriteAgility = new UI_Element(_W, Y_Spacing);
			this.CheckBoxAgility = new CheckBox(this.SpriteAgility, X_Check, Y_Check, "Agility:");
			this.SliderAgility = new Slider("horizontal", this.SpriteAgility, X_Slider, Y_Check + 2, this.OnSliderAgilityChanged);
			this.SliderLabelAgility = new Label(this.SliderAgility._handle, 0, -4, "0", -1, 12501444);
			
			// Pulo
			this.SpritePulo = new UI_Element(_W, Y_Spacing);
			this.CheckBoxPulo = new CheckBox(this.SpritePulo, X_Check, Y_Check, "Pulo:");
			this.SliderPulo = new Slider("horizontal", this.SpritePulo, X_Slider, Y_Check + 2, this.OnSliderPuloChanged);
			this.SliderLabelPulo = new Label(this.SliderPulo._handle, 0, -4, "0", -1, 12501444);
			
			// Mouse Size
			this.SpriteMouseSize = new UI_Element(_W, Y_Spacing);
			this.CheckBoxMouseSize = new CheckBox(this.SpriteMouseSize, X_Check, Y_Check, "Mouse Size:");
			this.SliderMouseSize = new Slider("horizontal", this.SpriteMouseSize, X_Slider, Y_Check + 2, this.OnSliderMouseSizeChanged);
			this.SliderLabelMouseSize = new Label(this.SliderMouseSize._handle, 0, -4, "0", -1, 12501444);
			
			// Cheese Size
			this.SpriteCheeseSize = new UI_Element(_W, Y_Spacing);
			this.CheckBoxCheeseSize = new CheckBox(this.SpriteCheeseSize, X_Check, Y_Check, "Cheese Size:");
			this.SliderCheeseSize = new Slider("horizontal", this.SpriteCheeseSize, X_Slider, Y_Check + 2, this.OnSliderCheeseSizeChanged);
			this.SliderLabelCheeseSize = new Label(this.SliderCheeseSize._handle, 0, -4, "0", -1, 12501444);
			
			// Reduce Mass
			this.SpriteReduceMass = new UI_Element(_W, Y_Spacing);
			this.CheckBoxReduceMass = new CheckBox(this.SpriteReduceMass, X_Check, Y_Check, "Reduce Mass:");
			this.SliderReduceMass = new Slider("horizontal", this.SpriteReduceMass, X_Slider, Y_Check + 2, this.OnSliderReduceMassChanged);
			this.SliderLabelReduceMass = new Label(this.SliderReduceMass._handle, 0, -4, "0", -1, 12501444);
			
			// Born Period
			this.SpriteBornPeriod = new UI_Element(_W, Y_Spacing);
			this.CheckBoxBornPeriod = new CheckBox(this.SpriteBornPeriod, X_Check, Y_Check, "Born Period:");
			this.SliderBornPeriod = new Slider("horizontal", this.SpriteBornPeriod, X_Slider, Y_Check + 2, this.OnSliderBornPeriodChanged);
			this.SliderLabelBornPeriod = new Label(this.SliderBornPeriod._handle, 0, -4, "0", -1, 12501444);
			
			// Leve
			this.SpriteLeve = new UI_Element(_W, Y_Spacing);
			this.CheckBoxLeve = new CheckBox(this.SpriteLeve, X_Check, Y_Check, "Leve:");
			this.SliderLeve = new Slider("horizontal", this.SpriteLeve, X_Slider, Y_Check + 2, this.OnSliderLeveChanged);
			this.SliderLabelLeve = new Label(this.SliderLeve._handle, 0, -4, "0", -1, 12501444);
			
			this.add_ui_element(
				this.SpriteSpeed,
				this.SpriteJumpHeight,
				this.SpriteAgility,
				this.SpritePulo,
				this.SpriteMouseSize,
				this.SpriteCheeseSize,
				this.SpriteReduceMass,
				this.SpriteBornPeriod,
				this.SpriteLeve
			);

		}
	
		public function OnSliderSpeedChanged(param1:Event): void {
			this.SliderLabelSpeed.text = String(int(this.SliderSpeed.value));
		}

		public function OnSliderJumpHeightChanged(param1:Event): void {
			this.SliderLabelJumpHeight.text = String(int(this.SliderJumpHeight.value));
		}

		public function OnSliderAgilityChanged(param1:Event): void {
			this.SliderLabelAgility.text = String(int(this.SliderAgility.value));
		}

		public function OnSliderPuloChanged(param1:Event): void {
			this.SliderLabelPulo.text = String(int(this.SliderPulo.value));
		}

		public function OnSliderMouseSizeChanged(param1:Event): void {
			this.SliderLabelMouseSize.text = String(int(this.SliderMouseSize.value));
		}

		public function OnSliderCheeseSizeChanged(param1:Event): void {
			this.SliderLabelCheeseSize.text = String(int(this.SliderCheeseSize.value));
		}

		public function OnSliderReduceMassChanged(param1:Event): void {
			this.SliderLabelReduceMass.text = String(int(this.SliderReduceMass.value));
		}

		public function OnSliderBornPeriodChanged(param1:Event): void {
			this.SliderLabelBornPeriod.text = String(int(this.SliderBornPeriod.value));
		}

		public function OnSliderLeveChanged(param1:Event): void {
			this.SliderLabelLeve.text = String(int(this.SliderLeve.value));
		}
	}
}