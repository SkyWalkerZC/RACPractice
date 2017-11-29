//
//  LoginViewModel.h
//  TestXiangying
//
//  Created by Z.chen on 2017/11/1.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface LoginViewModel : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) RACCommand *loginCommand;

@end
