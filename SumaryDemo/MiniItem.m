//
//  MiniItem.m
//  SumaryDemo
//
//  Created by wenbo on 10/25/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "MiniItem.h"

@implementation MiniItem
@synthesize text,image;

+ (MiniItem*)itemWithText:(NSString*)text andImage:(UIImage*)image
{
    MiniItem *item = [[MiniItem alloc] init];
    item.text = text;
    item.image = image;
    return item;
}

+ (MiniItem*)itemWithText:(NSString*)text
{
    MiniItem *item = [[MiniItem alloc] init];
    item.text = text;
    return item;
}

@end
