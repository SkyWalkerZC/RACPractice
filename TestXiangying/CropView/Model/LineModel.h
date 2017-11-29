//
//  LineModel.h
//  TestXiangying
//
//  Created by Z.chen on 2017/11/7.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    StraightLine,
    CurveLine,
} LineType;

@interface LineModel : NSObject

@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;
@property (nonatomic) CGPoint controlPoint;
@property (nonatomic) LineType lineType;

@end
