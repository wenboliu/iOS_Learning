//
//  ClassAppDelegate.m
//  SlidingDemo
//
//  Created by wenbo on 10/24/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "ClassAppDelegate.h"

@implementation ClassAppDelegate
@synthesize window, ctrl;

-(void)applicationDidFinishLaunching:(UIApplication *)application
{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.ctrl = [[ClassViewController alloc] init];
    [window addSubview:ctrl.view];
    [window makeKeyAndVisible];
}

@end
