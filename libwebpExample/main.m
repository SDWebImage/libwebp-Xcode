//
//  main.m
//  libwebpExample
//
//  Created by Bogdan Poplauschi on 28/08/2018.
//  Copyright © 2018 SDWebImage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <libwebp/libwebp.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Decoder version: %d", WebPGetDecoderVersion());
    }
    return 0;
}
