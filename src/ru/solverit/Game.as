package ru.solverit 
{
	import away3d.cameras.Camera3D;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.core.base.Object3D;
	import away3d.debug.AwayStats;
	import away3d.entities.Mesh;
	import away3d.lights.PointLight;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.CubeGeometry;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Solverit
	 */
	public class Game extends Sprite
	{
		// Это наша сцена
		public var stageG:  Stage;
		public var view: 	View3D;
		
		// Это солнце
		public  var light: PointLight;
		
		// Это игрок
		public  var player: ObjectContainer3D;
		
		public function Game( stage_:Stage ) 
		{
			stageG = stage_;
			
			// Создадим сцену
			view = new View3D();
			view.mouseEnabled  = true;
			view.mouseChildren = true;
			view.camera.y 		 	=  140;
			view.camera.z 		 	= -120;
			view.camera.rotationX 	=  50;
			addChild(view);
			
			// статистика 
			addChild(new AwayStats(view)); 	
			
			// Добавим игрока на сцену
			addPlayer();
			
			onResize();
			stageG.addEventListener( Event.RESIZE, onResize );
			stageG.addEventListener( Event.ENTER_FRAME, onEnterFrame );
		}
		
		public function addPlayer():void 
		{
			// создадим игрока
			//var load: PlayerLoad = new PlayerLoad( view, this );
		}
		
		public function onEnterFrame( e:Event ):void 
		{
			// добавляем модели вращение
			if ( player != null ) 
			{
				player.rotationX += .11;
				player.rotationY += .15;
				player.rotationZ += .19;	
			}
			
			view.render();
		}
		
		public function onResize(event:Event = null):void
		{
			view.width  = stageG.stageWidth;
			view.height = stageG.stageHeight;
		}
	}

}