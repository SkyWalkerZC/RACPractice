//
//  ViewModel.h
//  TestXiangying
//
//  Created by Z.chen on 2017/10/27.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewModel : NSObject
@property (strong,nonatomic) RACCommand * zcCommand;
@end
