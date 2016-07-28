//
//  YYCodecReader.m
//  YYCodec
//
//  Created by LinHongBin on 16/7/28.
//  Copyright © 2016年 LinHongBin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YYWriter.h"
#import "YYReader.h"

@interface YYCodecReader : XCTestCase

@end

@implementation YYCodecReader

#pragma test Big Endian
- (void)testReadInt16ByBig{
    int16_t num = 5;
    YYWriter *writer = [YYWriter writerInit];
    [writer writeInt16HostToBig:num];
    
    YYReader *reader = [YYReader readerWithBuffer:[writer getBuffer]];
    int16_t newNum = [reader readInt16ByBig];
    NSLog(@"newNum = %d",newNum);
}

- (void)testReadInt32ByBig{
    int32_t num = 5;
    YYWriter *writer = [YYWriter writerInit];
    [writer writeInt32HostToBig:num];
    
    YYReader *reader = [YYReader readerWithBuffer:[writer getBuffer]];
    int32_t newNum = [reader readInt32ByBig];
    NSLog(@"newNum = %d",newNum);
}

- (void)testReadInt64ByBig{
    int64_t num = 5;
    YYWriter *writer = [YYWriter writerInit];
    [writer writeInt64HostToBig:num];
    
    YYReader *reader = [YYReader readerWithBuffer:[writer getBuffer]];
    int64_t newNum = [reader readInt64ByBig];
    NSLog(@"newNum = %lld",newNum);
}

- (void)testReadFloat32ByBig{
    Float32 num = 5.0f;
    YYWriter *writer = [YYWriter writerInit];
    [writer writeFloat32HostToBig:num];
    
    YYReader *reader = [YYReader readerWithBuffer:[writer getBuffer]];
    Float32 newNum = [reader readFloat32ByBig];
    NSLog(@"newNum = %f",newNum);
}

- (void)testReadFloat64ByBig{
    Float32 num = 5.0f;
    YYWriter *writer = [YYWriter writerInit];
    [writer writeFloat64HostToBig:num];
    
    YYReader *reader = [YYReader readerWithBuffer:[writer getBuffer]];
    Float32 newNum = [reader readFloat64ByBig];
    NSLog(@"newNum = %f",newNum);
}

#pragma test Little Endian
- (void)testReadInt16ByLittle{
    int16_t num = 5;
    YYWriter *writer = [YYWriter writerInit];
    [writer writeInt16HostToLittle:num];
    
    YYReader *reader = [YYReader readerWithBuffer:[writer getBuffer]];
    int16_t newNum = [reader readInt16ByLittle];
    NSLog(@"newNum = %d",newNum);
}

- (void)testReadInt32ByLittle{
    int16_t num = 5;
    YYWriter *writer = [YYWriter writerInit];
    [writer writeInt32HostToLittle:num];
    
    YYReader *reader = [YYReader readerWithBuffer:[writer getBuffer]];
    int16_t newNum = [reader readInt32ByLittle];
    NSLog(@"newNum = %d",newNum);
}

- (void)testReadInt64ByLittle{
    int64_t num = 5;
    YYWriter *writer = [YYWriter writerInit];
    [writer writeInt64HostToLittle:num];
    
    YYReader *reader = [YYReader readerWithBuffer:[writer getBuffer]];
    int64_t newNum = [reader readInt64ByLittle];
    NSLog(@"newNum = %lld",newNum);
}

- (void)testReadFloat32ByLittle{
    Float32 num = 5.0f;
    YYWriter *writer = [YYWriter writerInit];
    [writer writeFloat32HostToLittle:num];
    
    YYReader *reader = [YYReader readerWithBuffer:[writer getBuffer]];
    Float32 newNum = [reader readFloat32ByLittle];
    NSLog(@"newNum = %f",newNum);
}

- (void)testReadFloat64ByLittle{
    Float32 num = 5.0f;
    YYWriter *writer = [YYWriter writerInit];
    [writer writeFloat64HostToLittle:num];
    
    YYReader *reader = [YYReader readerWithBuffer:[writer getBuffer]];
    Float32 newNum = [reader readFloat64ByLittle];
    NSLog(@"newNum = %f",newNum);
}

- (void)testReadString{
    NSString *str = @"我的github名字叫HomeBin";
    YYWriter *writer = [YYWriter writerInit];
    [writer writeString:str];
    
    YYReader *reader = [YYReader readerWithBuffer:[writer getBuffer]];
    NSString *newStr = [reader readString];
    NSLog(@"newStr = %@",newStr);
}

- (void)testReadBool{
    BOOL success = NO;
    YYWriter *writer = [YYWriter writerInit];
    [writer writeBool:success];
    
    YYReader *reader = [YYReader readerWithBuffer:[writer getBuffer]];
    BOOL newBool = [reader readBool];
    NSLog(@"newBool = %d",newBool);
}
@end







