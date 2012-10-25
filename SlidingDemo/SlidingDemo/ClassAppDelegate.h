//
//  ClassAppDelegate.h
//  SlidingDemo
//
//  Created by wenbo on 10/24/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassViewController.h"

@interface ClassAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    ClassViewController *ctrl;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) ClassViewController *ctrl;

@end
