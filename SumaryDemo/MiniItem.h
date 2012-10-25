//
//  MiniItem.h
//  SumaryDemo
//
//  Created by wenbo on 10/25/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MiniItem : NSObject
{
    NSString *text;
    UIImage *image;
}
@property (nonatomic, copy) NSString *text;
@property (nonatomic, retain) UIImage *image;

+ (MiniItem*)itemWithText:(NSString*)text andImage:(UIImage*)image;
+ (MiniItem*)itemWithText:(NSString*)text;
@end
