//
//  ClassAppDelegate.h
//  ResponderDemo
//
//  Created by wenbo on 10/23/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResponderDemoView.h"

@interface ClassAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    ResponderDemoView *myview;
}

@property (strong, nonatomic) UIWindow *window;

@end
