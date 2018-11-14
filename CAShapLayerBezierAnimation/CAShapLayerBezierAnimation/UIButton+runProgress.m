//
//  UIButton+runProgress.m
//  CAShapLayerBezierAnimation
//
//  Created by 杨彤 on 2018/11/13.
//  Copyright © 2018年 JJXT. All rights reserved.
//

#import "UIButton+runProgress.h"
//#define   queue dispatch_get_global_queue(0, 0)
//#define  times dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue)
//@interface UIButton (){
//    dispatch_source_t _times;
//}
//@end
@implementation UIButton (runProgress)
- (void)yt_addRunProgressAnimationWith:(CGSize)btnSize bottomColor:(UIColor *)bottomColor progressColor:(UIColor *)progressColor time:(NSInteger)time btnTyle:(BtnTyle)tyle{
//    [self setBackgroundColor:[UIColor greenColor]];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.titleLabel setFont:[UIFont systemFontOfSize:14]];
    self.layer.cornerRadius=btnSize.width/2.0;
    self.layer.masksToBounds=YES;
    //设置底层的layer
    CAShapeLayer *bottomLayer=[[CAShapeLayer alloc] init];
    
    bottomLayer.strokeColor=bottomColor.CGColor;
    
    bottomLayer.fillColor=[UIColor clearColor].CGColor;
    
    bottomLayer.lineWidth=10.f;
    
    //绘制底层layer的路径
    UIBezierPath *bottomPath=[UIBezierPath bezierPath];
    
    [bottomPath addArcWithCenter:CGPointMake(btnSize.width/2.0, btnSize.height/2.0) radius:btnSize.width/2.0 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    bottomLayer.path=bottomPath.CGPath;
    
    [self.layer addSublayer:bottomLayer];
    
    //进度条的Layer
    CAShapeLayer *progressLayer=[[CAShapeLayer alloc] init];
    
    progressLayer.strokeColor=progressColor.CGColor;
    
    progressLayer.fillColor=[UIColor clearColor].CGColor;
    
    progressLayer.lineWidth=10.f;
 
    //绘制底层layer的路径
    UIBezierPath * progressPath=[UIBezierPath bezierPath];
    
    [progressPath addArcWithCenter:CGPointMake(btnSize.width/2.0, btnSize.height/2.0) radius:btnSize.width/2.0 startAngle:-M_PI/2 endAngle:M_PI*3/2.0 clockwise:YES];
    
    progressLayer.path=progressPath.CGPath;
    
    [self.layer addSublayer:progressLayer];
    
    [progressLayer addAnimation:[self layerAnimationWith:time] forKey:@"progressAnimation"];
    
    if (tyle==BtnTyleTimes) {//倒计时
        __block NSInteger total=time;
        dispatch_queue_t queue=dispatch_get_global_queue(0, 0);
        dispatch_source_t times=dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(times, DISPATCH_TIME_NOW, 1*NSEC_PER_SEC, 0);
//        __strong typeof(times) stroTimes=times;
        dispatch_source_set_event_handler(times, ^{
            if (total<=0) {
                dispatch_source_cancel(times);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self setTitle:@"跳过" forState:UIControlStateNormal];
                });
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self setTitle:[NSString stringWithFormat:@"%lds",total] forState:UIControlStateNormal];
                    total--;
                });
            }
        });
        dispatch_resume(times);
    }else{//跳过
        [self setTitle:@"跳过" forState:UIControlStateNormal];
    }
    
}

- (CABasicAnimation *)layerAnimationWith:(CGFloat)time{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    animation.fromValue=[NSNumber numberWithFloat:0];
    
    animation.toValue=[NSNumber numberWithFloat:1];
    
    animation.duration=time;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.removedOnCompletion=NO;
    
    return animation;
}

@end
