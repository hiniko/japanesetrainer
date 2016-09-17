 package{
	
	import flash.display.MovieClip;
	import flash.text.*;
	import caurina.transitions.*;
	
	
	public class textButton extends MovieClip{
		
		private var _buttonLabel:String;
		private var _btnText:TextField;
		private var _btnFormat:TextFormat;
		private var _origH:Number;
		private var _origW:Number;
		private var _growH:Number;
		private var _growW:Number;
		private var _btnName:String;
		
		public function textButton(buttonLabel:String, size:Number, btnName:String){
			//Set the text for the button
			_buttonLabel = buttonLabel;
			//
			_btnName = btnName;
			
			this.buttonMode = true; 
 			this.mouseChildren = false;

						
			//make the format for the  text fiend
			_btnFormat = new TextFormat();
			_btnFormat.size = 16;
			_btnFormat.bold = true;
			_btnFormat.align = TextFormatAlign.CENTER;
			_btnFormat.font = 'Arial';
			
			
			//make the text field
			_btnText = new TextField();
			_btnText.defaultTextFormat = _btnFormat;
			_btnText.selectable = false;
			_btnText.text = _buttonLabel;
			_btnText.autoSize = TextFieldAutoSize.CENTER;
			
			//add the button to the object 
			addChild(_btnText);			
			
			
			// set class vars
			_origH = this.height;
			_origW = this.width;
			
			_growH = this.height + size;
			_growW = this.width + size;
		}
		
		public function over(evt){
			this.height = _growH;
			this.width = _growW;
			
			//Tweener.addTween(this, {height:growH, width:growW, time:.5, transition:"linear"});
		}
		
		public function out(evt){
			this.height = _origH;
			this.width = _origW;
		}
		
		public function getName(){
			return _btnName;
		}
		
		public function setText(newName:String){
			_btnText.text = newName;
		}
		
	}
	
}