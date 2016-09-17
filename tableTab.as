//charater.as
//The file that handles all japchars and their romanji counterparts

package{
	import flash.display.*;
	import flash.text.*;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import caurina.transitions.*;
	
	public class tableTab extends MovieClip{	
		
		public function tableTab(charater:String,romanji:String){
			//this.height = 100;
			//this.width = 100;
			
			//make symbol text
			var charText:TextField = new TextField();
			var charFormat:TextFormat = new TextFormat();
			this.buttonMode = true; 
 			this.mouseChildren = false;

						
			//make the format for the  text fiend
			charFormat = new TextFormat();
			charFormat.size = 45;
			charFormat.bold = true;
			charFormat.align = TextFormatAlign.CENTER;
			charFormat.font = 'MS PGothic';
			
			
			
			//make the text field
			charText = new TextField();
			charText.embedFonts = true;
            charText.antiAliasType = 'advanced';
			charText.defaultTextFormat = charFormat;
			charText.selectable = false;
			charText.text = charater;
			charText.autoSize = TextFieldAutoSize.LEFT;
			charText.y = 0;
			charText.x = 0;			
			//add the button to the object 
			addChild(charText);
			//trace(charText.width + ' -- '  + charText.text);
			
			//make romanji text
			var romanjiText:TextField = new TextField();
			var romanjiFormat:TextFormat = new TextFormat();
			this.buttonMode = true; 
 			this.mouseChildren = false;

			//make the format for the  text fiend
			romanjiFormat = new TextFormat();
			romanjiFormat.size = 19;
			romanjiFormat.bold = true;
			romanjiFormat.align = TextFormatAlign.CENTER;
			romanjiFormat.font = 'Arial';
			
			//make the text field
			romanjiText = new TextField();
			romanjiText.defaultTextFormat = romanjiFormat;
			romanjiText.embedFonts = true;
            romanjiText.antiAliasType = 'advanced';
			romanjiText.selectable = false;
			romanjiText.text = romanji;
			//romanjiText.autoSize = TextFieldAutoSize.CENTER;
			romanjiText.width = charText.width;
			romanjiText.y = 45;
			romanjiText.x = 0;
			//add the button to the object 
			addChild(romanjiText);
			
			//Event Listeners for hover grow
			if(charater != '--'){
				this.addEventListener(MouseEvent.ROLL_OVER, over);
				this.addEventListener(MouseEvent.ROLL_OUT, out);
			}
		}
		
		private function over(evt:Event){
			Tweener.addTween(this,{scaleX:1.2,scaleY:1.2, time:.2, transition:"easeOutBounce"});
		}
		
		private function out(evt:Event){
			Tweener.addTween(this,{scaleX:1,scaleY:1, time:.2, transition:"easeOutBounce"});
		}
		
	}
}