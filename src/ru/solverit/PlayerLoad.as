package ru.solverit 
{
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.events.LoaderEvent;
	import away3d.loaders.Loader3D;
	import away3d.loaders.parsers.Parsers;
	
	import flash.events.Event;
	import flash.net.URLRequest;
	
	
	/**
	 * ...
	 * @author Solverit
	 */
	public class PlayerLoad
	{
		// 3D
		private var view:View3D;
		
		private var main: Main;
		
		// loader
		private var loader:Loader3D;
		
		public function PlayerLoad( view_:View3D, main_: Main ) 
		{
			main = main_;
			
			// получаем ссылку на сцену
			view = view_;
			
			// указываем, что хотим грузить любой формат
			Parsers.enableAllBundled();
			
			loader = new Loader3D();
			loader.addEventListener(LoaderEvent.RESOURCE_COMPLETE, onResourceComplete);
			
			// указываем что грузим
			loader.load(new URLRequest("model.3ds")); 
		}
		
		private function onResourceComplete(e:Event):void 
		{
			// получаем нашу загруженную модель
			//player = ObjectContainer3D(e.target);
			
			// добавляем модель на сцену
			//view.scene.addChild( main.player );			
		}
		
	}

}