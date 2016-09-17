package{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import caurina.transitions.*;
	import flash.filters.*;
	
	
	
	class lessonOptions extends MovieClip{

		private var optScreen:MovieClip = new MovieClip();
		private var finalOptions:Array = new Array();
		
		private var optTextFormat:TextFormat = new TextFormat();
		private var btnTextFormat:TextFormat = new TextFormat();
		private var btnTextFormatW:TextFormat = new TextFormat();
		
		//Options dialog
		private var dialogOpen = false;
		//option vars
		private var diffSelection;
		private var questionTime;
		private var charatersPer;
		private var sectionTest
		private var randomRows;
		private var dakuten;
		private var handakuten;
		private var yoonTest;
		private var numOfQuestions;
		private var note;
		
		
		public function lessonOptions(){
			//set text styles
			btnTextFormat.size = 20;
			btnTextFormat.bold = true;
			btnTextFormat.align = TextFormatAlign.CENTER;
			btnTextFormat.font = 'Arial';
			btnTextFormat.color = 0x000000;
			
			btnTextFormatW.size = 20;
			btnTextFormatW.bold = true;
			btnTextFormatW.align = TextFormatAlign.CENTER;
			btnTextFormatW.font = 'Arial';
			btnTextFormatW.color = 0xFFFFFF;
			
			optTextFormat.size = 20;
			optTextFormat.bold = true;
			optTextFormat.align = TextFormatAlign.CENTER;
			optTextFormat.font = 'MS PGothic';
			optTextFormat.color = 0xFFFFFF;


			makeOptionScreen();
			
		}
		
		private function makeOptionScreen(){
			
			var g:Graphics = optScreen.graphics;
			g.beginFill(0xDEDEDE,.8);
			g.drawRoundRect(0,0,600,400,20);
			optScreen.x = 50
			optScreen.y = 50;
			addChild(optScreen);
			
			// add control buttons
			//Start Test button
			var startTestBtn = new tabButton('Start Test');
			startTestBtn.x = 600 - startTestBtn.width;
			startTestBtn.y = 400 - startTestBtn.height;
			optScreen.addChild(startTestBtn);
			startTestBtn.addEventListener(MouseEvent.CLICK, startTestHandle);
			
			//Back to menu button
			var backBtn = new tabButton('Back');
			optScreen.addChild(backBtn);
			backBtn.addEventListener(MouseEvent.CLICK, backToMenu);
			
			//options title
			var optTitle:TextField = new TextField();
			optTitle.embedFonts = true;
            optTitle.antiAliasType = 'advanced';
			optTitle.defaultTextFormat = btnTextFormat;
			optTitle.selectable = false;
			optTitle.autoSize = TextFieldAutoSize.CENTER;
			optTitle.text = '[ Options ]';
			optTitle.x = (optScreen.width / 2)- (optTitle.width / 2);
			optScreen.addChild(optTitle);
			
			//Difficulty selection
			diffSelection = new SelectButton('Charater Set',['Hiragana','Katakana','Both'], 'Hiragana');
			diffSelection.x = 10;
			diffSelection.y = 50;
			optScreen.addChild(diffSelection);
			
			//Time per question
			questionTime = new SelectButton('Time per question (Seconds)',['2','3','5','10'], '5');
			questionTime.x = 10;
			questionTime.y = 80;
			questionTime.disableThis();
			optScreen.addChild(questionTime);
			
			charatersPer = new SelectButton('Charaters per question',['1','2','3','4',], '1');
			charatersPer.x = 10;
			charatersPer.y = 110;
			charatersPer.disableThis();
			optScreen.addChild(charatersPer);
			
			//section tester
			sectionTest = new SelectButton('Test one row at a time?',['Yes','No'], 'No');
			sectionTest.x = 10;
			sectionTest.y = 140;
			sectionTest.disableThis()
			//sectionTest.addEventListener(MouseEvent.CLICK,checkRandomRows)
			optScreen.addChild(sectionTest);
			
			//section tester
			randomRows = new SelectButton('Random or chosen rows',['Random','Chosen'], 'Random',false);
			randomRows.x = 10;
			randomRows.y = 170;
			optScreen.addChild(randomRows);
			
			//dakuten and handakuten
			dakuten = new SelectButton('Include Dakuten rows (゛)',['Yes','No'], 'Yes');
			dakuten.x = 10;
			dakuten.y = 200;
			optScreen.addChild(dakuten);
			
			//dakuten and handakuten
			handakuten = new SelectButton('Include Handakuten rows (゜)',['Yes','No'], 'Yes');
			handakuten.x = 10;
			handakuten.y = 230;
			optScreen.addChild(handakuten);
			
			
			//include yoon?
			yoonTest = new SelectButton('Include yōon (ぎゃ)',['Yes','No'], 'Yes');
			yoonTest.x = 10;
			yoonTest.y = 260;
			optScreen.addChild(yoonTest);
			
			numOfQuestions = new SelectButton('Number of questions',['10','15','20','30','40','All'], '15');
			numOfQuestions.x = 10;
			numOfQuestions.y = 290;
			optScreen.addChild(numOfQuestions);
			
			//Nte text
			var note:TextField = new TextField();
			note.embedFonts = true;
            note.antiAliasType = 'advanced';
			note.defaultTextFormat = btnTextFormat;
			note.selectable = false;
			note.autoSize = TextFieldAutoSize.CENTER;
			note.text = 'Any Option that is not active has not been made yet!';
			note.x = (optScreen.width / 2)- (note.width / 2);
			note.y = 330;
			optScreen.addChild(note);
		}
		
		private function checkRandomRows(evt:MouseEvent){
			var curV = sectionTest.getCurrentValue();
			switch(curV){
				case 'Yes':
					randomRows.enableThis();
				break
				case 'No':
					randomRows.disableThis();
				break;
			}
		}
		
		private function backToMenu(evt:MouseEvent){
			dispatchEvent(new Event("backFromTest", true, false));
		}
		
		private function startTestHandle(evt:MouseEvent){			
			compileOptions();
			closeOptions();
		}
		
		private function compileOptions(){
			finalOptions = [];
			finalOptions.push(diffSelection.getCurrentValue());
			finalOptions.push(questionTime.getCurrentValue());
		 	finalOptions.push(charatersPer.getCurrentValue());
			finalOptions.push(sectionTest.getCurrentValue())
		 	finalOptions.push(randomRows.getCurrentValue());
		 	finalOptions.push(dakuten.getCurrentValue());
		 	finalOptions.push(handakuten.getCurrentValue());
		 	finalOptions.push(yoonTest.getCurrentValue());
			finalOptions.push(numOfQuestions.getCurrentValue());
		}
		
		public function getOptions(){
			return finalOptions;
		}
		
		public function closeOptions(){
			if(!dialogOpen){
				//Lock start test button - may not be needed here for saftey
				
				dialogOpen = true;
				//add filter
				var blur:BlurFilter = new BlurFilter()
  				blur.blurX = 0;
   				blur.blurY = 0;
   				blur.quality = BitmapFilterQuality.HIGH;
   				optScreen.filters = [blur];
				
				Tweener.addTween(blur,{blurX:5,blurY:5,time:1,onUpdate:function(){optScreen.filters = [blur]}});
				//make actual dialog
				var closeDialog = new dialog('Start test with these options?','Start Test','Revise Options');
				addChild(closeDialog);
				closeDialog.alpha = 0;
				Tweener.addTween(closeDialog,{alpha:1, time:.5});
				//event listeners for buttons
				closeDialog.addEventListener("yesBtnPressed",function(){dispatchEvent(new Event("startTest", true, false));});
				closeDialog.addEventListener("noBtnPressed",function(){
																	  Tweener.addTween(blur,{blurX:0,blurY:0,time:1,onUpdate:function(){optScreen.filters = [blur]}});
																	  Tweener.addTween(closeDialog,{alpha:0, time:2});
																	  removeChild(closeDialog);
																	  dialogOpen = false;
																	  });
			}
		
		}
		
	}	
	
}