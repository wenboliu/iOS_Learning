//
//  AppDelegate.m
//  SwipeDemo
//
//  Created by wenbo on 10/23/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window;

-(void)applicationDidFinishLaunching:(UIApplication *)application
{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    swipeDemoView = [[SwipeDemoView alloc] initWithFrame:frame];
    swipeDemoView.multipleTouchEnabled = true;
    [swipeDemoView setBackgroundColor:[UIColor whiteColor]];
    [window addSubview:swipeDemoView];
    [window makeKeyAndVisible];
}


@end
