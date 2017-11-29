//
//  Person.h
//  TestXiangying
//
//  Created by Z.chen on 2017/10/25.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (Person *(^)(NSString * foodvoid))eat;
- (Person *(^)(float hours))sleep;

@end
