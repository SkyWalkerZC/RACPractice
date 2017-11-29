//
//  ZCTableViewModel.m
//  TestXiangying
//
//  Created by Z.chen on 2017/11/28.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import "ZCTableViewModel.h"
#import "ZCModel.h"

@implementation ZCTableViewModel

- (RACCommand *)command{
    if (!_command) {
        _command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
           // 这里进行判断，首先判断pageNum略过
            // 需要返回一个RACSignal 这里返回的是ViewModel自己的 requestListDataSignal
            // 然后过滤信号，这里做了一个判断检测是不是需要的model类型 如果是就继续
            return [[self.requestListDataSignal filter:^BOOL(id value) {
                return [value isKindOfClass:[ZCModel class]];
            }] doNext:^(ZCModel * x) {
                // 如果是需要的model类型 在这里将数据添加进来
                [self.dataArray addObject:x];
            }];
        }];
    }
    return _command;
}

- (RACSignal *)requestListDataSignal{
    /* 这个signal 在baseViewModel中先置空，在需要的地方重写
     return [WYMTCConsultCommonService historyOrderListWithParams:self.orderParams];
     这个方法在Service里实现，进行数据请求，并将需要转换为model 的数据用map映射为model
     */
    if (!_requestListDataSignal) {
        _requestListDataSignal = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@"请求到的数据"];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
                // 数据请求完毕，取消task
            }];
        }] map:^ZCModel *(NSString * value) {
            // 把请求到的数据映射为model
            ZCModel * model = [[ZCModel alloc] init];
            model.name = value;
            model.detail = @"你说吧";
            return model;
        }];
    }
    return _requestListDataSignal;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

@end
