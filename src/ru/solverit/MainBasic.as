package ru.solverit
{
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.View3D;
	import away3d.core.base.Object3D;
	import away3d.debug.AwayStats;
	import away3d.entities.Mesh;
	import away3d.lights.PointLight;
	import away3d.materials.BitmapMaterial;
	import away3d.primitives.Cube;
	
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author Solverit
	 */
	[Frame(factoryClass="ru.solverit.Preloader")]
	public class Main extends Sprite 
	{
		// Это наша сцена
		private var view : View3D;
		
		// Это солнце
		public  var light: PointLight;
		
		// Это игрок
		public  var player: ObjectContainer3D;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			// Создадим сцену
			view = new View3D();
			view.camera.y 		 	=  140;
			view.camera.z 		 	= -120;
			view.camera.rotationX 	=  50;
			addChild(view);
			
			// статистика 
			addChild(new AwayStats(view)); 	
			
			// Добавим игрока на сцену
			addPlayer();
			
			stage.addEventListener( Event.ENTER_FRAME, onEnterFrame );
		}
		
		public function addPlayer():void 
		{
			// создадим игрока
			player = new ObjectContainer3D();
			
			// сделаем прикольную текстурку для него
			var bitmapData: BitmapData = new BitmapData(512, 512, false, 0x000000);
			bitmapData.perlinNoise(64, 64, 5, 0, false, true, BitmapDataChannel.RED);
			
			// присвоим текстуру материалу
			var material: BitmapMaterial = new BitmapMaterial(bitmapData);
			
			// создадим геометрическую форму игроку
			var mesh:Mesh = new Cube(material, 50, 50, 50);
			player.addChild(mesh);
			
			view.scene.addChild(player);
		}
		
		public function onEnterFrame( e:Event ):void 
		{
			player.rotationX += .11;
			player.rotationY += .15;
			player.rotationZ += .19;
			
			view.render();
		}
		
	}

}