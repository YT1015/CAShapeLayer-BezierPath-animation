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
    ProgressBtn *btn=[[ProgressBtn alloc] initWithFrame:CGRectMake(100, 100, 50, 50) yt_addRunProgressAnimationWithBottomColor:[UIColor lightGrayColor] progressColor:[UIColor redColor] time:6 btnTyle:BtnTyleTimes];
    [self.view addSubview:btn];
    
    [btn setSkipBlock:^{
        NSLog(@"跳过");
    }];
    
}


@end
