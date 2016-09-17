//charater.as
//The file that handles all japchars and their romanji counterparts

package{
	import flash.display.Sprite;
	
	public class Charater extends Sprite{
		
		private var _romanji:String;
		private var _charater:String;
		private var _group:String;
		
		
		public function Charater(romanji:String, charater:String, group:String){
			_romanji = romanji;
			_charater = charater;
			_group = group;
		}
		
		public function getRomanji():String{
			return _romanji;
		
		}
		public function getChar():String{
			return _charater;
		
		}
		
		public function getCharGroup():String{
			return _group;
		}
		
	}
}