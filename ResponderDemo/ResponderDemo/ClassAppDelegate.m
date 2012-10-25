//
//  ClassAppDelegate.m
//  ResponderDemo
//
//  Created by wenbo on 10/23/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "ClassAppDelegate.h"

@implementation ClassAppDelegate
@synthesize window;

-(void)applicationDidFinishLaunching:(UIApplication *)application
{
    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    myview = [[ResponderDemoView alloc] initWithFrame:frame];
    myview.multipleTouchEnabled = true;
    [myview setBackgroundColor:[UIColor whiteColor]];
    [window addSubview:myview];
    [window makeKeyAndVisible];
}

@end
