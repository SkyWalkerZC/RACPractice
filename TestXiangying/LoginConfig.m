//
//  LoginConfig.m
//  TestXiangying
//
//  Created by Z.chen on 2017/11/1.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import "LoginConfig.h"

@implementation LoginConfig
+ (RACSignal*)loginWithUsername:(NSString *)username andPassword:(NSString *)password{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:[NSString stringWithFormat:@"Username is :%@;  Password is :%@",username,password]];
            [subscriber sendCompleted];
        });
        
        
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
}

- (void)whatIsThis{
    NSLog(@"");
}

//+ (RACSignal *)loginWithUsername:(NSString *)username andPassword:(NSString *)password andIndex:(NSUInteger)index{
//    dispatch_semaphore_t semaphore_t = dispatch_semaphore_create(1);
//    
//    dispatch_time_t overTime = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        dispatch_semaphore_wait(semaphore_t, overTime);
//        
//        dispatch_semaphore_signal(semaphore_t);
//    });
//    
//    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        return nil;
//    }];
//}
@end
