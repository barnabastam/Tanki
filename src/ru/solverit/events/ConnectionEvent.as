package ru.solverit.events
{
	import flash.events.Event;

	public class ConnectionEvent extends Event
	{
		public static const CONNECTION_ESTABLISHED: String = "connectionEstablished";

		public static const CONNECTION_CLOSED:		String = "connectionClosed";

		public static const CONNECTION_FAILED:		String = "connectionFailed";

		public function ConnectionEvent( type:String )
		{
			super(type);
		}

	}
}
