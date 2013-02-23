
package ru.solverit.events
{
	import flash.events.Event;
	import flash.utils.ByteArray;

	/**
	 * ...
	 * @author Solverit
	 */
	public class DataEvent extends Event
	{
		public static const DATA_RECEIVED:String = "data_received";
		
		private var _data:ByteArray;
		
		public function DataEvent()
		{
			super( DATA_RECEIVED );
		}
		
		public function get data():ByteArray
		{
			return _data;
		}
		
		public function set data( value:ByteArray ):void
		{
			_data = value;
		}
	}
}
