package{
	import flash.display.MovieClip;
	
	public class charTable extends MovieClip{
		
		public function charTable(){
			var hiraDeck:charList = new charList('hiragana');
			var allChars = hiraDeck.getAllCards();
			
			//loop to output all of the array
				//var order:Array = {'Vowel','K','S','T','N','H','M','Y','R','W','G','Z','D','B','P'};
				for(var key in allChars){
					trace(key);
					
					for each(var item in allChars[key]){
						trace(item.getChar() + ' ---- ' + item.getRomanji());
					
					//trace('\n');
				}
				}
			
		}
		
	}	
}