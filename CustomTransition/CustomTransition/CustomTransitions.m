//
//  CustomTransitions.m
//  JiafaStaff
//
//  Created by Ztq on 2017/5/11.
//  Copyright © 2017年 jiafakeji. All rights reserved.
//

#import "CustomTransitions.h"
#import "UIView+frame.h"

#define ZTQTransionTime 0.5

@interface CustomTransitions ()

@property (nonatomic,strong)id<UIViewControllerContextTransitioning> transitionContext;

@property (assign, nonatomic) ZTQTransitionsType customType;

@property (strong, nonatomic) UIView *fromView;

@property (strong, nonatomic) UIView *toView;

@property (strong, nonatomic) UIView *containerView;

@end

@implementation CustomTransitions

#pragma mark - private methods

- (void)transiton:(ZTQTransitionsType)type {
    switch (type) {
        case ZTQTransitionsTypeNone:
            [self transitionsTypeNone];
            break;
        case ZTQTransitionsTypeFading:
            [self transitionsTypeFading];
            break;
        case ZTQTransitionsTypeFromBottomToTop:
            [self transitionsTypeFromBottomToTop];
            break;
        case ZTQTransitionsTypeFromLeftToRight:
            [self transitionsTypeFromLeftToRight];
            break;
        case ZTQTransitionsTypeFromRightToLeft:
            [self transitionsTypeFromRightToLeft];
            break;
        case ZTQTransitionsTypeFromTopToBottom:
            [self transitionsTypeFromTopToBottom];
            break;
        default:
            break;
    }
}

- (void)transitionsTypeNone {
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    if ([self.transitionContext transitionWasCancelled]) {
        //失败后，我们要把vc1显示出来
    }
}

- (void)transitionsTypeFading {
    self.toView.alpha = 0.0;
    [UIView animateWithDuration:ZTQTransionTime animations:^{
        self.fromView.alpha = 0.0;
        self.toView.alpha = 1.0;
    } completion:^(BOOL finished) {
        [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
        if ([self.transitionContext transitionWasCancelled]) {
            //失败后，我们要把vc1显示出来
            self.fromView.alpha = 1;
        }
    }];
}

- (void)transitionsTypeFromBottomToTop {
    
    self.toView.frame = CGRectMake(0, self.containerView.height, self.containerView.width, self.containerView.height);
    [UIView animateWithDuration:ZTQTransionTime animations:^{
        self.fromView.frame = CGRectMake(0, -self.containerView.height, self.containerView.width, self.containerView.height);
        self.toView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
    } completion:^(BOOL finished) {
        
        [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
        if ([self.transitionContext transitionWasCancelled]) {
            //失败后，我们要把vc1显示出来
            self.fromView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
            self.toView.frame = CGRectMake(0, self.containerView.height, self.containerView.width, self.containerView.height);
        }
    }];
    
}

- (void)transitionsTypeFromLeftToRight {
    self.toView.frame = CGRectMake(-self.containerView.width, 0, self.containerView.width, self.containerView.height);
    [UIView animateWithDuration:ZTQTransionTime animations:^{
        self.fromView.frame = CGRectMake(self.containerView.width, 0, self.containerView.width, self.containerView.height);
        self.toView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
    } completion:^(BOOL finished) {
        
        [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
        if ([self.transitionContext transitionWasCancelled]) {
            //失败后，我们要把vc1显示出来
            self.toView.frame = CGRectMake(-self.containerView.width, 0, self.containerView.width, self.containerView.height);
            self.fromView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
        }
    }];
}

- (void)transitionsTypeFromRightToLeft {
    self.toView.frame = CGRectMake(self.containerView.width, 0, self.containerView.width, self.containerView.height);
    [UIView animateWithDuration:ZTQTransionTime animations:^{
        self.fromView.frame = CGRectMake(-self.containerView.width, 0, self.containerView.width, self.containerView.height);
        self.toView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
    } completion:^(BOOL finished) {
        
        [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
        if ([self.transitionContext transitionWasCancelled]) {
            //失败后，我们要把vc1显示出来
            self.toView.frame = CGRectMake(self.containerView.width, 0, self.containerView.width, self.containerView.height);
            self.fromView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
        }
    }];
}

- (void)transitionsTypeFromTopToBottom {
    
    self.toView.frame = CGRectMake(0, -self.containerView.height, self.containerView.width, self.containerView.height);
    [UIView animateWithDuration:ZTQTransionTime animations:^{
        self.fromView.frame = CGRectMake(0, self.containerView.height, self.containerView.width, self.containerView.height);
        self.toView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
    } completion:^(BOOL finished) {
        
        [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
        if ([self.transitionContext transitionWasCancelled]) {
            //失败后，我们要把vc1显示出来
            self.fromView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
            self.toView.frame = CGRectMake(0, -self.containerView.height, self.containerView.width, self.containerView.height);
        }
    }];
    
}

#pragma mark - public methods

- (void)customPushTransitionWithType:(ZTQTransitionsType)transionType {
    self.customType = transionType;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return ZTQTransionTime;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    self.transitionContext = transitionContext;
    
    self.fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    self.toView = [transitionContext viewForKey:UITransitionContextToViewKey];

    UIView *containerView = [transitionContext containerView];
    self.containerView = containerView;
    [containerView addSubview:self.fromView];
    [containerView addSubview:self.toView];
    
    [self transiton:self.customType];
    
}

#pragma mark - getter

- (ZTQTransitionsType)customType {
    if (!_customType) {
        _customType = ZTQTransitionsTypeNone;
    }
    return _customType;
}

@end

@interface CustomTransitionsPop ()

@property (nonatomic,strong)id<UIViewControllerContextTransitioning> transitionContext;

@property (assign, nonatomic) ZTQTransitionsType customType;

@property (strong, nonatomic) UIView *containerView;

@property (strong, nonatomic) UIView *fromView;

@property (strong, nonatomic) UIView *toView;

@end

@implementation CustomTransitionsPop

#pragma mark - private methods

- (void)transiton:(ZTQTransitionsType)type {
    switch (type) {
        case ZTQTransitionsTypeNone:
            [self transitionsTypeNone];
            break;
        case ZTQTransitionsTypeFading:
            [self transitionsTypeFading];
            break;
        case ZTQTransitionsTypeFromBottomToTop:
            [self transitionsTypeFromBottomToTop];
            break;
        case ZTQTransitionsTypeFromLeftToRight:
            [self transitionsTypeFromLeftToRight];
            break;
        case ZTQTransitionsTypeFromRightToLeft:
            [self transitionsTypeFromRightToLeft];
            break;
        case ZTQTransitionsTypeFromTopToBottom:
            [self transitionsTypeFromTopToBottom];
            break;
        default:
            break;
    }
}

- (void)transitionsTypeNone {
    [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    if ([self.transitionContext transitionWasCancelled]) {
        //失败后，我们要把vc1显示出来
    }
}

- (void)transitionsTypeFading {
    self.toView.alpha = 0.0;
    [UIView animateWithDuration:ZTQTransionTime animations:^{
        self.fromView.alpha = 0.0;
        self.toView.alpha = 1.0;
    } completion:^(BOOL finished) {
        [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
        if ([self.transitionContext transitionWasCancelled]) {
            //失败后，我们要把vc1显示出来
            self.fromView.alpha = 1;
        }
    }];
}

- (void)transitionsTypeFromBottomToTop {
    
    self.toView.frame = CGRectMake(0, self.containerView.height, self.containerView.width, self.containerView.height);
    [UIView animateWithDuration:ZTQTransionTime animations:^{
        self.fromView.frame = CGRectMake(0, -self.containerView.height, self.containerView.width, self.containerView.height);
        self.toView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
    } completion:^(BOOL finished) {
        
        [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
        if ([self.transitionContext transitionWasCancelled]) {
            //失败后，我们要把vc1显示出来
            self.fromView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
            self.toView.frame = CGRectMake(0, self.containerView.height, self.containerView.width, self.containerView.height);
        }
    }];
}

- (void)transitionsTypeFromLeftToRight {
    self.toView.frame = CGRectMake(-self.containerView.width, 0, self.containerView.width, self.containerView.height);
    [UIView animateWithDuration:ZTQTransionTime animations:^{
        self.fromView.frame = CGRectMake(self.containerView.width, 0, self.containerView.width, self.containerView.height);
        self.toView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
    } completion:^(BOOL finished) {
        
        [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
        if ([self.transitionContext transitionWasCancelled]) {
            //失败后，我们要把vc1显示出来
            self.fromView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
            self.toView.frame = CGRectMake(-self.containerView.width, 0, self.containerView.width, self.containerView.height);
        }
    }];
}

- (void)transitionsTypeFromRightToLeft {
    self.toView.frame = CGRectMake(self.containerView.width, 0, self.containerView.width, self.containerView.height);
    [UIView animateWithDuration:ZTQTransionTime animations:^{
        self.fromView.frame = CGRectMake(-self.containerView.width, 0, self.containerView.width, self.containerView.height);
        self.toView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
    } completion:^(BOOL finished) {
        
        [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
        if ([self.transitionContext transitionWasCancelled]) {
            //失败后，我们要把vc1显示出来
            self.fromView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
            self.toView.frame = CGRectMake(self.containerView.width, 0, self.containerView.width, self.containerView.height);
        }
    }];
}

- (void)transitionsTypeFromTopToBottom {
    self.toView.frame = CGRectMake(0, -self.containerView.height, self.containerView.width, self.containerView.height);
    [UIView animateWithDuration:ZTQTransionTime animations:^{
        self.fromView.frame = CGRectMake(0, self.containerView.height, self.containerView.width, self.containerView.height);
        self.toView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
    } completion:^(BOOL finished) {
        
        [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
        if ([self.transitionContext transitionWasCancelled]) {
            //失败后，我们要把vc1显示出来
            self.fromView.frame = CGRectMake(0, 0, self.containerView.width, self.containerView.height);
            self.toView.frame = CGRectMake(0, -self.containerView.height, self.containerView.width, self.containerView.height);
        }
    }];
    
}

#pragma mark - public methods

- (void)customPopTransitionWithType:(ZTQTransitionsType)transionType {
    self.customType = transionType;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return ZTQTransionTime;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    self.transitionContext = transitionContext;
    self.fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    self.toView = [transitionContext viewForKey:UITransitionContextToViewKey];

    
    UIView *containerView = [transitionContext containerView];
    self.containerView = containerView;
    self.fromView.frame = CGRectMake(0, 0, containerView.width, containerView.height);
    self.toView.frame = CGRectMake(0, 0, containerView.width, containerView.height);
    [containerView addSubview:self.toView];
    
    [self transiton:self.customType];
    
}

#pragma mark - getter

- (ZTQTransitionsType)customType {
    if (!_customType) {
        _customType = ZTQTransitionsTypeNone;
    }
    return _customType;
}

@end
