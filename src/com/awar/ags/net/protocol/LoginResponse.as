package com.awar.ags.net.protocol {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class LoginResponse extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const IDSESS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.awar.ags.net.protocol.LoginResponse.idsess", "idsess", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var idsess:int;

		/**
		 *  @private
		 */
		public static const IDPLAY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.awar.ags.net.protocol.LoginResponse.idplay", "idplay", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var idplay:int;

		/**
		 *  @private
		 */
		override used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.idsess);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.idplay);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var idsess$count:uint = 0;
			var idplay$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (idsess$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponse.idsess cannot be set twice.');
					}
					++idsess$count;
					this.idsess = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (idplay$count != 0) {
						throw new flash.errors.IOError('Bad data format: LoginResponse.idplay cannot be set twice.');
					}
					++idplay$count;
					this.idplay = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
