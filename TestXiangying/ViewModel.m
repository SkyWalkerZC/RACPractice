//
//  ViewModel.m
//  TestXiangying
//
//  Created by Z.chen on 2017/10/27.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import "ViewModel.h"
#import "AFNetworking.h"


@implementation ViewModel

- (RACCommand *)zcCommand
{
    if (!_zcCommand) {
        _zcCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            NSLog(@"Recive :%@",input);
            
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
                [manager GET:@"https://gank.io/api/data/Android/10/1" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {

                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                    [subscriber sendNext:responseObject];
                    [subscriber sendCompleted];
                    
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSLog(@"请求错误%@",error);
                }];
                return [RACDisposable disposableWithBlock:^{
                    NSLog(@"结束了");
                }];
            }];
        }];
    }
    return _zcCommand;
}

@end
