package{
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	import caurina.transitions.*;
	import flash.utils.*;
	 
	class charLesson extends MovieClip{
		
		private var optScreen;
		
		//Lessons vars
		private var _charSet;
		private var _timeout;
		private var _noOfChars;
		private var _sections;
		private var _randomSections;
		private var _useDakuten;
		private var _useHandakuten;
		private var _useYoon;
		private var _charInclude;
		
		//Lesson resources
		private var _hiragana;
		private var _katakana;
		private var _testSet;
		private var _lessonXML;
		
		
		public function charLesson(){
			//Make Background
			var bP:backPic2 = new backPic2();
			//addChild(bP);
			
			optScreen = new lessonOptions();
			addChild(optScreen);
			this.addEventListener("startTest",closeOptions);
		}
		
		private function closeOptions(evt:Event){
			var userOptions = optScreen.getOptions();
			Tweener.addTween(optScreen,{alpha:0,time:1,onComplete:function(){removeChild(optScreen)}});
			setupLesson(userOptions);
			trace(userOptions);
		}
		
		private function setupLesson(options:Array){
			//asign options to class vars
			_charSet = options[0];
			_timeout= options[1];
			_noOfChars= options[2];
			_sections= options[3];
			_randomSections= options[4];
			_useDakuten= options[5];
			_useHandakuten= options[6];
			_useYoon= options[7];
			
			//init lesson objects
			_hiragana = new Hiragana();
			_hiragana = _hiragana.getHiragana();
			_katakana = new Katakana();
			_katakana = _katakana.getKatakana();
			
			//Array containing the sets to include from the xml files
			_charInclude = ['v','k','s','t','n','h','m','y','r','w','singles'];
			if(_useDakuten == 'Yes'){
				_charInclude.push('g','z','d','b');
			}
			if (_useHandakuten == 'Yes') {
				_charInclude.push('p');
			}
			if (_useYoon == 'Yes') {
				_charInclude.push('hy','sh','ch','ny','my','ry','gy','j','dy','by','py');
			}
			getTestChars();
			lessonCountDown();
		}
		
		private function getTestChars(){		
			//crete the xml set that is specifc to the lesson
			
				switch(_charSet){
					case 'Hiragana':
						getHiraGroups();
					break;
					
					case 'Katakana':
						getKataGroups();
					break;
					
					case 'Both':
						getHiraGroups();
						getKataGroups();
					break;
				}
				trace(_lessonXML);
			}
		
		private function getHiraGroups(){
			for(var i=0;i<_hiragana.group.length();i++){
				for each(var item in _charInclude){
					if(item == _hiragana.group[i].@name ){
					_lessonXML += _hiragana.group[i];
					}
				}
			}
		}
		
		private function getKataGroups(){
			for(var i=0;i<_katakana.group.length();i++){
				for each(var item in _charInclude){
					if(item == _katakana.group[i].@name ){
					_lessonXML += _katakana.group[i];
					}
				}
			}
		}
		
		private function lessonCountDown(){
			//count down text format
			var txtFormat = new TextFormat();
			txtFormat.size = 100;
			txtFormat.bold = true;
			txtFormat.align = TextFormatAlign.CENTER;
			txtFormat.font = 'Arial';
			txtFormat.color = 0x000000;
			//count doen text
			var countTxt:TextField = new TextField();
			countTxt.embedFonts = true;
            countTxt.antiAliasType = 'advanced';
			countTxt.defaultTextFormat = txtFormat;
			countTxt.selectable = false;
			countTxt.autoSize = TextFieldAutoSize.CENTER;
			countTxt.text = 'Ready?';
			countTxt.x = (this.width / 2)- (countTxt.width / 2);
			countTxt.y = (this.height / 2)- (countTxt.height / 2);

			addChild(countTxt);
			
			
			var count = 5
			var myTimer:Timer = new Timer(1000);
			myTimer.addEventListener("timer", 
				 function(){
					if(count > 1){
						count--;
						Tweener.addTween(countTxt,{scaleX:1,scaleY:1,time:.5,
										 onComplete:function(){
											Tweener.addTween(countTxt,{scaleX:0,scaleY:0,time:.5});  
										 }});
						countTxt.text = count;
					}else{
						Tweener.addTween(countTxt,{scaleX:1,scaleY:1,time:.5});
						Tweener.addTween(countTxt,{alpha:0,time:1.5,onComplete:function(){
																						 removeChild(countTxt);
																						 countTxt.text = 'GO!!';
																						 myTimer.stop();
																						 startLesson();
																						 }}); 
						
					}
					
					});
			//myTimer.start();
			startLesson();
			
			
		}
		
		
		
		private function startLesson(){
			var lesson = new ranCharLesson(_lessonXML);
			addChild(lesson);
			
		}
	}	
	
}