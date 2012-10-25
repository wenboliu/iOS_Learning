//
//  AppDelegate.h
//  SwipeDemo
//
//  Created by wenbo on 10/23/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeDemoView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow *window;
    SwipeDemoView *swipeDemoView;
}

@property (nonatomic, retain) UIWindow *window;

@end
