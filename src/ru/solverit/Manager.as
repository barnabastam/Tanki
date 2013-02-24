package ru.solverit 
{
	import com.awar.ags.net.protocol.LoginRequest;
	import com.awar.ags.net.protocol.ProtocolMSG;
	import flash.utils.ByteArray;
	
	import ru.solverit.events.ConnectionEvent;
	import ru.solverit.events.DataEvent;
	
	/**
	 * ...
	 * @author Solverit
	 */
	public class Manager 
	{
		public static var main: Main;
		
		public static var conn: Connection = new Connection();
		
		public static function initNet():void
		{
			conn.addEventListener( DataEvent.DATA_RECEIVED, 			   onDataReceived, 			false, 0, true );
			conn.addEventListener( ConnectionEvent.CONNECTION_ESTABLISHED, onConnectionEstablished, false, 0, true );
			conn.addEventListener( ConnectionEvent.CONNECTION_CLOSED, 	   onConnectionClosed, 		false, 0, true );
			conn.addEventListener( ConnectionEvent.CONNECTION_FAILED,	   onConnectionFailed, 		false, 0, true );
		}
		
		private static function onConnectionEstablished(e:ConnectionEvent):void 
		{
			trace( "Connection est" );
			
			login( "TESTTESTTEST" );
		}
		
		private static function onConnectionFailed(e:ConnectionEvent):void 
		{
			trace( "Connection failed" );
		}
		
		private static function onConnectionClosed(e:ConnectionEvent):void 
		{
			trace( "Connection close" );
		}
		
		private static function onDataReceived(e:DataEvent):void 
		{
			trace( "data recive: " + e.data );
			
			var incomingData:ByteArray = e.data;
			
			main.goGame();
		}
		
		private static function login( login: String ):void 
		{
			trace( "Try to login" );
			
			var lr:LoginRequest = new LoginRequest();
			lr.login  = login;
			
			var msgg: ProtocolMSG = new ProtocolMSG();
			msgg.loginrequest = lr;
			
			var data: ByteArray = new ByteArray();
			
			msgg.writeTo( data );
			
			conn.sendMessage( data );
		}
		
	}

}