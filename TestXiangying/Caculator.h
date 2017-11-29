//
//  Caculator.h
//  TestXiangying
//
//  Created by Z.chen on 2017/10/25.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Caculator : NSObject

@property(nonatomic) BOOL isEqule;
@property(nonatomic) int result;

- (Caculator *)caculator:(int(^)(int result))resultBlock;
- (Caculator *)equle:(BOOL(^)(int result))opBlock;

@end
