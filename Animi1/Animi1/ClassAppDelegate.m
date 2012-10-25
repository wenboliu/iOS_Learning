//
//  ClassAppDelegate.m
//  Animi1
//
//  Created by wenbo on 10/24/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "ClassAppDelegate.h"
#import	<QuartzCore/QuartzCore.h>
#import "AnimiView.h"

@implementation ClassAppDelegate
@synthesize window;

-(void)applicationDidFinishLaunching:(UIApplication *)application
{
    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    viewOne = [[AnimiView alloc] initWithFrame:frame];
    viewOne.message = @"View 1";
    viewOne.backgroundColor = [UIColor whiteColor];
    
    viewTwo = [[AnimiView alloc] initWithFrame:frame];
    viewTwo.message = @"View 2";
    viewTwo.backgroundColor = [UIColor yellowColor];
    [window addSubview:viewOne];
    [window makeKeyAndVisible];
}

-(void)showOtherView:(UIView*)oldView
{
    if (oldView == viewOne) {
        [viewOne removeFromSuperview];
        [window addSubview:viewTwo];
    } else {
        [viewTwo removeFromSuperview];
        [window addSubview:viewOne];
    }
    
    CATransition *transition = [CATransition animation];
    [transition setType:kCATransitionMoveIn];
    [transition setSubtype:kCATransitionFromRight];
    [transition setDuration:1];
    [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[window layer] addAnimation:transition forKey:@"mykey"];
}

@end
