//
//  YYCodecWriter.m
//  YYCodec
//
//  Created by LinHongBin on 16/7/28.
//  Copyright © 2016年 LinHongBin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YYWriter.h"

#define LogBuffer(writer)           NSLog(@"buffer = %@",[writer getBuffer]);

@interface YYCodecWriter : XCTestCase

@end

@implementation YYCodecWriter

#pragma test Big Endian
- (void)testInt16HostToBig{
    YYWriter *writer1 = [YYWriter writerInit];
    [writer1 writeInt16HostToBig:5];
    LogBuffer(writer1)
    
    YYWriter *writer2 = [YYWriter writerInit];
    [writer2 writeInt16HostToBig:-5];
    LogBuffer(writer2)
}

- (void)testInt32HostToBig{
    YYWriter *writer1 = [YYWriter writerInit];
    [writer1 writeInt32HostToBig:5];
    LogBuffer(writer1)
    
    YYWriter *writer2 = [YYWriter writerInit];
    [writer2 writeInt32HostToBig:-5];
    LogBuffer(writer2)
}

- (void)testInt64HostToBig{
    YYWriter *writer1 = [YYWriter writerInit];
    [writer1 writeInt64HostToBig:5];
    LogBuffer(writer1)
    
    YYWriter *writer2 = [YYWriter writerInit];
    [writer2 writeInt64HostToBig:-5];
    LogBuffer(writer2)
}

- (void)testFloat32HostToBig{
    YYWriter *writer = [YYWriter writerInit];
    [writer writeFloat32HostToBig:5.0f];
    LogBuffer(writer)
}

- (void)testFloat64HostToBig{
    YYWriter *writer = [YYWriter writerInit];
    [writer writeFloat64HostToBig:5.0f];
    LogBuffer(writer)
}

- (void)testDoubleHostToBig{
    YYWriter *writer = [YYWriter writerInit];
    [writer writeDoubleHostToBig:5.0f];
    LogBuffer(writer)
}

#pragma test Little Endian
- (void)testInt16HostToLittle{
    YYWriter *writer1 = [YYWriter writerInit];
    [writer1 writeInt16HostToLittle:5];
    LogBuffer(writer1)
    
    YYWriter *writer2 = [YYWriter writerInit];
    [writer2 writeInt16HostToLittle:-5];
    LogBuffer(writer2)
}

- (void)testInt32HostToLittle{
    YYWriter *writer1 = [YYWriter writerInit];
    [writer1 writeInt32HostToLittle:5];
    LogBuffer(writer1)
    
    YYWriter *writer2 = [YYWriter writerInit];
    [writer2 writeInt32HostToLittle:-5];
    LogBuffer(writer2)
}

- (void)testInt64HostToLittle{
    YYWriter *writer1 = [YYWriter writerInit];
    [writer1 writeInt64HostToLittle:5];
    LogBuffer(writer1)
    
    YYWriter *writer2 = [YYWriter writerInit];
    [writer2 writeInt64HostToLittle:-5];
    LogBuffer(writer2)
}

- (void)testFloat32HostToLittle{
    YYWriter *writer = [YYWriter writerInit];
    [writer writeFloat32HostToLittle:5.0f];
    LogBuffer(writer)
}

- (void)testFLoat64HostToLittle{
    YYWriter *writer = [YYWriter writerInit];
    [writer writeFloat64HostToLittle:5.0f];
    LogBuffer(writer)
}

- (void)testDoubleHostToLittle{
    YYWriter *writer = [YYWriter writerInit];
    [writer writeDoubleHostToLittle:5.0f];
    LogBuffer(writer)
}

#pragma normal
- (void)testWriteByte{
    YYWriter *writer = [YYWriter writerInit];
    [writer writeByte:'d'];
    LogBuffer(writer)
}

@end
