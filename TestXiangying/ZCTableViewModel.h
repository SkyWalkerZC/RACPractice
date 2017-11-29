//
//  ZCTableViewModel.h
//  TestXiangying
//
//  Created by Z.chen on 2017/11/28.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ZCTableViewModel : NSObject

@property (nonatomic, strong) RACCommand * command;

@property (nonatomic, strong) RACSignal * requestListDataSignal;

@property (nonatomic, strong) NSMutableArray * dataArray;

@end
