//
//  ViewController.m
//  CAShapLayerBezierAnimation
//
//  Created by yangtong on 2018/11/13.
//  Copyright © 2018年 JJXT. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+runProgress.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame=CGRectMake(100, 100, 60, 60);
    
    [self.view addSubview:btn];
    
    [btn yt_addRunProgressAnimationWith:CGSizeMake(60, 60) bottomColor:[UIColor lightGrayColor] progressColor:[UIColor redColor] time:6 btnTyle:BtnTyleTimes];
//    [self.view setBackgroundColor:[uic]]
    
}


@end
