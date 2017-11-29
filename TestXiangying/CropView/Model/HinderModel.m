//
//  HinderModel.m
//  TestXiangying
//
//  Created by Z.chen on 2017/11/7.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import "HinderModel.h"

@implementation HinderModel

- (HinderModel *)createOtherModel{
    HinderModel *anotherModel = [[HinderModel alloc] init];
    anotherModel.startPoint = self.startPoint;
    anotherModel.endPoint = self.endPoint;
    anotherModel.controlPoint = CGPointMake(_controlPoint.x, _controlPoint.y);
    anotherModel.controlPoint_2 = CGPointMake(_controlPoint_2.x, _controlPoint_2.y);
    anotherModel.hinderType = self.hinderType;
    return anotherModel;
}

@end
