//
//  ViewController.m
//  CAShapLayerBezierAnimation
//
//  Created by yangtong on 2018/11/13.
//  Copyright © 2018年 JJXT. All rights reserved.
//

#import "ViewController.h"
#import "ProgressBtn.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    UIButton *btn=[[UIButton alloc] init];
//
//    btn.frame=CGRectMake(100, 100, 60, 60);
    

    ProgressBtn *btn=[[ProgressBtn alloc] initWithFrame:CGRectMake(100, 100, 60, 60) yt_addRunProgressAnimationWith:CGSizeMake(60, 60) bottomColor:[UIColor lightGrayColor] progressColor:[UIColor redColor] time:6 btnTyle:BtnTyleTimes];
    [self.view addSubview:btn];
//    [self.view setBackgroundColor:[uic]]
    
}


@end
