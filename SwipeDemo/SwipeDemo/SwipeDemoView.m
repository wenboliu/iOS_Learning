//
//  SwipeDemoView.m
//  SwipeDemo
//
//  Created by wenbo on 10/23/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "SwipeDemoView.h"

#define Y_TOLERANCE 20
#define X_TOLERANCE 100

typedef enum {
    S0,
    S1
} STATE;

@interface SwipeDemoView () {
    CGPoint startLocation, endLocation;
    NSTimeInterval startTime, endTime;
    STATE state;
    UIView *childView;
}
@end

@implementation SwipeDemoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        childView = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 100, 150)];
        [childView setBackgroundColor:[UIColor grayColor]];
        [self addSubview:childView];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    int noTouchBegan = touches.count;
    int noTouchCount = [[event allTouches] count];
    NSLog(@"touch began %i, touch count %i", noTouchBegan, noTouchCount);
    if (state == S0 && noTouchBegan == 1 && noTouchCount == 1)
    {
        startLocation = [[touches anyObject] locationInView:self];
        startTime = [[touches anyObject] timestamp];
        state = S1;
    }
    else
    {
        state = S0;
        [self setNeedsDisplay];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    int noTouchBegan = touches.count;
    int noTouchCount = [[event allTouches] count];
    NSLog(@"touch ended %i, touch count %i", noTouchBegan, noTouchCount);
    if (state == S1 && noTouchBegan == 1 && noTouchCount == 1)
    {
        endLocation = [[touches anyObject] locationInView:self];
        endTime = [[touches anyObject] timestamp];
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
    NSString *message;
    if (state == S0) {
        [@"\t\t\t\t\t\t\t\t\t\t" drawAtPoint:CGPointMake(10, 100) withFont:[UIFont systemFontOfSize:16]];
        [@"\t\t\t\t\t\t\t\t\t\t" drawAtPoint:CGPointMake(10, 150) withFont:[UIFont systemFontOfSize:16]];
        [@"\t\t\t\t\t\t\t\t\t\t" drawAtPoint:CGPointMake(10, 200) withFont:[UIFont systemFontOfSize:16]];
    }
    if (state == S1) {
        message = [NSString stringWithFormat:@"Started %.0f, %.0f, ended %.0f, %.0f", startLocation.x, startLocation.y, endLocation.x, endLocation.y];
        [message drawAtPoint:CGPointMake(10, 100) withFont:[UIFont systemFontOfSize:16]];
        message = [NSString stringWithFormat:@"Took %4.3f seconds", endTime-startTime];
        [message drawAtPoint:CGPointMake(10, 150) withFont:[UIFont systemFontOfSize:16]];
        if (fabs(startLocation.y - endLocation.y) <= X_TOLERANCE &&
            fabs(startLocation.x - endLocation.x) <= Y_TOLERANCE) {
            char *direction;
            direction = (endLocation.x > startLocation.x)? "right" : "left";
            message = [NSString stringWithFormat:@"Perfect %s swipe, speed:%4.3f pts/s", direction, (endTime-startTime)>0?(fabs(endLocation.x - startLocation.x))/(endTime - startTime) : 0];
            [message drawAtPoint:CGPointMake(10, 200) withFont:[UIFont systemFontOfSize:16]];
            

        } else {
            [@"\t\t\t\t\t\t\t\t\t\t" drawAtPoint:CGPointMake(10, 200) withFont:[UIFont systemFontOfSize:16]];
            state = S0;
        }

        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:2];
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self cache:true];
        [UIView commitAnimations];
    }
}


@end
