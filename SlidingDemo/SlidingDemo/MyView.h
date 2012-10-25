//
//  MyView.h
//  SlidingDemo
//
//  Created by wenbo on 10/24/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyViewDelegate <NSObject>

-(void)viewTouched;

@end

@interface MyView : UIView<MyViewDelegate>
{
    id<MyViewDelegate> delegate;
}

@property (nonatomic, retain) id<MyViewDelegate> delegate;

@end
