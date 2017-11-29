//
//  ProduceWay.m
//  TestXiangying
//
//  Created by Z.chen on 2017/11/7.
//  Copyright © 2017年 Z.chen. All rights reserved.
//

#import "ProduceWay.h"
#import "LineModel.h"
#import "HinderModel.h"

@implementation ProduceWay

- (void)theRectangleApexWith:(CGPoint)one :(CGPoint)two :(CGPoint)three :(CGPoint)four{
    self.apexOne = one;
    self.apexTwo = two;
    self.apexThree = three;
    self.apexFour = four;
    
    self.centerTop = CGPointMake((one.x + two.x) / 2, one.y);
    self.centerBottom = CGPointMake((three.x + four.x) / 2, three.y);
    [self configeArray];
}

- (void)addHider:(HinderModel *)hinder{
    switch (hinder.hinderType) {
        case HinderCircular:{
                HinderModel *anotherModel = [hinder createOtherModel];
                LineModel *model = _cropGraphOnePointArray[1];
                model.endPoint = hinder.startPoint;
                
                LineModel *circularModel = [[LineModel alloc] init];
                circularModel.startPoint = hinder.startPoint;
                circularModel.endPoint = hinder.endPoint;
                circularModel.controlPoint = hinder.controlPoint;
                circularModel.lineType = CurveLine;
                [_cropGraphOnePointArray insertObject:circularModel atIndex:2];
                
                LineModel *circularModel_2 = [[LineModel alloc] init];
                circularModel_2.startPoint = hinder.endPoint;
                circularModel_2.endPoint = self.centerBottom;
                [_cropGraphOnePointArray insertObject:circularModel_2 atIndex:3];
                
                LineModel * model_2 = _cropGraphTwoPointArray[3];
                model_2.endPoint = anotherModel.endPoint;
                
                LineModel * circularModel_3 = [[LineModel alloc] init];
                circularModel_3.startPoint = anotherModel.endPoint;
                circularModel_3.endPoint = anotherModel.startPoint;
                circularModel_3.controlPoint = anotherModel.controlPoint;
                circularModel_3.lineType = CurveLine;
                [_cropGraphTwoPointArray addObject:circularModel_3];
                
                LineModel * circularModel_4 = [[LineModel alloc] init];
                circularModel_4.startPoint = anotherModel.startPoint;
                circularModel_4.endPoint = self.centerTop;
                [_cropGraphTwoPointArray addObject:circularModel_4];
        }break;
        case HinderRectangle:{
            HinderModel * anotherModel = [hinder createOtherModel];
            
            LineModel * model_1 = _cropGraphOnePointArray[1];
            model_1.endPoint = hinder.startPoint;
            
            [_cropGraphOnePointArray insertObject:({
                LineModel * model = [[LineModel alloc] init];
                model.startPoint = hinder.startPoint;
                model.endPoint = hinder.controlPoint;
                model;
            }) atIndex:2];
            
            [_cropGraphOnePointArray insertObject:({
                LineModel * model = [[LineModel alloc] init];
                model.startPoint = hinder.controlPoint;
                model.endPoint = hinder.controlPoint_2;
                model;
            }) atIndex:3];
            
            [_cropGraphOnePointArray insertObject:({
                LineModel * model = [[LineModel alloc] init];
                model.startPoint = hinder.controlPoint_2;
                model.endPoint = hinder.endPoint;
                model;
            }) atIndex:4];
            
            [_cropGraphOnePointArray insertObject:({
                LineModel * model = [[LineModel alloc] init];
                model.startPoint = hinder.endPoint;
                model.endPoint = self.centerBottom;
                model;
            }) atIndex:5];
            
            LineModel * model_2 = _cropGraphTwoPointArray[3];
            model_2.endPoint = anotherModel.endPoint;
            
            [_cropGraphTwoPointArray addObject:({
                LineModel * model = [[LineModel alloc] init];
                model.startPoint = anotherModel.endPoint;
                model.endPoint = anotherModel.controlPoint_2;
                model;
            })];
            
            [_cropGraphTwoPointArray addObject:({
                LineModel * model = [[LineModel alloc] init];
                model.startPoint = anotherModel.controlPoint_2;
                model.endPoint = anotherModel.controlPoint;
                model;
            })];
            
            [_cropGraphTwoPointArray addObject:({
                LineModel * model = [[LineModel alloc] init];
                model.startPoint = anotherModel.controlPoint;
                model.endPoint = anotherModel.startPoint;
                model;
            })];
            
            [_cropGraphTwoPointArray addObject:({
                LineModel * model = [[LineModel alloc] init];
                model.startPoint = anotherModel.startPoint;
                model.endPoint = self.centerTop;
                model;
            })];
            
            
        }break;
            
        default:
            break;
    }
}

- (void)configeArray{
    LineModel * model_1 = [[LineModel alloc] init];
    model_1.startPoint = self.apexOne;
    model_1.endPoint = self.centerTop;
    
    LineModel * model_2 = [[LineModel alloc] init];
    model_2.startPoint = self.centerTop;
    model_2.endPoint = self.centerBottom;
    
    LineModel * model_3 = [[LineModel alloc] init];
    model_3.startPoint = self.centerBottom;
    model_3.endPoint = self.apexFour;
    
    LineModel * model_4 = [[LineModel alloc] init];
    model_4.startPoint = self.apexFour;
    model_4.endPoint = self.apexOne;
    
    self.cropGraphOnePointArray = @[model_1,model_2,model_3,model_4];
    
    LineModel * model_5 = [[LineModel alloc] init];
    model_5.startPoint = self.centerTop;
    model_5.endPoint = self.apexTwo;
    
    LineModel * model_6 = [[LineModel alloc] init];
    model_6.startPoint = self.apexTwo;
    model_6.endPoint = self.apexThree;
    
    LineModel * model_7 = [[LineModel alloc] init];
    model_7.startPoint = self.apexThree;
    model_7.endPoint = self.centerBottom;
    
    LineModel * model_8 = [[LineModel alloc] init];
    model_8.startPoint = self.centerBottom;
    model_8.endPoint = self.centerTop;
    
    self.cropGraphTwoPointArray = @[model_5,model_6,model_7,model_8];
}

@end
