//
//  ViewOne.m
//  singleView
//
//  Created by wenbo on 10/23/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "ViewOne.h"

@implementation ViewOne

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        NSLog(@"B: touch: %@", touch);
    }
    NSLog(@"B: event: %@", event);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        NSLog(@"M: touch: %@", touch);
    }
    NSLog(@"M: event: %@", event);
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        NSLog(@"E: touch: %@", touch);
    }
    NSLog(@"E: event: %@", event);
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        NSLog(@"C: touch: %@", touch);
    }
    NSLog(@"C: event: %@", event);
}

@end
