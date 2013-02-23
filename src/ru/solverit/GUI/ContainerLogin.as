package ru.solverit.GUI 
{
import alternativa.gui.base.GUIobject;
	import alternativa.gui.container.linear.VBox;
	import alternativa.gui.container.tabPanel.TabData;
	import alternativa.gui.enum.Align;
	import alternativa.gui.layout.IStageSizeListener;
	import alternativa.gui.lod.ResizeableBitmap;
	import alternativa.gui.theme.defaulttheme.container.list.List;
	import alternativa.gui.theme.defaulttheme.container.panel.Panel;
	import alternativa.gui.theme.defaulttheme.container.tabPanel.TabButton;
	import alternativa.gui.theme.defaulttheme.container.tabPanel.TabPanel;
	import alternativa.gui.theme.defaulttheme.controls.buttons.Button;
	import alternativa.gui.theme.defaulttheme.controls.text.TextInput;
	import alternativa.gui.theme.defaulttheme.controls.text.Label;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import ru.solverit.Main;
	import ru.solverit.Connection;
	
	/**
	 * ...
	 * @author Solverit
	 */
	public class ContainerLogin extends GUIobject implements IStageSizeListener
	{
		private var main: Main;
		
		private var padding:int = 5;
		
		private var textLogin:	 TextInput;
		private var buttonLogin: Button;
		
		// -----
		public function ContainerLogin( main_: Main ) 
		{
			main = main_;
			
			textLogin = new TextInput();
			textLogin.labelText = "Player:";
			textLogin.labelMargin = 5;
			textLogin.width = 150;
			addChild( textLogin );
			
			buttonLogin = new Button();
			buttonLogin.label  = "Login";
			buttonLogin.height = 40;
			buttonLogin.width  = 150;
			buttonLogin.addEventListener( MouseEvent.CLICK, button_clickHandler );
			addChild( buttonLogin );
		}
		
		override protected function draw():void 
		{
			super.draw();
			
			if ( buttonLogin != null ) 
			{
				textLogin.y = height / 2 - 60;
				textLogin.x = width / 2;
				
				buttonLogin.y = height / 2;
				buttonLogin.x = width / 2;
			}
		}
		
		private function button_clickHandler( event:MouseEvent ):void 
		{
			var conn: Connection = new Connection();
			conn.connect( textLogin.text );
			
			main.goGame();
			
			//NetHelper.main = main;
		}
	}


}