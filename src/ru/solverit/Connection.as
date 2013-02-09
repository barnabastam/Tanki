package ru.solverit 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.Socket;
	import flash.events.DataEvent;
	import flash.events.IOErrorEvent;
	
	/**
	 * ...
	 * @author Solverit
	 */
	public class Connection 
	{
		public var socket:Socket = new Socket();
		
		public var host:String	 = "127.0.0.1";
		public var port:int		 = 8888;
		
		public var playerName:String = "Player";
		public var player_id:String	 = "1";		
		
		
		
		// -----
		public function Connection() 
		{
			socket.addEventListener(Event.CONNECT, socketConnectHandler);
			socket.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			socket.addEventListener(DataEvent.DATA, dataHandler);	
		}
		
		//Подключение серверу
		private function socketConnectHandler(e:Event):void 
		{
			status.text = "Player - connectrd";
		}
		
		//Ошибка при подключении
		private function ioErrorHandler(e:IOErrorEvent):void 
		{
			status.text = "Player - error";
		}
		
		//Пришли данные от сервера
		private function dataHandler(e:DataEvent):void 
		{
			var data:String = e.data;
			
			switch (data) 
			{
				// Здесь будем обрабатывать команды
			}
		}
		
		//Подключаемся к серверу
		public function connect():void 
		{
			socket.connect(host, port);
		}
		
		//Отправляем сообщение
		public function sendMessage(val:String):void 
		{
			if (val != "" && socket.connected)
			{
				//socket.writeBytes( val);
			}
		}
		
		public function exitGame():void 
		{
			if (socket.connected) 
			{
				socket.close();
			}
		}	
	}

}