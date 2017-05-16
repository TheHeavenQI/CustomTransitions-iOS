//
//  UIViewController+randomType.m
//  CustomTransition
//
//  Created by Ztq on 2017/5/16.
//  Copyright © 2017年 ztq. All rights reserved.
//

#import "UIViewController+randomType.h"

@implementation UIViewController (randomType)

- (ZTQTransitionsType)randomPushOrPop {
    ZTQTransitionsType type;
    NSInteger randomNumber = 0;
    randomNumber = arc4random() % 6;
    NSLog(@"%ld", (long)randomNumber);
    switch (randomNumber) {
        case 0:
            type = ZTQTransitionsTypeNone;
            break;
        case 1:
            type = ZTQTransitionsTypeFromTopToBottom;
            break;
        case 2:
            type = ZTQTransitionsTypeFromBottomToTop;
            break;
        case 3:
            type = ZTQTransitionsTypeFromRightToLeft;
            break;
        case 4:
            type = ZTQTransitionsTypeFromLeftToRight;
            break;
        case 5:
            type = ZTQTransitionsTypeFading;
            break;
        default:
            type = ZTQTransitionsTypeNone;
            break;
    }
    
    return type;
}

@end
