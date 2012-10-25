//
//  ClassViewController.h
//  SlidingDemo
//
//  Created by wenbo on 10/24/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"

typedef enum {
    UP,
    DOWN
}
Direction;

@interface ClassViewController : UIViewController<MyViewDelegate>
{
    MyView *slidingView;
}

@property(nonatomic, retain) MyView *slidingView;


@end
