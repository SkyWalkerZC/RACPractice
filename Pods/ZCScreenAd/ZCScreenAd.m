//
//  ZCScreenAd.m
//  2016_1_11_Button
//
//  Created by ebao on 16/1/13.
//  Copyright © 2016年 Ebao. All rights reserved.
//

#import "ZCScreenAd.h"

@implementation ZCScreenAd
static double autoSizeScaleX;
static double autoSizeScaleY;
bool is4s;
//此方法在类加载的时候执行
+ (void)load;
{
    //NSLog(@"ZJScreenAdaptation load");
    
    //获取屏幕大小
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
    //如果是iPhone6, 6plus
    if(size.height > 568){
        // iPhone 6plus
        if (size.height > 667) {
            autoSizeScaleX = size.width/375;
            autoSizeScaleY = size.height/667;
        }else{
            autoSizeScaleX = 1.0;
            autoSizeScaleY = 1.0;
        }

    }
    //如果是iPhone5,5s
    else{
//        autoSizeScaleX = 1.0;
//        autoSizeScaleY = 1.0;
        autoSizeScaleX = size.width/375;
        autoSizeScaleY = size.height/667;
    }
    if (size.height < 568) {
        autoSizeScaleY = size.height/667;
        autoSizeScaleX = autoSizeScaleY;
    }
}
CGRect CGRectMakeEx(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    CGRect rect;
    rect.origin.x = x * autoSizeScaleX;
    rect.origin.y = y * autoSizeScaleY;
    rect.size.width = width * autoSizeScaleX;
    rect.size.height = height * autoSizeScaleY;
    return rect;
}
CGSize CGSizeMakeEx(CGFloat width, CGFloat height)
{
    CGSize size;
    size.width = autoSizeScaleX * width;
    size.height = autoSizeScaleY * height;
    return size;
}
CGPoint CGPointMakeEx(CGFloat x, CGFloat y)
{
    CGPoint point;
    point.x = autoSizeScaleX * x;
    point.y = autoSizeScaleY * y;
    return point;
}
//适配高度
double heightEx(double height)
{
    return height * autoSizeScaleY;
}
//适配宽度
double widthEx(double width)
{
    return width * autoSizeScaleX;
}
@end
