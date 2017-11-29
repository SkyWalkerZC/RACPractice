//
//  Person.m
//  TestXiangying
//
//  Created by Z.chen on 2017/10/25.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import "Person.h"

@implementation Person

- (Person *(^)(NSString * food))eat
{
    return ^(NSString * food){
        NSLog(@"eat %@",food);
        return self;
    };
}

- (Person *(^)(float hoursvoid))sleep{
    return ^(float hours){
        NSLog(@"sleep %.2f hours",hours);
        return self;
    };
}


@end
