//
//  ZCScreenAd.h
//  2016_1_11_Button
//
//  Created by ebao on 16/1/13.
//  Copyright © 2016年 Ebao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZCScreenAd : NSObject
//扩展函数适配Rect
CGRect CGRectMakeEx(CGFloat x, CGFloat y, CGFloat width, CGFloat height);
//扩展适应Size
CGSize CGSizeMakeEx(CGFloat width, CGFloat height);
//扩展点
CGPoint CGPointMakeEx(CGFloat x, CGFloat y);

//适配高度
double heightEx(double height);
//适配宽度
double widthEx(double width);
@end
