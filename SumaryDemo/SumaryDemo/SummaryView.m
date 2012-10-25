//
//  SummaryView.m
//  SumaryDemo
//
//  Created by wenbo on 10/25/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "SummaryView.h"
#import "MiniItem.h"

static  UIFont      *textFont;
#define SPACING     16
static  float       BKG_COLOR[] = {0xee/255.0, 0xee/255.0, 0xf5/255.0, 1.0};


@interface InnerView : UIView{
    NSArray *content;
    BOOL selected;
    CGFloat offset;
    CGRect originalFrame;
}
@property (assign) BOOL selected;
@property (nonatomic, retain) NSArray *content;
@property (assign) CGFloat offset;
@property (assign) CGRect originalFrame;

- (id) initWithFrame:(CGRect)frame xOffset:(CGFloat)offset andContent:(NSArray*)ct;
- (void) layout;

@end

@implementation InnerView
@dynamic content, selected;

- (NSArray*)content{
    return content;
}

- (void) setContent:(NSArray *)cnt{
    if (content != cnt) {
        content = cnt;
        [self layout];
        [self setNeedsDisplay];
    }
}


- (void) setSelected:(BOOL)sel{
    selected = sel;
    [self setNeedsDisplay];
}

- (BOOL) selected{
    return selected;
}


- (id) initWithFrame:(CGRect)frame xOffset:(CGFloat)xOffset andContent:(NSArray*)ct{
    if (self = [super initWithFrame:frame]) {
        self.content = ct;
        self.offset = xOffset;
        self.originalFrame = frame;
        self.backgroundColor = [UIColor clearColor];
        [self layout];
    }
    return self;
}

- (void) layout{
    CGFloat totalMw = 0.0;
    for (MiniItem *e in content){
        totalMw += [InnerView minWidthForText:[e text] withMaxHeight:self.originalFrame.size.height];
        totalMw +=  [e image].size.width;
    }
    self.bounds = CGRectMake(0, 0, totalMw + SPACING*(content.count+1), self.originalFrame.size.height - SPACING);
    self.center = CGPointMake(self.bounds.size.width/2.0 + self.offset, self.bounds.size.height);
}

+ (CGFloat) minWidthForText:(NSString*)_text
              withMaxHeight:(CGFloat) height{
    if(!textFont){
        textFont = [UIFont boldSystemFontOfSize:12];
    }
    return [_text sizeWithFont:textFont constrainedToSize:CGSizeMake(99999, height) lineBreakMode:UILineBreakModeClip].width;
}

- (void)drawRect:(CGRect)rect {
    CGFloat radius = 15.0;
    CGContextRef context = UIGraphicsGetCurrentContext(); CGContextSaveGState(context);
    CGContextBeginPath(context); if(!selected){
        CGContextSetFillColor(context, BKG_COLOR); }else{
            CGContextSetFillColor( context,
                                  CGColorGetComponents([[UIColor blueColor] CGColor]));
        }
    CGContextMoveToPoint(context, CGRectGetMinX(rect) + radius, CGRectGetMinY(rect));
    
    
    CGContextAddArc(context, CGRectGetMaxX(rect) - radius,CGRectGetMinY(rect)+radius, radius,3*M_PI/2,0,0);
    CGContextAddArc(context, CGRectGetMaxX(rect) - radius, CGRectGetMaxY(rect)-radius,radius,0,M_PI/2,0);
    CGContextAddArc(context,CGRectGetMinX(rect)+radius, CGRectGetMaxY(rect)-radius,radius,M_PI/2,M_PI,0);
    CGContextAddArc(context,CGRectGetMinX(rect)+radius,CGRectGetMinY(rect)+radius,radius,M_PI,3*M_PI/2,0);
    CGContextFillPath(context);
    if(!selected){
        [[UIColor colorWithRed:0.1 green:0.5 blue:0.9 alpha:0.9] set];
    }else{
        [[UIColor whiteColor] set];
    }
    CGContextMoveToPoint(context, 10, 5);
    CGFloat drawingAreaHeight = self.bounds.size.height;
    for (MiniItem *e in content){
        [[e image] drawInRect:
         CGRectMake(CGContextGetPathCurrentPoint(context).x + 5, (drawingAreaHeight-[e image].size.height)/2.0, [e image].size.width,[e image].size.height)];
        [[e text] drawAtPoint:
         CGPointMake(CGContextGetPathCurrentPoint(context).x +
                                               [e image].size.width + 8, CGContextGetPathCurrentPoint(context).y)
                         withFont:textFont];
        CGFloat width =
        [InnerView minWidthForText:[e text] withMaxHeight:self.bounds.size.height];
        CGContextMoveToPoint( context,
                             CGContextGetPathCurrentPoint(context).x + width + [e image].size.width + SPACING, CGContextGetPathCurrentPoint(context).y);
    }
    CGContextRestoreGState(context); }

@end

@implementation SummaryView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame xOffset:(CGFloat)xOffset andContent:(NSArray*) content
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        InnerView *v = [[InnerView alloc] initWithFrame:CGRectMake(0, 5, frame.size.width, frame.size.height-10) xOffset:xOffset andContent:content];
        v.tag = 120;
        v.userInteractionEnabled = NO;
        [self addSubview:v];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGRect childsFrame = [self viewWithTag:120].frame;
    if (CGRectContainsPoint(childsFrame, point)) {
        selected = YES;
        [self setNeedsDisplay];
        [self tellChild];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    selected = NO;
    [self setNeedsDisplay];
    [self tellChild];
    [self.delegate viewTapped:self];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    selected = NO;
    [self setNeedsDisplay];
    [self tellChild];
    [self.delegate viewTapped:self];
}

-(void)tellChild
{
    InnerView *v = (InnerView*)[self viewWithTag:120];
    v.selected = selected;
}

- (void) setContent:(NSArray*)cnt
{
    InnerView *child = (InnerView*)[self viewWithTag:120];
    child.content = cnt;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext(); CGContextSaveGState(context);
    if(!selected){
        CGContextSetFillColor(context, BKG_COLOR);
    }else{
        CGContextSetFillColor(context, CGColorGetComponents( [[UIColor blueColor] CGColor]));
    }
    UIView *c = [self viewWithTag:120];
    CGFloat width = c.bounds.size.width;
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 0.00001);
    CGContextMoveToPoint(context,c.frame.origin.x+width/4.0,13);
    CGContextAddLineToPoint(context,c.frame.origin.x+width/4.0+10,4);
    CGContextAddLineToPoint(context,c.frame.origin.x+width/4.0+20,13);
    CGContextClosePath(context);
    CGContextFillPath(context);
    CGContextRestoreGState(context);
}
@end
