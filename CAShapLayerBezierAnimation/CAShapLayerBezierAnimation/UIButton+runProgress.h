//
//  UIButton+runProgress.h
//  CAShapLayerBezierAnimation
//
//  Created by 杨彤 on 2018/11/13.
//  Copyright © 2018年 JJXT. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,BtnTyle) {
    BtnTyleTimes,
    BtnTyleSkip
};
NS_ASSUME_NONNULL_BEGIN

@interface UIButton (runProgress)
//@property (nonatomic,strong) dispatch_source_t times;
- (void)yt_addRunProgressAnimationWith:(CGSize)btnSize bottomColor:(UIColor *)bottomColor progressColor:(UIColor *)progressColor time:(CGFloat)time btnTyle:(BtnTyle)tyle;
@end

NS_ASSUME_NONNULL_END
