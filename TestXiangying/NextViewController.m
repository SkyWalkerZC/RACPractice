//
//  NextViewController.m
//  TestXiangying
//
//  Created by Z.chen on 2017/10/26.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import "NextViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "ViewModel.h"
#import <WebKit/WebKit.h>

@interface NextViewController ()<UIWebViewDelegate>

@property (nonatomic) dispatch_source_t timer;
@property (strong, nonatomic) UIWebView * wkWebView;
@property (strong, nonatomic) WKWebViewConfiguration * webViewConfig;

@end

@implementation NextViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _webViewConfig = [[WKWebViewConfiguration alloc] init];
    _wkWebView = [[UIWebView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2, 0, 0 )];

    _wkWebView.delegate = self;
    [_wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    [self.view addSubview:_wkWebView];
    
    // Do any additional setup after loading the view.
//
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
//
//    // 创建 timer
//    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//
////    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, 0 * NSEC_PER_SEC);
//
//    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 0);
//
//    dispatch_source_set_event_handler(_timer, ^{
//        NSLog(@"hah");
//    });
//
//    dispatch_resume(_timer);
    
    ViewModel * viewModel = [[ViewModel alloc] init];
    [[[viewModel.zcCommand execute:@"SendSignal"] deliverOn:[RACScheduler mainThreadScheduler]] subscribeNext:^(id x) {
        NSLog(@"This is Http request result :%@",x);
    }];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
     [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('tab-wrap').remove();"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:2.5 animations:^{
        _wkWebView.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100);
        _wkWebView.alpha = 0;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
