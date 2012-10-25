//
//  SummaryView.h
//  SumaryDemo
//
//  Created by wenbo on 10/25/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SummaryViewDelegate <NSObject>

-(void) viewTapped:(UIView*)view;

@end

@interface SummaryView : UIView
{
    BOOL selected;
    id<SummaryViewDelegate> delegate;
}

@property (nonatomic, retain) id<SummaryViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame xOffset:(CGFloat)xOffset andContent:(NSArray*) content;
- (void) setContent:(NSArray*)content;
@end
