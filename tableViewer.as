package{
	
	import flash.display.*;
	import flash.text.*;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import caurina.transitions.*;
	
	class tableViewer extends MovieClip{
		
		private var charaters:MovieClip = new MovieClip();
		private var switchBtn:MovieClip = new MovieClip();
		private var moving:Boolean = false;
		private var distance = 250;
		private var showing = 1;
		
		
		public function tableViewer(){
			//create background
			var bP:backPic = new backPic();
			addChild(bP);
			
			//Text format for buttons
			var btnTextFormat:TextFormat = new TextFormat();
			btnTextFormat.size = 20;
			btnTextFormat.bold = true;
			btnTextFormat.align = TextFormatAlign.CENTER;
			btnTextFormat.font = 'MS PGothic';
			btnTextFormat.color = 0xFFFFFF;
			
			//create scroll buttons
			var scrollUp:MovieClip = new MovieClip();
			scrollUp.x = 625;
			scrollUp.y = -2;
			scrollUp.buttonMode = true; 
 			scrollUp.mouseChildren = false;
			var g:Graphics = scrollUp.graphics;
			g.beginFill(0xFF0000);
			g.drawRoundRect(0,0,80,30,10);
			
			
			//Back to menu button
			//create scroll buttons
			var back:MovieClip = new MovieClip();
			back.x = -2;
			back.y = -2;
			back.buttonMode = true; 
 			back.mouseChildren = false;
			var g:Graphics = back.graphics;
			g.beginFill(0xFF0000);
			g.drawRoundRect(0,0,80,30,10);
			
			//Back to menu button
			var backTxt = new TextField();
			backTxt.embedFonts = true;
            backTxt.antiAliasType = 'advanced';
			backTxt.defaultTextFormat = btnTextFormat;
			backTxt.selectable = false;
			backTxt.text = 'Back';
			backTxt.autoSize = TextFieldAutoSize.CENTER;
			backTxt.y = 2;
			backTxt.x = 0;
			backTxt.width =  back.width;
			back.addChild(backTxt);
			addChild(back);
			back.addEventListener(MouseEvent.CLICK, backToMenu);
			
			//make the text field for up
			var upText = new TextField();
			upText.embedFonts = true;
            upText.antiAliasType = 'advanced';
			upText.defaultTextFormat = btnTextFormat;
			upText.selectable = false;
			upText.text = 'Up';
			upText.autoSize = TextFieldAutoSize.CENTER;
			upText.y = 2;
			upText.x = 0;
			upText.width = scrollUp.width;
			scrollUp.addChild(upText);
			addChild(scrollUp);
			scrollUp.addEventListener(MouseEvent.CLICK,scrollCharsUp);
			
			//Scroll button Down
			var scrollDown:MovieClip = new MovieClip();
			scrollDown.buttonMode = true; 
 			scrollDown.mouseChildren = false;
			var g:Graphics = scrollDown.graphics;
			g.beginFill(0xFF0000);
			g.drawRoundRect(0,0,80,30,10);
			
			//Down Text
			var downText = new TextField();
			downText.embedFonts = true;
            downText.antiAliasType = 'advanced';
			downText.defaultTextFormat = btnTextFormat;
			downText.selectable = false;
			downText.text = 'Down';
			downText.autoSize = TextFieldAutoSize.CENTER;
			downText.y = 2;
			downText.x = 0;
			downText.width = scrollDown.width;
			scrollDown.addChild(downText);
			scrollDown.x = -2
			scrollDown.y = 472;
			addChild(scrollDown);
			scrollDown.addEventListener(MouseEvent.CLICK,scrollCharsDown);
			
			//Switch table
			switchBtn.buttonMode = true; 
 			switchBtn.mouseChildren = false;
			var g:Graphics = switchBtn.graphics;
			g.beginFill(0xFF0000);
			g.drawRoundRect(0,0,30,100,10);
			
			//Switch Text
			//Add switch to the charaters so it moves when cliekd
			var switchText:TextField = new TextField();
			switchText.embedFonts = true;
            switchText.antiAliasType = 'advanced';
			switchText.defaultTextFormat = btnTextFormat;
			switchText.selectable = false;
			switchText.text = 'Switch';
			switchText.autoSize = TextFieldAutoSize.CENTER;
			switchText.rotation = 90
			switchText.y = 35;
			switchText.x = 27;
			switchText.width = switchBtn.width;
			switchBtn.addChild(switchText);
			switchBtn.x = 675;
			switchBtn.y = 250 -(switchBtn.height /2);
			addChild(switchBtn);
			switchBtn.addEventListener(MouseEvent.CLICK,switchTable);
			
			//create table
			createHiragana(); 
			
		}
		
		
		private function backToMenu(evt:MouseEvent){			
			Tweener.addTween(charaters,{alpha:0, time:.5, transition:"easeOutQuint", 
							 onComplete:function(){dispatchEvent(new Event("backFromTable", true, false))}});
		}
		
		private function switchTable(evt:MouseEvent){
			if(showing == 1){
				Tweener.addTween(charaters,{x:-680, time:1, transition:"easeOutQuint" });
				Tweener.addTween(switchBtn,{x:-5, time:1, transition:"easeOutQuint" });
				showing = 2;
			}else{
				Tweener.addTween(charaters,{x:0, time:1, transition:"easeOutQuint" });
				Tweener.addTween(switchBtn,{x:675, time:1, transition:"easeOutQuint" });
				showing = 1;
			}
			
		}
		
		private function scrollCharsDown(evt:MouseEvent){
				var newY = charaters.y - distance;
				var negCharHeight = (-charaters.height+ 320)
				if(newY < negCharHeight){
					newY = negCharHeight;
				}
				Tweener.addTween(charaters,{y:newY, time:.8, transition:"easeOutQuint" });
		}
		
		private function scrollCharsUp(evt:MouseEvent){
				var newY = charaters.y + distance;
				if(newY > 0){
					newY = 0;
				}				
				Tweener.addTween(charaters,{y:newY, time:.8, transition:"easeOutQuint" });
		}
		
		public function createHiragana(){ 
		
			var hira:Hiragana = new Hiragana();
			var hiraXML = hira.getHiragana();
			
			var kata:Katakana = new Katakana();
			var kataXML = kata.getKatakana();
			
			//Create all sets
			createSet(hiraXML,35,80,'Hiragana');
			createSet(kataXML,305,80,'Katakana');
			charaters.alpha = 0;
			addChild(charaters);
			Tweener.addTween(charaters,{alpha:100, time:5, transition:"linear"});
			
		}
		
		private function createSet(charSet,xPos,yPos,charTitle){
			
			var lineX = xPos;//30
			var lineY = yPos;//80
			var remains:XMLList = charSet.group;
			var multi = .4;
			var gapCount = 0;
			
			var titleFormat:TextFormat = new TextFormat();
			titleFormat.size = 50;
			titleFormat.bold = true;
			titleFormat.align = TextFormatAlign.CENTER;
			titleFormat.font = 'MS PGothic';
			titleFormat.color = 0x000000;
			
			
			var titleText = new TextField();
			titleText.embedFonts = true;
            titleText.antiAliasType = 'advanced';
			titleText.defaultTextFormat = titleFormat;
			titleText.selectable = false;
			titleText.text = charTitle;
			titleText.autoSize = TextFieldAutoSize.CENTER;
			titleText.y = 10;
			titleText.x = xPos/multi;
			
			charaters.addChild(titleText);

			for(var i=0;i<remains.length();i++){
				var group = charSet.group[i];
				var symbol = group.symbol;
				for each(var char in symbol){
					var tab = new tableTab(char.@sign,char.@romanji);
					tab.x = lineX/multi;
					tab.y = lineY;
					charaters.addChild(tab);
					lineX += 50;
				}
				gapCount++;
				if(gapCount == 5){
					lineY += 95;
					gapCount = 0;
				}else{
					lineY += yPos;
				}
				
				lineX = xPos;
			}
			
		}
		
		private function scrollThis(evt:MouseEvent){
			if(evt.stageY <25){
				charaters.y -= 10
				
			}else if(evt.stageY >475){
				charaters.y += 10
			}
			
		}
		
	}
}