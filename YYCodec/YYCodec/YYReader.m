//
//  YYReader.m
//  YYCodec
//
//  Created by LinHongBin on 16/7/27.
//  Copyright © 2016年 LinHongBin. All rights reserved.
//

#import "YYReader.h"

#define DISPLACEMENT                                char *ptr = _pointer + _poz;
#define ADD_POZ(Symbol)                             _poz += sizeof(Symbol);

@interface YYReader(){
    char *_pointer;
}

@property (nonatomic, assign) uint32_t              poz;            //游标位置
@property (nonatomic, copy, readonly) NSData        *buffer;        //数据流

@end

@implementation YYReader

+ (instancetype)readerWithBuffer:(NSData *)buffer{
    return [[YYReader alloc] initWithBuffer:buffer];
}

- (instancetype)initWithBuffer:(NSData *)buffer{
    if(buffer.length <= 0)
        @throw [NSException exceptionWithName:@"Init Error" reason:@"YYReader can't init with buffer that is nil" userInfo:nil];
    
    self = [super init];
    if(self){
        _poz = 0;
        _buffer = buffer;
        _pointer = (char *)buffer.bytes;
    }
    return self;
}

#pragma Big-Endian
- (int16_t)readInt16ByBig{
    DISPLACEMENT
    uint16_t hostData = CFSwapInt16BigToHost(*(const uint16_t *)ptr);
    ADD_POZ(int16_t)
    return *(int16_t *)(&hostData);
}

- (int32_t)readInt32ByBig{
    DISPLACEMENT
    uint32_t hostData = CFSwapInt32BigToHost(*(const uint32_t *)ptr);
    ADD_POZ(int32_t)
    return *(int32_t *)(&hostData);
}

- (int64_t)readInt64ByBig{
    DISPLACEMENT
    uint64_t hostData = CFSwapInt64BigToHost(*(const uint64_t *)ptr);
    ADD_POZ(int64_t)
    return *(int64_t *)(&hostData);
}

- (Float32)readFloat32ByBig{
    CFSwappedFloat32 bigFloat;
    NSData *bigFloatData = [self readBytes:sizeof(Float32)];
    bigFloat.v = CFSwapInt32BigToHost(*(const uint32_t *)[bigFloatData bytes]);
    return CFConvertFloat32SwappedToHost(bigFloat);
}

- (Float64)readFloat64ByBig{
    CFSwappedFloat64 bigFloat;
    NSData *bigFloatData = [self readBytes:sizeof(Float64)];
    bigFloat.v = CFSwapInt64BigToHost(*(const uint64_t *)[bigFloatData bytes]);
    return CFConvertFloat64SwappedToHost(bigFloat);
}

- (double)readDoubleByBig{
    CFSwappedFloat64 bigFloat;
    NSData *bigFloatData = [self readBytes:sizeof(Float64)];
    bigFloat.v = CFSwapInt64BigToHost(*(const uint64_t *)[bigFloatData bytes]);
    return CFConvertDoubleSwappedToHost(bigFloat);
}

#pragma Little-Endian
- (int16_t)readInt16ByLittle{
    DISPLACEMENT
    uint16_t hostData = CFSwapInt16LittleToHost(*(const uint16_t *)ptr);
    ADD_POZ(int16_t)
    return *(int16_t *)(&hostData);
}

- (int32_t)readInt32ByLittle{
    DISPLACEMENT
    uint32_t hostData = CFSwapInt32LittleToHost(*(const uint32_t *)ptr);
    ADD_POZ(int32_t)
    return *(int32_t *)(&hostData);
}

- (int64_t)readInt64ByLittle{
    DISPLACEMENT
    uint64_t hostData = CFSwapInt64LittleToHost(*(const uint64_t *)ptr);
    ADD_POZ(int64_t)
    return *(int64_t *)(&hostData);
}

- (Float32)readFloat32ByLittle{
    CFSwappedFloat32 littleFloat;
    NSData *littleFloatData = [self readBytes:sizeof(Float32)];
    littleFloat.v = CFSwapInt32LittleToHost(*(const uint32_t *)[littleFloatData bytes]);
    return CFConvertFloat32SwappedToHost(littleFloat);
}

- (Float64)readFloat64ByLittle{
    CFSwappedFloat64 littleFloat;
    NSData *littleFloatData = [self readBytes:sizeof(Float64)];
    littleFloat.v = CFSwapInt64LittleToHost(*(const uint64_t *)[littleFloatData bytes]);
    return CFConvertFloat64SwappedToHost(littleFloat);
}

- (double)readDoubleByLittle{
    CFSwappedFloat64 littleFloat;
    NSData *littleFloatData = [self readBytes:sizeof(double)];
    littleFloat.v = CFSwapInt64LittleToHost(*(const uint64_t *)[littleFloatData bytes]);
    return CFConvertDoubleSwappedToHost(littleFloat);
}

- (NSData *)readBytes:(uint32_t)len{
    if(!len)
        return nil;
    
    if(_poz + len > _buffer.length)
        return nil;
    
    NSData *data = [_buffer subdataWithRange:NSMakeRange(_poz, len)];
    _poz += len;
    return data;
}

- (NSString *)readString{
    uint32_t len = [self readInt16ByBig];
    NSData *strData = [self readBytes:len];
    return [[NSString alloc] initWithData:strData encoding:NSUTF8StringEncoding];
}

- (BOOL)readBool{
    DISPLACEMENT
    _poz += sizeof(BOOL);
    return *(BOOL*)ptr;
}


@end
















