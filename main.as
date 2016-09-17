// Main.as
// Laucher file for japanese lesson program

package{
	
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
    import flash.net.URLRequest;
	import flash.utils.*;
	import caurina.transitions.*;
	
	import flash.events.MouseEvent;
	
	public class main extends MovieClip{
		
		private var _loadedItems:Array;
		private var _charTables;
		private var _charTest
		private var wash;
		
		public function main(){
			intro();
		}
		
		
		private function intro(){
			
			var logo:nihongoLogo = new nihongoLogo();
			logo.x = 90;
			logo.y = 20
			addChild(logo);				
			//Add the menu buttons
			var hTest = new textButton('~ Start Hiragana Test  ~', 5, 'hTest');
			hTest.x = 280;
			hTest.y = 310;
			hTest.addEventListener(MouseEvent.ROLL_OVER, hTest.over);
			hTest.addEventListener(MouseEvent.ROLL_OUT, hTest.out);
			hTest.addEventListener(MouseEvent.CLICK, stageFade);
			addChild(hTest);

			var cTable = new textButton('~ View Charater Tables ~',5 ,'cTable');
			cTable.x = 280;
			cTable.y = 350;
			cTable.addEventListener(MouseEvent.ROLL_OVER, cTable.over);
			cTable.addEventListener(MouseEvent.ROLL_OUT, cTable.out);
			cTable.addEventListener(MouseEvent.CLICK, stageFade);

			addChild(cTable);	

			var info = new textButton('~ About ~',5, 'info');
			info.x = 280;
			info.y = 390;
			info.addEventListener(MouseEvent.ROLL_OVER, info.over);
			info.addEventListener(MouseEvent.ROLL_OUT, info.out);
			info.addEventListener(MouseEvent.CLICK, stageFade);

			addChild(info);
		}
		
		public function stageFade(evt:MouseEvent){
			wash = new MovieClip();
			var gr:Graphics = wash.graphics;
			gr.beginFill(0xFFFFFF);
			gr.drawRect(0,0,700,500);
			gr.endFill();
			//gr.clear();
			
			addChild(wash);
			wash.alpha = 0;
			Tweener.addTween(wash,{alpha:100, time:50, transition:"linear", 
							 onComplete:getModule(evt.currentTarget.getName())});
		}
		
		
		private function getModule(btnPressed:String){
			switch(btnPressed){
				case 'hTest': trace('Getting Hiragana Test'); 
					_charTest = new lessonSetup();
					addChild(_charTest);
					_charTest.y = -500;
					Tweener.addTween(_charTest,{y:0, time:1.5, transition:"easeOutQuint"});
					this.addEventListener("backFromTest",showMenuFromTest);
				
				
				break;
				
				case 'cTable': trace('Making Charater Table');
					_charTables = new tableViewer();
					_charTables.x = 710;
					_charTables.y = 0;
					addChild(_charTables);					
					this.addEventListener("backFromTable",showMenuFromTable);
					Tweener.addTween(_charTables,{x:0, time:1.5, transition:"easeOutQuint"});
					
				break;
				
				case 'info': trace('Getting info msg'); break;
				
			}
			
		}
		
		private function showMenuFromTable(evt:Event){
			Tweener.addTween(wash,{alpha:0, time:1, transition:"linear",onComplete:function(){removeChild(wash);}});
			Tweener.addTween(_charTables,{alpha:0, time:1, transition:"easeOutQuint" });
			Tweener.addTween(_charTables,{x:-710, time:1.5, transition:"easeOutQuint", onComplete:function(){removeChild(_charTables);}});

		}
		
		private function showMenuFromTest(evt:Event){
			Tweener.addTween(_charTest,{alpha:0, time:1, transition:"easeOutQuint" });
			Tweener.addTween(_charTest,{y:500, time:1.5, transition:"easeOutQuint", onComplete:function(){removeChild(_charTest);}});
			Tweener.addTween(wash,{alpha:0, time:1, transition:"linear",onComplete:function(){removeChild(wash);}});
			

		}
	}
}