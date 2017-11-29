//
//  ViewController.m
//  TestXiangying
//
//  Created by Z.chen on 2017/10/25.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "Caculator.h"
#import "AFNetworking.h"
#import "Person.h"
#import "NextViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "LoginViewModel.h"
#import "Masonry.h"
#import <CoreMotion/CoreMotion.h>
#import <QuartzCore/QuartzCore.h>
#import "CropViewUseLayer.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()
{
    CMMotionManager * motionManager;
}
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (strong, nonatomic) LoginViewModel *viewModel;

@property (strong, nonatomic) UIDynamicAnimator *dynamicAnimator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.activityIndicatorView.hidden = YES;
    
    _viewModel = [[LoginViewModel alloc] init];
    
    RAC(self.viewModel, username) = self.userNameTextField.rac_textSignal;    // 将 userNameTextField文字变化的Signal和 viewModel的username属性关联， 只要tf的文字内容有改变， viewModel 的username 就会改变，下面的方法同此
    RAC(self.viewModel, password) = self.passwordTextField.rac_textSignal;
    self.loginButton.rac_command = self.viewModel.loginCommand;
    [[self.viewModel.loginCommand executionSignals]
     subscribeNext:^(RACSignal *x) {
        
         self.activityIndicatorView.hidden = NO;
         [self.activityIndicatorView startAnimating];
         [x subscribeNext:^(NSString *x) {
             self.activityIndicatorView.hidden = YES;
             [self.activityIndicatorView stopAnimating];
             NSLog(@"%@",x);
         }];
     }];
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view.backgroundColor = [UIColor orangeColor];
    view.center = self.view.center;
    
    
    UIGravityBehavior * gravityBehavior = [[UIGravityBehavior alloc] init];
    
    UICollisionBehavior *collision=[[UICollisionBehavior alloc]init];
    
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    CGFloat Y = self.view.frame.size.height;
    CGFloat X = self.view.frame.size.width;
    
    
    
    [collision addBoundaryWithIdentifier:@"collision1" fromPoint:CGPointMake(0,Y) toPoint:CGPointMake(X, Y)];
    [collision addBoundaryWithIdentifier:@"collision2" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(0, Y)];
    [collision addBoundaryWithIdentifier:@"collision3" fromPoint:CGPointMake(X,0) toPoint:CGPointMake(X, Y)];
    [collision addBoundaryWithIdentifier:@"collision4" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(X, 0)];
    
    gravityBehavior.magnitude = 0.5;
    
    
//    CropViewUseLayer * cropView = [[CropViewUseLayer alloc] init];
//    cropView.frame = CGRectMake(40, 80, 200, 200);
//    cropView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:cropView];
    //  想起那天的那场比赛，想起好久都没有打过球了，哎，那些逝去的日子，那些在球场上奔跑的日子，明天就要搬家了，搬了以后，我希望生活能够步入正轨，过自己想过的生活，每天打打球 读读书 练练字，学习下工作相关的东西，但愿如此，自勉。

    
    
    
    for (int i = 0; i <7; i++) {
        UIView * view = [[UIView alloc] init];
        view.frame = CGRectMake(0, 0, i % 3 ? 50 : 100, 50);
        view.layer.cornerRadius = i % 3?25:0;
        view.backgroundColor = [UIColor colorWithRed:i *30/255.0 green:i*10/255.0 blue:i*21/255.0 alpha:1];
//        [self setMaskWithUIBezierPath:aPath andView:view];
        [self.view addSubview:view];
        [gravityBehavior addItem:view];
        [collision addItem:view];
        
        view.userInteractionEnabled = YES;
        
        [view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragView:)]];
    }
    
    self.dynamicAnimator = [[UIDynamicAnimator alloc] init];
    [self.dynamicAnimator addBehavior:gravityBehavior];
    [self.dynamicAnimator addBehavior:collision];
    

    
     motionManager = [[CMMotionManager alloc] init];
//    if (motionManager.deviceMotionAvailable) {
        motionManager.deviceMotionUpdateInterval = 0.01;  //更新频率是100Hz
        [motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
            double rotation = atan2(motion.attitude.pitch, motion.attitude.roll);
            gravityBehavior.angle = rotation;
        }];
//    }
    
//    [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
//        NSLog(@"~~~~~~~~~~~~>%@",accelerometerData);
//        double rotation = atan2(accelerometerData.acceleration.x, accelerometerData.acceleration.y);
//        gravityBehavior.angle = rotation;
//    }];
    
    
    
  
    
    
    
    
//    NSMutableArray * viewArray = [NSMutableArray array];
//    for (int i = 0; i < 4; i++) {
//        UIView * view = [[UIView alloc] init];
//        view.backgroundColor = [UIColor orangeColor];
//        [self.view addSubview:view];
//        [viewArray addObject:view];
//    }
//
//    [viewArray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:110 leadSpacing:5 tailSpacing:5];
////    [viewArray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedItemLength:50 leadSpacing:15 tailSpacing:15];
//    [viewArray mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
////        make.left.equalTo(@100);
//        make.width.equalTo(@50);
//    }];
   

//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 400) style:UITableViewStylePlain];
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//    self.tableView.backgroundColor = [UIColor whiteColor];
//    为了更美好的明天而战
//   怎样的战斗在等待着我？
////    AFNetworkReachabilityManager * manager
////
//    self.imageView = ({
//        UIImageView * imgView = [[UIImageView alloc] initWithFrame:self.view.frame];
//        [imgView sd_setImageWithURL:[NSURL URLWithString:@"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4078420079,2360139187&fm=173&s=29413A6EFC8E037C9A4129120100C091&w=600&h=399&img.JPEG"]];
//        [self.view addSubview:imgView];
//        imgView.userInteractionEnabled = YES;
//        imgView;
//    });
//
////    [self.view addSubview:self.tableView];
//
////    self.textField = ({
        UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        textField.center = self.view.center;
//        [self.view addSubview:textField];
        textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.backgroundColor = [UIColor whiteColor];
    
    
    
    
    RACSubject * signalOfSignals = [RACSubject subject];
    RACSubject * signals = [RACSubject subject];
    
    [[signalOfSignals flattenMap:^RACStream *(id value) {
        return value;
    }] subscribeNext:^(id x) {
        NSLog(@"=========>%@",x);
    }];
    
    [signalOfSignals sendNext:signals];
    [signals sendNext:@"信号发送信号"];
    
    
    
    
//
//
    RACSignal * signal;

    [[textField.rac_textSignal map:^id(id value) {
        return [NSString stringWithFormat:@"Hello RAC :%@",value];
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    
    

    [signal subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
//
//
//
//
    
//    RACCommand * cmd = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
//        NSLog(@"---->%@",input);
//        RACSignal * signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//
//            [subscriber sendNext:@"haha"];
//            [subscriber sendCompleted];
//
//            return nil;
//        }];
//        return signal;
//    }];

//    [[[cmd execute:@"123"] deliverOn:[RACScheduler mainThreadScheduler]] subscribeNext:^(id x) {
//        NSLog(@"===>%@",x);
//    }];

    
    
//    NSArray * array = @[@"1",@"2",@"3"];
//    [array.rac_sequence.signal subscribeNext:^(id x) {
//        NSLog(@":::%@",x);
//    }];
    
    
//
//    RACSubject * subject = [RACSubject subject];
//    [subject subscribeNext:^(id x) {
//        NSLog(@"First subscribe:%@",x);
//    }];
//    [subject subscribeNext:^(id x) {
//        NSLog(@"Second subscribe:%@",x);
//    }];
//    [subject sendNext:@"23"];
    
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] init];
//    [[tap rac_gestureSignal] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
//    [self.imageView addGestureRecognizer:tap];
//
//    [RACObserve(self.tableView, contentOffset) subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
//    [[textField rac_textSignal] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
//        [[textField rac_signalForControlEvents:UIControlEventEditingChanged] subscribeNext:^(id x) {
//            NSLog(@"What is this :%@",x);
//
//            UITextField * tf = (UITextField *)x;
//            if (tf.text.length > 3) {
//                NSLog(@"hahha");
//            }
//
//        }];
    
    
//        textField.
//        textField;
//    });
//
//
//
//
//
//    Caculator * c = [[Caculator alloc] init];
//    c.result = 5;
//    BOOL isEqule = [[c caculator:^int(int result) {
//        result *= 2;
//        return result;
//    }] equle:^BOOL(int result) {
//        return result == 10;
//    }];
//
//    if (isEqule) {
//        NSLog(@"哈哈哈");
//    }else{
//        NSLog(@"Oh no");
//    }
//
//    // 链式编程
//    Person * person = [[Person alloc] init];
//    person.eat(@"Watermelon").sleep(7.5);
    
}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return [tableView dequeueReusableCellWithIdentifier:@"cell"];
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 7;
//}
/*
 expr (Class)NSClassFromString(@"IBARevealLoader") == nil ? (void *)dlopen("/Applications/Reveal.app/Contents/SharedSupport/iOS-Libraries/RevealServer.framework/RevealServer", 0x2) : ((void*)0)

 */

- (void)dragView:(UIPanGestureRecognizer *)pan
{
    UIView * view = pan.view;
    view.center = [pan locationInView:self.view];
}

- (void)setMaskWithUIBezierPath:(UIBezierPath *)bezierPath andView:(UIView *)view{
    //蒙版
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [bezierPath CGPath];
    maskLayer.fillColor = [[UIColor whiteColor] CGColor];
    maskLayer.frame = view.frame;
    view.layer.mask = maskLayer;
    //边框蒙版
    CAShapeLayer *maskBorderLayer = [CAShapeLayer layer];
    maskBorderLayer.path = [bezierPath CGPath];
    maskBorderLayer.fillColor = [[UIColor clearColor] CGColor];
//    maskBorderLayer.strokeColor = view.borderColor;//边框颜色
//    maskBorderLayer.lineWidth = view.borderWidth; //边框宽度
    [view.layer addSublayer:maskBorderLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NextViewController * nvc = [[NextViewController alloc] init];
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
