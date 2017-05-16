//
//  ViewController.m
//  CustomTransition
//
//  Created by Ztq on 2017/5/16.
//  Copyright © 2017年 ztq. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+randomType.h"
#import "SecondViewController.h"

@interface ViewController () <UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.delegate = self;
    [self push];
}

#pragma mark - private methods

- (void)push {
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0, 0, 100, 30);
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    button.center = CGPointMake(self.view.center.x, self.view.center.y);
    [button setTitle:@"push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushButtonEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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

- (void)pushButtonEvent {
    [self.navigationController pushViewController:[SecondViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
