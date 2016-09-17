package{
	
	import flash.display.*;
	import flash.text.*;
	import flash.events.*
	import caurina.transitions.*;
	import flash.filters.*;
	
	class randCharLesson extends MovieClip{
		
		//lesson area
		private var _lessonArea = new MovieClip();
		//Lesson Data
		private var _lessonXML:XML;
		private var _lessonAnsXML:XML;
	
		//lesson options
		private var _maxQuestions = 10;
		private var _maxAnswers = 3;
		
		//Lesson param
		private var _currQuestion = 0;// ths is incremented on the fist question run
		private var _postLessonXML:XML= <chars></chars>;
		private var _currAns;
		private var _currRightAns = 0;
		
		//Display elements
		private var _questionText;
		private var _lessonType;
		private var _questionNo;
		private var _timer;
		private var _correctAns;
		
		private var _textFormat;
		private var _textFormatMed;
		private var _textFormatSmall;
		private var _answerBtns = new Array();
		
		
		public function randCharLesson(lessonData:XML,numOfQuestions){
			_lessonXML = lessonData;
			_lessonAnsXML = lessonData;
			addChild(_lessonArea);
			_maxQuestions = numOfQuestions;
			
			//Run lesson functions
			createDisplayItems();
		}
		
		private function createDisplayItems(){
			
			//Tconfigure the text format
			_textFormat = new TextFormat();
			_textFormat.size = 150;
			_textFormat.bold = true;
			_textFormat.align = TextFormatAlign.CENTER;
			_textFormat.font = 'MS PGothic';
			_textFormat.color = 0x000000;
			
			//Tconfigure the text format
			_textFormatMed = new TextFormat();
			_textFormatMed.size = 50;
			_textFormatMed.bold = true;
			_textFormatMed.align = TextFormatAlign.CENTER;
			_textFormatMed.font = 'MS PGothic';
			_textFormatMed.color = 0x000000;
			
			//Tconfigure the text format
			_textFormatSmall = new TextFormat();
			_textFormatSmall.size = 15;
			_textFormatSmall.bold = true;
			_textFormatSmall.align = TextFormatAlign.CENTER;
			_textFormatSmall.font = 'MS PGothic';
			_textFormatSmall.color = 0x000000;
			
			//The quiz text field
			_questionText = new TextField();
			_questionText.embedFonts = true;
          	_questionText.antiAliasType = 'advanced';
			_questionText.defaultTextFormat = _textFormat;
			_questionText.selectable = false;
			_questionText.text = 'Null';
			_questionText.autoSize = TextFieldAutoSize.CENTER;
			
			//Add and position text
			_questionText.y = 150;
			_questionText.x = 350 - (_questionText.width /2 ) ;
			
			//The Lesson type
			_lessonType = new TextField();
			_lessonType.embedFonts = true;
          	_lessonType.antiAliasType = 'advanced';
			_lessonType.defaultTextFormat = _textFormatSmall;
			_lessonType.selectable = false;
			_lessonType.text = '[ Random Charater Lesson ]';
			_lessonType.autoSize = TextFieldAutoSize.LEFT;
			
			//Add and position text
			_lessonType.y = 0;
			_lessonType.x = 0;
			
			//The Question number
			_questionNo = new TextField();
			_questionNo.embedFonts = true;
          	_questionNo.antiAliasType = 'advanced';
			_questionNo.defaultTextFormat = _textFormatSmall;
			_questionNo.selectable = false;
			_questionNo.text = _currQuestion + ' / ' + _maxQuestions;
			_questionNo.autoSize = TextFieldAutoSize.LEFT;
			
			//Add and position text
			_questionNo.y = 0;
			_questionNo.x = 700 - _questionNo.width;
			
			//The Question number
			_correctAns = new TextField();
			_correctAns.embedFonts = true;
          	_correctAns.antiAliasType = 'advanced';
			_correctAns.defaultTextFormat = _textFormatMed;
			_correctAns.selectable = false;
			_correctAns.text = _currRightAns;
			_correctAns.autoSize = TextFieldAutoSize.LEFT;
			
			_correctAns.y = 500 - _correctAns.height;
			_correctAns.x = 350 - (_correctAns.width / 2);
			
			//The timer text
			_timer = new TextField();
			_timer.embedFonts = true;
          	_timer.antiAliasType = 'advanced';
			_timer.defaultTextFormat = _textFormatSmall;
			_timer.selectable = false;
			_timer.text = '5';
			_timer.autoSize = TextFieldAutoSize.LEFT;
			
			//Add and position text
			_timer.y = 0;
			_timer.x = 350 - (_timer.width/2);
			
			
			//Create all of the buttons
			var gapX = 70;
			for(var i=0;i<_maxAnswers;i++){
				_answerBtns[i] = new tabButton('Start Test',0x003F87,null,'Button'+i);
				_answerBtns[i].x = gapX;
				_answerBtns[i].y = 400;
				gapX += 225;
				_lessonArea.addChild(_answerBtns[i]);
				_answerBtns[i].addEventListener(MouseEvent.CLICK, answerClicked);
			}
			
			//add all emements to the screen
			_lessonArea.addChild(_questionText);
			_lessonArea.addChild(_lessonType);
			_lessonArea.addChild(_questionNo);
			_lessonArea.addChild(_timer);
			_lessonArea.addChild(_correctAns);
			
			//get thhe nextQuestion
			nextQuestion();
		}
		
		private function nextQuestion(){
			//Check if we have hit the question limit
			if(_currQuestion != _maxQuestions){
				//Increase the question number
				_currQuestion++;
				_questionNo.text = _currQuestion + '/' + _maxQuestions; //Question number
				
				//get a random group and its length
				var max = _lessonXML.group.length();
				var ranGroupNo = Math.floor(Math.random()*max);
				var ranGroup = _lessonXML.group[ranGroupNo];
				
				
				//Get random symbol node
				max = ranGroup.symbol.length();
				var ranCharNo = Math.floor(Math.random()*max);
				var ranChar = ranGroup.symbol[ranCharNo].@sign;
				
				//copy symbol to after lesson store
				_postLessonXML.appendChild(ranGroup.symbol[ranCharNo].copy());
				//trace('This is the char this question :: ' + ranGroup.symbol[ranCharNo].@romanji);
				
				//Update screen chars
				_questionText.text = ranChar
				
				//add random answers to the buttons
				for(var i=0;i<_maxAnswers;i++){
					//get a random group and its length
					var ansMax = _lessonAnsXML.group.length();
					var ansRanGroupNo = Math.floor(Math.random()*ansMax);
					var ansRanGroup = _lessonXML.group[ansRanGroupNo];
				
					//Get random symbol node
					ansMax = ansRanGroup.symbol.length();
					var ansRanCharNo = Math.floor(Math.random()*ansMax);
					var ansRanChar = ansRanGroup.symbol[ansRanCharNo].@romanji;
					
					_answerBtns[i].setText(ansRanChar);
					//trace('Random answer '+i+' is ' + ansRanChar);
				}
				
				//Add the real answer to one of to a random button
				var randBtn = Math.floor(Math.random()*_maxAnswers);
				_answerBtns[randBtn].setText(ranGroup.symbol[ranCharNo].@romanji);
				
				//set the Right answer for the answerclicked method
				_currAns = ranGroup.symbol[ranCharNo].@romanji;
				
				//delete used sybmol node
				delete _lessonXML.group[ranGroupNo].symbol[ranCharNo];
				// delete group if it is now empty
				if(_lessonXML.group[ranGroupNo].symbol.length()<1){
					delete _lessonXML.group[ranGroupNo];
				}
				
			}else{
				//Question limit hit end lesson
				endLesson();
			}
		}
		
		private function answerClicked(evt:MouseEvent){
			//check to see if this is the right answer button
			if(evt.currentTarget.getTextValue()==_currAns){
				_currRightAns++;
				_correctAns.text = _currRightAns;
				nextQuestion();
			}else{
				nextQuestion();
			}
		}

		private function endLesson(){
				var blur:BlurFilter = new BlurFilter()
  				blur.blurX = 0;
   				blur.blurY = 0;
   				blur.quality = BitmapFilterQuality.HIGH;
   				_lessonArea.filters = [blur];
				
				Tweener.addTween(blur,{blurX:5,blurY:5,time:1,onUpdate:function(){_lessonArea.filters = [blur]}});
				//make actual dialog
				var closeDialog = new dialog('Test Complete!! \n You got ' + _currRightAns + ' of ' + _maxQuestions + ' correct',
											 'Back To Options','Back to Menu');
				addChild(closeDialog);// added to main clip on piurpose
				closeDialog.alpha = 0;
				Tweener.addTween(closeDialog,{alpha:1, time:.5});
				//event listeners for buttons
				closeDialog.addEventListener("yesBtnPressed",function(){dispatchEvent(new Event("BackToOptions", true, false));});
				closeDialog.addEventListener("noBtnPressed",function(){   
																	  dispatchEvent(new Event("backFromTest", true, false));
																	  Tweener.addTween(closeDialog,{alpha:0, time:2,
																					   onComplete:function(){dispatchEvent(new Event("BackFromTest", true, false));}
																					   });

																	  });
			
		}
		
		
		
	}
}