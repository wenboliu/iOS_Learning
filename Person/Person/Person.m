//
//  Person.m
//  Person
//
//  Created by wenbo on 10/21/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize name,address;

-(id)initWithName:(NSString *)theName andAddress:(NSString *)theAddress
{
    self=[super init];
    if(self)
    {
        self.name=theName;
        self.address=theAddress;
    }
    return self;
}

-(id)init
{
    return [self initWithName:@"" andAddress:@""];
}

-(id)copyWithZone:(NSZone *)zone
{
    return [[Person alloc]initWithName:name andAddress:address];
}

-(NSComparisonResult)nameAsCompare:(Person *)aPerson
{
    return [name caseInsensitiveCompare:aPerson.name];
}
@end
