//
//  ClassAppDelegate.h
//  Animi1
//
//  Created by wenbo on 10/24/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//
#import <UIKit/UIKit.h>

@class AnimiView;
@interface ClassAppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    AnimiView *viewOne, *viewTwo;
}

-(void)showOtherView:(UIView*) oldView;

@end
