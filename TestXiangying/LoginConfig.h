//
//  LoginConfig.h
//  TestXiangying
//
//  Created by Z.chen on 2017/11/1.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface LoginConfig : NSObject
+ (RACSignal*)loginWithUsername:(NSString *)username andPassword:(NSString *)password;
@end
