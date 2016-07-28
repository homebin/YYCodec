//
//  YYReader.h
//  YYCodec
//
//  Created by LinHongBin on 16/7/27.
//  Copyright © 2016年 LinHongBin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYReader : NSObject

+ (instancetype)readerWithBuffer:(NSData *)buffer;

#pragma Big-Endian
- (int16_t)readInt16ByBig;                          // 0005 -> 5
- (int32_t)readInt32ByBig;                          // 00000005 -> 5
- (int64_t)readInt64ByBig;                          // 00000000 00000005 -> 5
- (Float32)readFloat32ByBig;
- (Float64)readFloat64ByBig;
- (double)readDoubleByBig;

#pragma Little-Endian
- (int16_t)readInt16ByLittle;                       // 0500 -> 5
- (int32_t)readInt32ByLittle;                       // 05000000 -> 5
- (int64_t)readInt64ByLittle;                       // 05000000 00000000 -> 5
- (Float32)readFloat32ByLittle;
- (Float64)readFloat64ByLittle;
- (double)readDoubleByLittle;

#pragma normal
- (NSData *)readBytes:(uint32_t)len;
- (NSString *)readString;
- (BOOL)readBool;
@end
