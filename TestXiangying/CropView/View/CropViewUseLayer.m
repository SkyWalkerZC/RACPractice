//
//  CropViewUseLayer.m
//  TestXiangying
//
//  Created by Z.chen on 2017/11/7.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import "CropViewUseLayer.h"
#import "LineModel.h"

@implementation CropViewUseLayer

- (void)drawLine{
    UIBezierPath * path = [[UIBezierPath alloc] init];
    self.marginalPath = path;
    for (int i = 0; i < self.lineModelArray.count - 1; i++) {
        LineModel * model = [[LineModel alloc] init];
        if (i == 0) {
            [path moveToPoint:model.startPoint];
        }
        if (model.lineType == StraightLine) {
            [path addLineToPoint:model.endPoint];
        }else{
            [path addQuadCurveToPoint:model.endPoint controlPoint:model.controlPoint];
        }
    }
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    shapeLayer.frame = self.bounds;
    self.layer.mask = shapeLayer;
    
    CAShapeLayer *borderLayer = [[CAShapeLayer alloc] init];
    borderLayer.path = path.CGPath;
    borderLayer.fillColor = [UIColor greenColor].CGColor;
    borderLayer.strokeColor = [UIColor purpleColor].CGColor;
    borderLayer.lineWidth = 2.0;
    [self.layer addSublayer:borderLayer];
    
    [self addSubview:self.button];
    self.button.frame = self.bounds;
    [self.button setBackgroundImage:[self createImageWithColor:[UIColor redColor]] forState:UIControlStateHighlighted];
    self.button.userInteractionEnabled = NO;
    self.userInteractionEnabled = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedNotice) name:@"Piece" object:nil];
}

- (void)receivedNotice{
    self.viewClick(self);
}

- (UIImage *)createImageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.button.highlighted = NO;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    if ([self.marginalPath containsPoint:point]) {
        return YES;
    }else{
        return NO;
    }
}

- (void)removeFromSuperview{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Piece" object:nil];
    [super removeFromSuperview];
}

@end
