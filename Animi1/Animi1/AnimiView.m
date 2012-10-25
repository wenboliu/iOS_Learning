//
//  AnimiView.m
//  Animi1
//
//  Created by wenbo on 10/24/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "AnimiView.h"
#import <QuartzCore/QuartzCore.h>

@implementation AnimiView
@synthesize message;

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([[touches anyObject] tapCount] == 2) {
		[[UIApplication sharedApplication].delegate	performSelector:@selector(showOtherView:) withObject:self];
    }
}


- (void)drawRect:(CGRect)rect
{
    [message drawAtPoint:CGPointMake(100,100) withFont:[UIFont systemFontOfSize:16]];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5.0);
    CGContextMoveToPoint(context, 50, 100);
    CGContextAddLineToPoint(context, 200, 100);
    CGContextStrokePath(context);
    
    CGContextAddEllipseInRect(context, CGRectMake(70.0, 170.0, 50.0, 50.0));
    CGContextStrokePath(context);
    
    CGContextAddEllipseInRect(context, CGRectMake(150.0, 170.0, 50.0, 50.0));
    CGContextFillPath(context);
    
    CGContextSetRGBStrokeColor(context, 0.0, 1.0, 0.0, 1.0);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
    
    CGContextAddRect(context,CGRectMake(30.0, 30.0, 60.0, 60.0));
    CGContextFillPath(context);
    
    CGContextAddArc(context,260, 90, 40, 0.0*M_PI/180, 270*M_PI/180, 1);
    CGContextAddLineToPoint(context, 280, 350);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 130, 300);
    CGContextAddLineToPoint(context, 80, 400);
    CGContextAddLineToPoint(context, 190, 400);
    CGContextAddLineToPoint(context, 130, 300);
    CGContextStrokePath(context);
}


@end
