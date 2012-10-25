//
//  Person.h
//  Person
//
//  Created by wenbo on 10/21/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCopying>
{
    NSString *name;
    NSString *address;
}

@property(copy) NSString *name;
@property(copy) NSString *address;

-(id)initWithName:(NSString*)theName andAddress:(NSString*)theAddress;

-(id)init;

-(NSComparisonResult) nameAsCompare:(Person*) aPerson;

@end
