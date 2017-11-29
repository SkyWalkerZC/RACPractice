//
//  HinderModel.h
//  TestXiangying
//
//  Created by Z.chen on 2017/11/7.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    HinderRectangle,
    HinderCircular,
} HinderType;

@interface HinderModel : NSObject

@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGPoint controlPoint;
@property (nonatomic) CGPoint controlPoint_2;
@property (nonatomic) HinderType hinderType;

- (HinderModel *)createOtherModel;

@end
