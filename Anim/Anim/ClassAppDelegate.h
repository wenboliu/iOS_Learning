//
//  ClassAppDelegate.h
//  Anim
//
//  Created by wenbo on 10/24/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimView.h"

@interface ClassAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    AnimView *myview;
}

@property (strong, nonatomic) UIWindow *window;

@end
