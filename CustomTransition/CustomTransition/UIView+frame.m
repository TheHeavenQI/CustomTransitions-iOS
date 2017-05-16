//
//  UIView+frame.m
//  CustomTransition
//
//  Created by Ztq on 2017/5/16.
//  Copyright © 2017年 ztq. All rights reserved.
//

#import "UIView+frame.h"
#import <objc/runtime.h>

@interface UIView ()

@property (assign, readwrite, nonatomic) CGFloat height;

@property (assign, readwrite, nonatomic) CGFloat width;

@end

@implementation UIView (frame)

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)height {
    return self.frame.size.height;
}

@end
