package com.awar.ags.net.protocol {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.awar.ags.net.protocol.LoginResponse;
	import com.awar.ags.net.protocol.LoginRequest;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ProtocolMSG extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LOGINREQUEST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.awar.ags.net.protocol.ProtocolMSG.loginrequest", "loginrequest", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, com.awar.ags.net.protocol.LoginRequest);

		private var loginrequest$field:com.awar.ags.net.protocol.LoginRequest;

		public function clearLoginrequest():void {
			loginrequest$field = null;
		}

		public function get hasLoginrequest():Boolean {
			return loginrequest$field != null;
		}

		public function set loginrequest(value:com.awar.ags.net.protocol.LoginRequest):void {
			loginrequest$field = value;
		}

		public function get loginrequest():com.awar.ags.net.protocol.LoginRequest {
			return loginrequest$field;
		}

		/**
		 *  @private
		 */
		public static const LOGINRESPONSE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.awar.ags.net.protocol.ProtocolMSG.loginresponse", "loginresponse", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, com.awar.ags.net.protocol.LoginResponse);

		private var loginresponse$field:com.awar.ags.net.protocol.LoginResponse;

		public function clearLoginresponse():void {
			loginresponse$field = null;
		}

		public function get hasLoginresponse():Boolean {
			return loginresponse$field != null;
		}

		public function set loginresponse(value:com.awar.ags.net.protocol.LoginResponse):void {
			loginresponse$field = value;
		}

		public function get loginresponse():com.awar.ags.net.protocol.LoginResponse {
			return loginresponse$field;
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLoginrequest) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, loginrequest$field);
			}
			if (hasLoginresponse) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, loginresponse$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var loginrequest$count:uint = 0;
			var loginresponse$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 3:
					if (loginrequest$count != 0) {
						throw new flash.errors.IOError('Bad data format: ProtocolMSG.loginrequest cannot be set twice.');
					}
					++loginrequest$count;
					this.loginrequest = new com.awar.ags.net.protocol.LoginRequest();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.loginrequest);
					break;
				case 4:
					if (loginresponse$count != 0) {
						throw new flash.errors.IOError('Bad data format: ProtocolMSG.loginresponse cannot be set twice.');
					}
					++loginresponse$count;
					this.loginresponse = new com.awar.ags.net.protocol.LoginResponse();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.loginresponse);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
