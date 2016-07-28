//
//  YYWriter.m
//  YYCodec
//
//  Created by LinHongBin on 16/7/26.
//  Copyright © 2016年 LinHongBin. All rights reserved.
//

#import "YYWriter.h"

@interface YYWriter()

@property (nonatomic, assign) uint32_t      poz;            //游标位置
@property (nonatomic, strong) NSMutableData *buffer;        //数据流

@end

@implementation YYWriter

+ (instancetype)writerInit{
    return [[YYWriter alloc] init];
}

- (instancetype)init{
    self = [super init];
    if(self){
        _buffer = [NSMutableData new];
    }
    return self;
}

- (BOOL)writeBytes:(NSData *)bytes{
    if(bytes.length <= 0)
        return NO;
    
    [_buffer appendData:bytes];
    return YES;
}

- (BOOL)writeBytes:(const char *)bytes length:(uint32_t)length{
    if(length <= 0 || bytes == nil)
        return NO;
    
    [_buffer appendBytes:bytes length:length];
    return YES;
}

#pragma Big-Endian
- (BOOL)writeInt16HostToBig:(int16_t)value{
    uint16_t num = CFSwapInt16HostToBig(value);
    Byte *bytes = (Byte *)&num;
    NSData *data = [NSData dataWithBytes:bytes length:sizeof(uint16_t)];
    return [self writeBytes:data];
}

- (BOOL)writeInt32HostToBig:(int32_t)value{
    uint32_t num = CFSwapInt32HostToBig(value);
    Byte *bytes = (Byte *)&num;
    NSData *data = [NSData dataWithBytes:bytes length:sizeof(uint32_t)];
    return [self writeBytes:data];
}

- (BOOL)writeInt64HostToBig:(int64_t)value{
    uint64_t num = CFSwapInt64HostToBig(value);
    Byte *bytes = (Byte *)&num;
    NSData *data = [NSData dataWithBytes:bytes length:sizeof(uint64_t)];
    return [self writeBytes:data];
}

- (BOOL)writeFloat32HostToBig:(Float32)value{
    NSData *data = [NSData dataWithBytes:&value length:sizeof(Float32)];
    return [self writeBytes:data];
}

- (BOOL)writeFloat64HostToBig:(Float64)value{
    NSData *data = [NSData dataWithBytes:&value length:sizeof(Float64)];
    return [self writeBytes:data];
}

- (BOOL)writeDoubleHostToBig:(double)value{
    NSData *data = [NSData dataWithBytes:&value length:sizeof(double)];
    return [self writeBytes:data];
}

#pragma Litter-Endian
- (BOOL)writeInt16HostToLittle:(int16_t)value{
    uint16_t num = CFSwapInt16HostToLittle(value);
    Byte *bytes = (Byte *)&num;
    NSData *data = [NSData dataWithBytes:bytes length:sizeof(uint16_t)];
    return [self writeBytes:data];
}

- (BOOL)writeInt32HostToLittle:(int32_t)value{
    uint32_t num = CFSwapInt32HostToLittle(value);
    Byte *bytes = (Byte *)&num;
    NSData *data = [NSData dataWithBytes:bytes length:sizeof(uint32_t)];
    return [self writeBytes:data];
}

- (BOOL)writeInt64HostToLittle:(int64_t)value{
    uint64_t num = CFSwapInt64HostToLittle(value);
    Byte *bytes = (Byte *)&num;
    NSData *data = [NSData dataWithBytes:bytes length:sizeof(uint64_t)];
    return [self writeBytes:data];
}

- (BOOL)writeFloat32HostToLittle:(Float32)value{
    CFSwappedFloat32 littleFloat = CFConvertFloat32HostToSwapped(value);
    return [self writeInt32HostToLittle:littleFloat.v];
}

- (BOOL)writeFloat64HostToLittle:(Float64)value{
    CFSwappedFloat64 littleFloat = CFConvertFloat64HostToSwapped(value);
    return [self writeInt64HostToLittle:littleFloat.v];
}

- (BOOL)writeDoubleHostToLittle:(double)value{
    CFSwappedFloat64 littleFloat = CFConvertDoubleHostToSwapped(value);
    return [self writeInt64HostToLittle:littleFloat.v];
}

#pragma normal
- (BOOL)writeByte:(char)byte{
    return [self writeBytes:(const char *)&byte length:sizeof(char)];
}

- (BOOL)writeBool:(BOOL)value{
    return [self writeByte:value ? 1 : 0];
}

- (BOOL)writeString:(NSString *)str{
    NSData *strData = [str dataUsingEncoding:NSUTF8StringEncoding];
    if([self writeInt16HostToBig:(uint16_t)strData.length]){
        return [self writeBytes:strData];
    }
    return NO;
}

- (NSData *)getBuffer{
    return _buffer;
}
@end






