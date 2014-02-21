package {
    import flash.display.Bitmap;
    import starling.display.Image;
    import starling.display.Quad;
    import starling.display.Sprite;
    import starling.events.Event;
    import starling.textures.Texture;

    public class MyGameMain extends Sprite {
        [Embed(source = "bg.png")]
		private static const MyBG:Class;
		private var _BGimage:Image;
		private var _BGimage2:Image;
		
        [Embed(source="STHOMAS.png")]
        private static const MyImage:Class;
        private var _Playerimage:Image;
		
		[Embed(source = "can.png")]
		private static const MyCan:Class;
        private var _Canimage:Image;
		
		[Embed(source="bottle.png")]
		private static const MyBottle:Class;
        private var _Bottleimage:Image;
		
		private var objectNum:int = 6;
		
		var canArray:Vector.<Image> = new Vector.<Image>();
		var bottleArray:Vector.<Image> = new Vector.<Image>();
        
        public function MyGameMain() {
            super();
            
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            addEventListener(Event.ENTER_FRAME, onEnterFrame);
        }
        
        private function onAddedToStage(e:Event):void {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            
            createAndShowImage();
        }
        
        private function createAndShowImage():void {  
			//background
			var myBGBitmap:Bitmap = new MyBG();
            _BGimage = Image.fromBitmap(myBGBitmap);
			addChild(_BGimage);
			
            _BGimage2 = Image.fromBitmap(myBGBitmap);
			_BGimage2.x = 860;
			addChild(_BGimage2);
		
            // Create bitmap instance and use it to create an image 
            var myBitmap:Bitmap = new MyImage();
            _Playerimage = Image.fromBitmap(myBitmap);
            
            // Change images origin to it's center
            // (Otherwise by default it's top left)
            _Playerimage.pivotX = _Playerimage.width / 2;
            _Playerimage.pivotY = _Playerimage.height / 2;
            // Where to place the image on screen
            _Playerimage.x = stage.stageWidth / 2;
            _Playerimage.y = stage.stageHeight / 2;
			
			//resizing
			_Playerimage.scaleX = .3;
			_Playerimage.scaleY = .3;
            
            // Add image to display in order to show it
            addChild(_Playerimage);
			
			addObject();
			
        }
		
		private function addObject() {
			//add objects
			for ( var i:int = 0; i < objectNum; i++) {
				//add can
				var myCanBitmap:Bitmap = new MyCan();
				_Canimage = Image.fromBitmap(myCanBitmap);
				addChild(_Canimage);
				_Canimage.pivotX = _Canimage.width / 2;
				_Canimage.pivotY = _Canimage.height / 2;
				_Canimage.y = Math.random() * 400;
				_Canimage.x = Math.random() * -2500 + Math.random() * -2500;
				canArray.push(_Canimage);
				
				//add bottle
				var myBottleBitmap:Bitmap = new MyBottle();
				_Bottleimage = Image.fromBitmap(myBottleBitmap);
				addChild(_Bottleimage);
				_Bottleimage.pivotX = _Bottleimage.width / 2;
				_Bottleimage.pivotY = _Bottleimage.height / 2;
				_Bottleimage.y = Math.random() * 400;
				_Bottleimage.x = Math.random() * -2500 + Math.random() * -2500;
				bottleArray.push(_Bottleimage);
			
			}
		}
        
        private function onEnterFrame(e:Event):void {
            // moves background
            _BGimage.x += -1;
			_BGimage2.x += -1;
			
			if (_BGimage.x == -860) {
				_BGimage.x = 860;
			}
			if (_BGimage2.x == -860) {
				_BGimage2.x = 860;
			}
			
			//move objects
			for ( var i:int = 0; i < canArray.length; i++) {
				canArray[i].x += 2;
				canArray[i].rotation += .05;
				
				bottleArray[i].x += 2;
				bottleArray[i].rotation += .1;
				
				//if they did their job, reset them
				if ( canArray[i].x == 860 ) {
					canArray[i].y = Math.random() * 400;
					canArray[i].x = Math.random() * -2500 + Math.random() * -2500;
				}
				if ( bottleArray[i].x == 860 ) {
					bottleArray[i].y = Math.random() * 400;
					bottleArray[i].x = Math.random() * -2500 + Math.random() * -2500;
				}
			}
			
        }
    }
}
