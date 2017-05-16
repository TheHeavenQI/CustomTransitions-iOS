//
//  CustomTransitions.h
//  JiafaStaff
//
//  Created by Ztq on 2017/5/11.
//  Copyright © 2017年 jiafakeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZTQTransitionsType) {
    ZTQTransitionsTypeNone, // 默认无动画
    ZTQTransitionsTypeFromTopToBottom,
    ZTQTransitionsTypeFromBottomToTop,
    ZTQTransitionsTypeFromRightToLeft,
    ZTQTransitionsTypeFromLeftToRight,
    ZTQTransitionsTypeFading,
};

@interface CustomTransitions : NSObject <UIViewControllerAnimatedTransitioning>

- (void)customPushTransitionWithType:(ZTQTransitionsType)transionType;

@end

@interface CustomTransitionsPop : NSObject <UIViewControllerAnimatedTransitioning>

- (void)customPopTransitionWithType:(ZTQTransitionsType)transionType;

@end
