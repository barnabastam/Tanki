package ru.solverit
{
	import alternativa.gui.layout.LayoutManager;
	import alternativa.gui.mouse.CursorManager;
	import alternativa.gui.mouse.MouseManager;
	import alternativa.gui.theme.defaulttheme.init.DefaultTheme;
	import alternativa.gui.theme.defaulttheme.primitives.base.Hint;
	import alternativa.gui.theme.defaulttheme.skin.Cursors;
	import alternativa.init.GUI;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;

	import ru.solverit.GUI.ContainerLogin;
	import ru.solverit.GUI.ContainerGame;
	
	/**
	 * ...
	 * @author Solverit
	 */
	[Frame(factoryClass="ru.solverit.Preloader")]
	public class Main extends Sprite 
	{
		// -----
		private var objectContainer: Sprite;
		private var hintContainer:	 Sprite;
		
		
		// -----
		private var containerLogin: ContainerLogin;
		private var containerGame:  ContainerGame;
		
		// -----
		private var game: Game;
		
		// -----
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// entry point
			
			//Контейнер с объектами
			objectContainer = new Sprite();
			objectContainer.mouseEnabled = false;
			objectContainer.tabEnabled 	 = false;
			addChild(objectContainer);
			
			 //Контейнер для хинта
			hintContainer = new Sprite();
			hintContainer.mouseEnabled = false;
			hintContainer.tabEnabled   = false;
			addChild(hintContainer);
			
			 //Инициализация AlternativaGUIDefaultTheme
			DefaultTheme.init();
			
			 //Инициализация AlternativaGUI
			GUI.init(stage, false);
			
			 //Инициализация LayoutManager 
			LayoutManager.init(stage, [objectContainer]);
			
			 //Добавляем класс хинта в MouseManager
			MouseManager.setHintImaging( hintContainer, new Hint() );
			
			 //Инициализация CursorManager. Передаем массив кастомных курсоров
			CursorManager.init(Cursors.createCursors());
			
			 //Создаем и добавляем контейнер с эелементами
			containerLogin = new ContainerLogin( this );
			objectContainer.addChild( containerLogin );
		}
		
		public function goGame():void 
		{
			objectContainer.removeChild( containerLogin );
			
			containerGame = new ContainerGame( this );
			objectContainer.addChild( containerGame );
		}
		
		public function startGame():Sprite 
		{
			game = new Game( stage );
			
			return game;
		}
	}

}