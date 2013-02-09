package ru.solverit.GUI 
{
	import alternativa.gui.base.GUIobject;
	import alternativa.gui.container.linear.VBox;
	import alternativa.gui.container.tabPanel.TabData;
	import alternativa.gui.enum.Align;
	import alternativa.gui.layout.IStageSizeListener;
	import alternativa.gui.theme.defaulttheme.container.list.List;
	import alternativa.gui.theme.defaulttheme.container.panel.Panel;
	import alternativa.gui.theme.defaulttheme.container.tabPanel.TabButton;
	import alternativa.gui.theme.defaulttheme.container.tabPanel.TabPanel;
	import alternativa.gui.theme.defaulttheme.controls.buttons.Button;
	import alternativa.gui.theme.defaulttheme.controls.text.Label;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import ru.solverit.Main;
	
	/**
	 * ...
	 * @author Solverit
	 */
	public class ContainerGame extends GUIobject implements IStageSizeListener
	{
		private var main: Main;
		
		private var padding:int = 5;
		
		
		public function ContainerGame( main_: Main ) 
		{
			main = main_;
			
			addChild( main.startGame() );
			
		}
		
	}

}