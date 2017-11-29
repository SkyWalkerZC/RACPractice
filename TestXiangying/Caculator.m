//
//  Caculator.m
//  TestXiangying
//
//  Created by Z.chen on 2017/10/25.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import "Caculator.h"

@implementation Caculator

- (Caculator *)caculator:(int (^)(int))resultBlock
{
    self.result = resultBlock(self.result);
    return self;
}

- (Caculator *)equle:(BOOL (^)(int))opBlock
{
    self.isEqule = opBlock(self.result);
    return self;
}

@end
