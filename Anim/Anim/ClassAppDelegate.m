//
//  ClassAppDelegate.m
//  Anim
//
//  Created by wenbo on 10/24/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "ClassAppDelegate.h"

@implementation ClassAppDelegate
@synthesize window;

-(void)applicationDidFinishLaunching:(UIApplication *)application
{
    window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    myview = [[AnimView alloc] initWithFrame:frame];
    [myview setBackgroundColor:[UIColor grayColor]];
    [window addSubview:myview];
    [window makeKeyAndVisible];
}

@end
