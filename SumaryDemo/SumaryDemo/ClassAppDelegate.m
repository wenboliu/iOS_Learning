//
//  ClassAppDelegate.m
//  SumaryDemo
//
//  Created by wenbo on 10/25/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "ClassAppDelegate.h"
#import "SummaryView.h"
#import "MiniItem.h"

@implementation ClassAppDelegate
@synthesize window;

-(void)applicationDidFinishLaunching:(UIApplication *)application
{
    SummaryView *summaryView = [[SummaryView alloc] initWithFrame:CGRectMake(10, 120, 300, 50) xOffset:0.0 andContent:[NSArray arrayWithObject:[MiniItem itemWithText:[NSString stringWithFormat:@"%d comments", 52] andImage:[UIImage imageNamed:@"comment.png"]]]];
    [window  addSubview:summaryView];
    
    summaryView = [[SummaryView alloc] initWithFrame:CGRectMake(10, 220, 300, 50) xOffset:0.0 andContent:[NSArray arrayWithObject:[MiniItem itemWithText:@""]]];
    [summaryView setContent:
     [NSArray arrayWithObjects:
      [MiniItem itemWithText:[NSString stringWithFormat:@"%d flags", 4] andImage:[UIImage imageNamed:@"flag.png"]],
      [MiniItem itemWithText:[NSString stringWithFormat:@"%d alert", 1] andImage:[UIImage imageNamed:@"alert.png"]],
      [MiniItem itemWithText:[NSString stringWithFormat:@"%d bookmarks", 23] andImage:[UIImage imageNamed:@"favourites.png"]], nil]];
    [window  addSubview:summaryView];
    [window  makeKeyAndVisible];
}

@end
