//
//  SecondViewController.m
//  CustomTransition
//
//  Created by Ztq on 2017/5/16.
//  Copyright © 2017年 ztq. All rights reserved.
//

#import "SecondViewController.h"
#import "UIViewController+randomType.h"

@interface SecondViewController () <UINavigationControllerDelegate>

@property(nonatomic,strong) UIPercentDrivenInteractiveTransition *interactiveTransition;

@end

@implementation SecondViewController

#pragma mark - life cycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self navbar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationController.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:gestureRecognizer];
}

#pragma mark - private methods

- (void)navbar {
    
    if (self.navigationController.navigationBarHidden) {
        return;
    }
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0, 0, 60, 30);
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backButtonEvent) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self.navigationItem setLeftBarButtonItem:left];
}


#pragma mark - gesture

- (void)handlePan:(UIPanGestureRecognizer *)gestureRecognizer {
    /*
     *  此处逻辑为interactiveTransition活动范围为x正方向，-50<y<50，并且滑动距离大于1/3,否则不pop
     */
    CGFloat progress = [gestureRecognizer translationInView:self.view].x / self.view.bounds.size.width;
    progress = MIN(1.0,(MAX(0.0, progress)));
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        
        if ([gestureRecognizer translationInView:self.view].x>=0 && ([gestureRecognizer translationInView:self.view].y <= 50 || [gestureRecognizer translationInView:self.view].y <= -50)) {
            self.interactiveTransition = [UIPercentDrivenInteractiveTransition new];
            [self.navigationController popViewControllerAnimated:YES];
        }else {
            [self.interactiveTransition cancelInteractiveTransition];
            self.interactiveTransition = nil;
        }
    }else if (gestureRecognizer.state == UIGestureRecognizerStateEnded || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
        progress = [gestureRecognizer translationInView:self.view].x / self.view.bounds.size.width;
        if ([gestureRecognizer translationInView:self.view].x > 0 && ([gestureRecognizer translationInView:self.view].y <= 50 || [gestureRecognizer translationInView:self.view].y >= -50)) {
            if (progress > 1.0/3.0) {
                [self.interactiveTransition finishInteractiveTransition];
            }else {
                [self.interactiveTransition cancelInteractiveTransition];
            }
        }else {
            [self.interactiveTransition cancelInteractiveTransition];
        }
        self.interactiveTransition = nil;
    }else if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        if([gestureRecognizer translationInView:self.view].y > 50 || [gestureRecognizer translationInView:self.view].y < -50) {
            [self.interactiveTransition cancelInteractiveTransition];
            self.interactiveTransition = nil;
            return;
        }
        if([gestureRecognizer translationInView:self.view].x ==0) {
            [self.interactiveTransition updateInteractiveTransition:0.01];
        }else {
            [self.interactiveTransition updateInteractiveTransition:progress];
        }
    }
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

//为这个动画添加用户交互
- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    return self.interactiveTransition;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if(operation==UINavigationControllerOperationPush) {
        
        CustomTransitions *custom = [CustomTransitions new];
        [custom customPushTransitionWithType:[self randomPushOrPop]];
        return custom;
        
    }else if (operation == UINavigationControllerOperationPop) {
        CustomTransitionsPop *custom = [CustomTransitionsPop new];
        [custom customPopTransitionWithType:[self randomPushOrPop]];
        return custom;
    } else {
        return nil;
    }
}

#pragma mark - event

- (void)backButtonEvent {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
