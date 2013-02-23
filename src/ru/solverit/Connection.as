package ru.solverit 
{
	import flash.display.Sprite;
	import flash.net.Socket;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	
	import ru.solverit.events.ConnectionEvent;
	import ru.solverit.events.DataEvent;
	
	/**
	 * ...
	 * @author Solverit
	 */
	public class Connection extends EventDispatcher
	{
		public  var socket:Socket = new Socket();
		private var waitingForHeader: Boolean = true;
		private var bytesNeeded:	  int;
		private var failed:		  	  Boolean = false;
		private var connected:		  Boolean = false;
		
		public var host:String	 = "127.0.0.1";
		public var port:int		 = 8888;
		
		
		// -----
		public function Connection() 
		{
			socket.addEventListener( Event.CONNECT, 					onConnect );
			socket.addEventListener( Event.CLOSE, 						onClose );
			socket.addEventListener( ProgressEvent.SOCKET_DATA, 		onSocketData );
			socket.addEventListener( IOErrorEvent.IO_ERROR, 			onIOErrorEvent );
			socket.addEventListener( IOErrorEvent.NETWORK_ERROR,   	 	onIOErrorEvent );
		}
		
		public function init():void
		{

		}
		
		private function connectionFailed():void
		{
			if (!failed)
			{
				failed = true;
				dispatchEvent( new ConnectionEvent( ConnectionEvent.CONNECTION_FAILED ) );
			}
		}
		
		//Ошибка при подключении
		private function onIOErrorEvent(e:IOErrorEvent):void 
		{
			connectionFailed();
		}
		
		private function onClose(e:Event = null):void
		{
			connected = false;
			dispatchEvent( new ConnectionEvent( ConnectionEvent.CONNECTION_CLOSED ) );
		}
		
		//Подключение серверу
		private function onConnect(e:Event):void 
		{
			connected = true;
			dispatchEvent( new ConnectionEvent(ConnectionEvent.CONNECTION_ESTABLISHED ) );
		}
		
		//Пришли данные от сервера
		private function onSocketData(e:DataEvent):void 
		{
			// Здесь будем обрабатывать команды
			try
			{
				readData();
			}
			catch (ioe:IOError)
			{
				onClose();
			}
		}
		
		private function readData():void
		{
			if (!socket.connected)
			{
				return;
			}
			
			if (waitingForHeader)
			{
				if (socket.bytesAvailable >= 4)
				{
					bytesNeeded = socket.readInt();
					waitingForHeader = false;
				}
			}
			
			if (!waitingForHeader)
			{
				if (socket.bytesAvailable >= bytesNeeded)
				{
					var ba:ByteArray = new ByteArray();
					socket.readBytes(ba, 0, bytesNeeded);
					
					var de:DataEvent = new DataEvent();
					de.data = ba;
					
					waitingForHeader = true;
					
					dispatchEvent(de);
					
					readData();
				}
			}
		}
		
		//Подключаемся к серверу
		public function connect( login: String ):void 
		{
			socket.connect(host, port);
		}
		
		//Отправляем сообщение
		public function sendMessage(data:ByteArray):void 
		{
			socket.writeBytes(data);
			socket.flush();
		}
	}

}