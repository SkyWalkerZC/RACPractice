//
//  CropViewUseLayer.h
//  TestXiangying
//
//  Created by Z.chen on 2017/11/7.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ViewClick)(UIView *view);

@interface CropViewUseLayer : UIView


@property (strong, nonatomic) UIBezierPath *marginalPath;
@property (strong, nonatomic) UIButton *button;
@property (copy, nonatomic) ViewClick viewClick;
@property (strong, nonatomic) NSArray *lineModelArray;


@end
