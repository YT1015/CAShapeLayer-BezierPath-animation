//
//  ProgressBtn.h
//  CAShapLayerBezierAnimation
//
//  Created by 杨彤 on 2018/11/14.
//  Copyright © 2018年 JJXT. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,BtnTyle) {
    BtnTyleTimes,
    BtnTyleSkip
};
NS_ASSUME_NONNULL_BEGIN

@interface ProgressBtn : UIButton
@property (nonatomic,copy)void (^skipBlock) (void);
- (instancetype)initWithFrame:(CGRect)frame yt_addRunProgressAnimationWithBottomColor:(UIColor *)bottomColor progressColor:(UIColor *)progressColor time:(NSInteger)time btnTyle:(BtnTyle)tyle;
@end

NS_ASSUME_NONNULL_END
