//
//  pri_wenboAppDelegate.h
//  singleView
//
//  Created by wenbo on 10/21/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewOne.h"

@interface pri_wenboAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    ViewOne *view;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewOne *view;

@end
