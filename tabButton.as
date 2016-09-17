package{
	
	import flash.display.*;
	import flash.text.*;

	
	public class tabButton extends MovieClip{
		
		private var _btnName = null;
		private var _buttonTxt = new TextField();
		
		public function tabButton(btnLabel:String,btnColor = 0xFF0000,txtFormat = null, btnName = null){
			
			//Check if there is a text format to use
			if(txtFormat == null){
				var txtFormat = new TextFormat();
				txtFormat.size = 20;
				txtFormat.bold = true;
				txtFormat.align = TextFormatAlign.CENTER;
				txtFormat.font = 'Arial';
				txtFormat.color = 0xFFFFFF;
			}
			
			if(btnName != null){
				_btnName = btnName;								
			}
			
			_buttonTxt.embedFonts = true;
            _buttonTxt.antiAliasType = 'advanced';
			_buttonTxt.defaultTextFormat = txtFormat;
			_buttonTxt.selectable = false;
			_buttonTxt.text = btnLabel;
			_buttonTxt.x = 5;
			_buttonTxt.y = 2;
			_buttonTxt.autoSize = TextFieldAutoSize.LEFT;
			
			//Start test button
			var btnW = _buttonTxt.width +10;
			var button:MovieClip = new MovieClip();
			button.buttonMode = true; 
 			button.mouseChildren = false;
			var g:Graphics = button.graphics;
			g.beginFill(btnColor);
			g.drawRoundRect(0,0,btnW,30,10);

			button.addChild(_buttonTxt);
			addChild(button);
		}
		
		public function getName(){
			return _btnName;
		}
		
		public function getTextValue(){
			return _buttonTxt.text;
		}
		
		public function setText(newName:String){
			_buttonTxt.text = newName;
			_buttonTxt.autoSize = TextFieldAutoSize.CENTER;
		}
	}
}