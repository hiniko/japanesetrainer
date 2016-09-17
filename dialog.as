package{
	
	
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import caurina.transitions.*;
	
	public class dialog extends MovieClip{
		
		
		public function dialog(dText:String,btn1:String,btn2:String){
			var bkWash:Sprite = new Sprite();
			var g:Graphics = bkWash.graphics;
			g.beginFill(0x000000,.1);
			g.drawRect(0,0,700,500);
			addChild(bkWash);
			
			//draw the dialog
			var dialog:MovieClip = new MovieClip();
			var g:Graphics = dialog.graphics;
			g.beginFill(0x6E6E6E,.95);
			g.drawRoundRect(0,0,400,100,20);
			// the text
			
			//Make button title format
			var txtFormat = new TextFormat();
			txtFormat.size = 20;
			txtFormat.bold = true;
			txtFormat.align = TextFormatAlign.CENTER;
			txtFormat.font = 'MS PGothic';
			txtFormat.color = 0xFFFFFF;

			// Make the button title
			var dBoxTxt:TextField = new TextField();
			dBoxTxt.embedFonts = true;
            dBoxTxt.antiAliasType = 'advanced';
			dBoxTxt.selectable = false;
			dBoxTxt.autoSize = TextFieldAutoSize.LEFT;
			dBoxTxt.defaultTextFormat = txtFormat;
			dBoxTxt.text = dText;
			dBoxTxt.x = (dialog.width/2)-(dBoxTxt.width / 2);
			dBoxTxt.y = 10;
			dialog.addChild(dBoxTxt);
			
			//make buttons
			var yesBtn = new tabButton(btn1,0xFF5721);
			yesBtn.x = dialog.width-yesBtn.width;
			yesBtn.y = dialog.height-yesBtn.height;
			dialog.addChild(yesBtn);
			yesBtn.addEventListener(MouseEvent.CLICK,function(){dispatchEvent(new Event("yesBtnPressed", true, false));})
			
			//make buttons
			var noBtn = new tabButton(btn2,0xFF5721);
			noBtn.x = 0;
			noBtn.y = dialog.height-noBtn.height;
			noBtn.addEventListener(MouseEvent.CLICK,function(){dispatchEvent(new Event("noBtnPressed", true, false));})
			
			dialog.addChild(noBtn);
			
			addChild(dialog);
			dialog.x = (700/2)-(dialog.width/2);
			dialog.y = (500/2)-(dialog.height/2);
		}
		
	}
	
	
}