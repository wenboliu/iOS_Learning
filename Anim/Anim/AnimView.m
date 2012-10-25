//
//  AnimView.m
//  Anim
//
//  Created by wenbo on 10/24/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "AnimView.h"
#import <QuartzCore/QuartzCore.h>

@interface AnimView()
{
    UIView *childView;
}

@end

@implementation AnimView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        childView = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 100, 150)];
        [childView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:childView];
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([[touches anyObject] tapCount] == 2) {
        UITouch *touch = [touches anyObject];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDuration:1];
        childView.center = [touch locationInView:self];
        
        [UIView setAnimationDelegate:self];
        childView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        [UIView commitAnimations];
    }
}

// subsection 2
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
	childView.transform = CGAffineTransformIdentity;
	childView.backgroundColor = [UIColor whiteColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
