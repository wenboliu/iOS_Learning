//
//  pri_wenboAppDelegate.m
//  singleView
//
//  Created by wenbo on 10/21/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "pri_wenboAppDelegate.h"

@implementation pri_wenboAppDelegate

@synthesize window,view;

-(void)applicationDidFinishLaunching:(UIApplication *)application
{
    CGRect frame = [UIScreen  mainScreen].applicationFrame;
    window = [[UIWindow alloc] initWithFrame:frame];
//	CGRect frame = CGRectMake(50, 100, 150, 200);
    view = [[ViewOne alloc] initWithFrame:frame];
    
    [view setBackgroundColor:[UIColor blackColor]];
    
    int x = 0 ;
    int y = view.bounds.size.height/3;
    
    
    [@"Hello world!" drawAtPoint:CGPointMake(50+x, 100+y) withFont:[UIFont systemFontOfSize:40]];
    
	[window addSubview:view];
    [window makeKeyAndVisible];
}

@end
