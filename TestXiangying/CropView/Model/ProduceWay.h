//
//  ProduceWay.h
//  TestXiangying
//
//  Created by Z.chen on 2017/11/7.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ProduceWay : NSObject
@property (nonatomic) CGPoint apexOne;
@property (nonatomic) CGPoint apexTwo;
@property (nonatomic) CGPoint apexThree;
@property (nonatomic) CGPoint apexFour;

@property (nonatomic) CGPoint centerTop;
@property (nonatomic) CGPoint centerBottom;
@property (strong, nonatomic) NSMutableArray *cropGraphOnePointArray;
@property (strong, nonatomic) NSMutableArray *cropGraphTwoPointArray;
@end
