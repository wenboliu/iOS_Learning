//
//  ResponderDemoView.m
//  ResponderDemo
//
//  Created by wenbo on 10/23/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "ResponderDemoView.h"

#define MAX_ELAPSED_TIME 2

typedef enum
{
    S0,
    S1,
    S2
}
STATE;

@interface ResponderDemoView()
{
    STATE state;
    float movedTogether, movedSeperate;
    float accDistance;
    CGPoint firstTouchLocInView;
    NSTimeInterval firstTouchTimeStamp;
}

@end

@implementation ResponderDemoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        state = S0;
        movedSeperate = movedTogether = 0;
        accDistance = 0;
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    int noTouchBegan = touches.count;
    int noTouchCount = [event allTouches].count;
    NSLog(@"Began %i total %i", noTouchBegan, noTouchCount);
    if (noTouchBegan == 2 && noTouchCount == 2) {
        state = S1;
        movedTogether = 1;
        movedSeperate = 0;
        NSArray *touchArray = [touches allObjects];
        accDistance = distance([[touchArray objectAtIndex:0] locationInView:self],
                               [[touchArray objectAtIndex:1] locationInView:self]);
    } else if (state != S2 && noTouchBegan == 1 && noTouchCount == 1)
    {
        state = S2;
        UITouch *touch = [touches anyObject];
        firstTouchLocInView = [touch locationInView:self];
        firstTouchTimeStamp = [touch timestamp];
    } else if (state == S2 && noTouchBegan == 1 && noTouchCount == 1)
    {
        UITouch *touch = [touches anyObject];
        if(touch.timestamp - firstTouchTimeStamp <= MAX_ELAPSED_TIME)
        {
            state = S1;
            movedTogether = 1;
            movedSeperate = 0;
            accDistance = distance(firstTouchLocInView, [touch locationInView:self]);
        } else
        {
            firstTouchLocInView = [touch locationInView:self];
            firstTouchTimeStamp = [touch timestamp];
        }
    } else
    {
        state = S0;
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"moved %i %i", touches.count,((NSSet*)[event allTouches]).count);
    NSArray *allTouches = [touches allObjects];
    if((state == S1) && ([touches count] == 2) ){
        movedTogether++;
        accDistance +=
        distance([[allTouches objectAtIndex:0] locationInView:self], [[allTouches objectAtIndex:1] locationInView:self]);
    }else if((state == S1) && ([touches count] == 1))
    {
        movedSeperate++;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"ended %i %i",touches.count,((NSSet*)[event allTouches]).count);
    if((state == S1) && ([touches count] == 2))
    {
        NSLog(@"started together and ended together," "moved together %.0f%% "
          "of the time. AVG distance:%4.2f", (movedSeperate+movedTogether) ? 100*(movedTogether/(movedTogether+movedSeperate)) : 100.0, movedTogether ? accDistance/movedTogether : 0.0);
        [self setNeedsDisplay];
    }
    state = S0;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
	state = S0;
	movedTogether = movedSeperate = 0;
	accDistance =0;
}

float distance(CGPoint point1, CGPoint point2)
{
    return sqrt(pow(point1.x-point2.x, 2) + pow(point1.y - point2.y, 2));
}


- (void)drawRect:(CGRect)rect
{
    NSString *message =
    [NSString stringWithFormat:@"Moved together %.0f%% of the time.",
     (movedSeperate+movedTogether) ?
     100*(movedTogether/(movedTogether+movedSeperate)) : 100.0];
    [message drawAtPoint:CGPointMake(10,100)
                withFont:[UIFont systemFontOfSize:16]];
    message =
    [NSString stringWithFormat:@"Average distance:%4.2f.",
     movedTogether ? accDistance/movedTogether : 0.0]; [message drawAtPoint:CGPointMake(10,150)
                                                                   withFont:[UIFont systemFontOfSize:16]];
}


@end
