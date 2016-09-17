package{
	
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import caurina.transitions.*;
	
	public class SelectButton extends MovieClip{
		
		private var _enabled:Boolean
		private var _buttonList:Array;
		private var _default:String;
		private var _defaultNo:Number;
		
		private var _btnFormat:TextFormat;
		private var _currentValue;
		
		private var _corona:MovieClip;
		private var _coronaX:Number;
		private var _coronaY:Number;
		private var _coronaW:Number;
		private var _coronaH:Number;
		
		
		public function SelectButton(buttonTitle:String, buttons:Array, defaultBtn:String, btnEnabled = true){
			
			
			_enabled = btnEnabled;
			
			_btnFormat = new TextFormat();
			_btnFormat.size = 20;
			_btnFormat.bold = true;
			_btnFormat.align = TextFormatAlign.CENTER;
			_btnFormat.font = 'Arial';
			_btnFormat.color = 0x003F87;
		
				
			_buttonList = buttons;
			_default = defaultBtn;
			
			//Make button title format
			var titleFormat = new TextFormat();
			titleFormat.size = 20;
			titleFormat.bold = true;
			titleFormat.align = TextFormatAlign.CENTER;
			titleFormat.font = 'MS PGothic';
			titleFormat.color = 0x000000;

			// Make the button title
			var btnTitleTxt:TextField = new TextField();
			btnTitleTxt.embedFonts = true;
            btnTitleTxt.antiAliasType = 'advanced';
			btnTitleTxt.selectable = false;
			btnTitleTxt.autoSize = TextFieldAutoSize.CENTER;
			btnTitleTxt.defaultTextFormat = titleFormat;
			btnTitleTxt.text = buttonTitle;
			btnTitleTxt.x = 0;
			btnTitleTxt.y = 0;
			addChild(btnTitleTxt);
			
			if(checkDefaultBtn()){
				//trace("The buttonList contains the default selected name");
				makeButtons();
			}else{
				trace("The buttonList does not contain the default selected name");
				//return 9001; //ITS OVER 9000!!!
			}
		}
		
		private function makeButtons(){
			var posX = this.width +20; 
			for(var i = 0;i <_buttonList.length; i++){
				//create scroll buttons
				var select:MovieClip = new MovieClip();
				select.name = i;
				select.x = posX;
				select.y = 0;
				select.buttonMode = true; 
				select.mouseChildren = false;
				//var g:Graphics = select.graphics;
				//g.beginFill(0xFF0000);
				//g.drawRoundRect(0,0,80,30,10);
				addChild(select);
				
				var btnLabel = new TextField();
				btnLabel.embedFonts = true;
           	 	btnLabel.antiAliasType = 'advanced';
				btnLabel.defaultTextFormat = _btnFormat;
				btnLabel.selectable = false;
				btnLabel.text = _buttonList[i];
				btnLabel.autoSize = TextFieldAutoSize.LEFT;
				select.addChild(btnLabel);
				
				if ((select.width /.85)<30){
					posX += 30;
				}else{
					posX += (select.width /.85);
				}
				
				if(_defaultNo == i){
					_currentValue = _buttonList[_defaultNo];
					_coronaX = select.x;
					_coronaY = select.y;
					_coronaW = select.width;
					_coronaH = select.height;
				}
				
				select.addEventListener(MouseEvent.CLICK,selectAnother);
			}
			
			_corona = new MovieClip();
			var g:Graphics = _corona.graphics;
			g.beginFill(0x262626,0.2);
			g.drawRoundRect(0,0,_coronaW,_coronaH,10);	
			_corona.x = _coronaX;
			_corona.y = _coronaY;
			
			if(_enabled){
				addChild(_corona);
			}
		}
		
		private function selectAnother(evt:MouseEvent){
			//trace(evt.currentTarget.name +' has been clicked');
			var newX = evt.currentTarget.x;
			var newW =evt.currentTarget.width;
			_currentValue = _buttonList[evt.currentTarget.name];
			Tweener.addTween(_corona,{x:newX, width:newW, time:1, transition:"easeOutQuint" });
			//trace(posX);
			
		}
		
		private function checkDefaultBtn(){
			
			var defaultValid:Boolean = false
			
			var i = 0;
			for each(var item in _buttonList){
				if(item == _default){
					defaultValid = true;
					_defaultNo = i;
					break;
				}else{
					defaultValid = false;
					i++;
				}
			}
			
			return defaultValid;
		}
		
		public function enableThis(){
			addChild(_corona);
		}
		
		public function disableThis(){
			removeChild(_corona);
		}
		
		public function getCurrentValue(){
			return _currentValue;
		}
	}	
}