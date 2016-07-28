//
//  YYWriter.h
//  YYCodec
//
//  Created by LinHongBin on 16/7/26.
//  Copyright © 2016年 LinHongBin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYWriter : NSObject

+ (instancetype)writerInit;

#pragma Big-Endian
- (BOOL)writeInt16HostToBig:(int16_t)value;         // 5 -> 0005                / -5 -> fffb
- (BOOL)writeInt32HostToBig:(int32_t)value;         // 5 -> 00000005            / -5 -> fffffffb
- (BOOL)writeInt64HostToBig:(int64_t)value;         // 5 -> 00000000 00000005   / -5 -> ffffffff fffffffb
- (BOOL)writeFloat32HostToBig:(Float32)value;       // 5.0f -> 00000a040
- (BOOL)writeFloat64HostToBig:(Float64)value;       // 5.0f -> 00000000 000001440
- (BOOL)writeDoubleHostToBig:(double)value;

#pragma Litter-Endian
- (BOOL)writeInt16HostToLittle:(int16_t)value;      // 5 -> 0500                / -5 -> fbff
- (BOOL)writeInt32HostToLittle:(int32_t)value;      // 5 -> 05000000            / -5 -> fbffffff
- (BOOL)writeInt64HostToLittle:(int64_t)value;      // 5 -> 05000000 00000000   / -5 -> fbffffff ffffffff
- (BOOL)writeFloat32HostToLittle:(Float32)value;    // 5.0f -> 40a00000
- (BOOL)writeFloat64HostToLittle:(Float64)value;    // 5.0f -> 40140000 00000000
- (BOOL)writeDoubleHostToLittle:(double)value;

#pragma normal
- (BOOL)writeByte:(char)byte;
- (BOOL)writeBool:(BOOL)value;
- (BOOL)writeString:(NSString *)str;

#pragma get buffer
- (NSData *)getBuffer;

@end
