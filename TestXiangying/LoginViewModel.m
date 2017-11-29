//
//  LoginViewModel.m
//  TestXiangying
//
//  Created by Z.chen on 2017/11/1.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import "LoginViewModel.h"
#import "LoginConfig.h"

@implementation LoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // 检测自己的username属性发生变化 把username映射为bool值
        RACSignal * usernameLengthSignal = [RACObserve(self, username) map:^id(NSString * value) {
            if (value.length > 11)
                return @YES;
            return @NO;
        }];
        
        RACSignal * passwordLengthSignal = [RACObserve(self, password) map:^id(NSString * value) {
            if (value.length > 6) {
                return @YES;
            }
            return @NO;
        }];
        // 先组合再聚合，把上面两个信号聚合在一起。形成一个信号  （两者都成立才为yes）
        RACSignal * loginBtnEnable = [RACSignal combineLatest:@[usernameLengthSignal, passwordLengthSignal] reduce:^id(NSNumber * username , NSNumber * password){
            return @(username.boolValue && password.boolValue);
        }];
        
        _loginCommand = [[RACCommand alloc] initWithEnabled:loginBtnEnable signalBlock:^RACSignal *(id input) {
            return [LoginConfig loginWithUsername:self.username andPassword:self.password];
        }];
    }
    return self;
}

@end
