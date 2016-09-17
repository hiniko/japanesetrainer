//General Preloader
package {
	
    import flash.display.*;
    import flash.events.*;
	import flash.text.*;
    import flash.net.URLRequest;
	import caurina.transitions.*;

    public class preloader extends MovieClip {
       
       private var _myLoader:Loader = new Loader();
	   private var _loadBar:MovieClip;
	   private var _text:TextField;
	   	private var _percentOld:Number;

        public function preloader() {
            var _myRequest:URLRequest = new URLRequest("japlesson.swf");
            _myLoader.contentLoaderInfo.addEventListener(Event.OPEN, showLoader);
            _myLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, showProgress);
            _myLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, showLesson);
            _myLoader.load(_myRequest);

        }
		
        public function showLoader(evt:Event){
			//Make loader bar
			_loadBar = new MovieClip();
			var g:Graphics = _loadBar.graphics;
			g.beginFill(0x000000);
			g.drawRoundRect(0,0,600,15,10);
            _loadBar.x = (stage.stageWidth / 2) - 300;
            _loadBar.y = (stage.stageHeight /2) - 50;
            _loadBar.width = 1;
            addChild(_loadBar);
			
			//Make text
			//Make button title format
			var txtFormat = new TextFormat();
			txtFormat.size = 20;
			txtFormat.bold = true;
			txtFormat.align = TextFormatAlign.CENTER;
			txtFormat.font = 'Arial';
			txtFormat.color = 0x000000;

			// Make the button title
			_text = new TextField();
			_text.embedFonts = true;
           	_text.antiAliasType = 'advanced';
			_text.selectable = false;
			_text.autoSize = TextFieldAutoSize.LEFT;
			_text.defaultTextFormat = txtFormat;
			_text.text = '0%';
			_text.x = (stage.stageWidth / 2) - (_text.width/2);
			_text.y = (stage.stageHeight /2);
			addChild(_text);

        }
	
        function showProgress(evt:ProgressEvent) {
			var loading = evt.bytesLoaded;
			var total = evt.bytesTotal;
			var percentNew = Math.round(((loading/total) * 100)); 
			var newWidth = (600/100)*percentNew ;
			Tweener.addTween(_loadBar,{width:newWidth, time:.5, transition:"easeOutQuint"});
			
			_text.text = percentNew + '%';
          }
		  
        function showLesson(evt:Event) {
            removeChild(_loadBar);
			removeChild(_text);
			trace('finished loading');
           	addChild(_myLoader);
        }
		
    }
}