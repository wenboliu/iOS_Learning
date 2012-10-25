//
//  PersonTests.m
//  PersonTests
//
//  Created by wenbo on 10/21/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "PersonTests.h"
#import "Person.h"

@implementation PersonTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testArray1
{
    Person *a=[[Person alloc] init];
    Person *b=[[Person alloc] init];
    Person *c=[[Person alloc] init];
    Person *d=[[Person alloc] init];
    Person *e=[[Person alloc] init];
    Person *f=[[Person alloc] init];
    NSArray *array1 = [NSArray arrayWithObjects:a,b,c,d,e,f, nil];
#if !__has_feature(objc_arc)
    [a release];
    [b release];
    [c release];
    [d release];
    [e release];
    [f release];
#endif
    
}

-(void)testArry2
{
    Person *a=[[Person alloc] init];
    Person *b=[[Person alloc] init];
    Person *c=[[Person alloc] init];
    Person *d=[[Person alloc] init];
    Person *e=[[Person alloc] init];
    Person *f=[[Person alloc] init];
    NSArray *array1 = [NSArray arrayWithObjects:a,b,c,d,e,f, nil];
    NSArray *array2 = [array1 copy];
    NSString *name = @"Jacky";
    
    Person *aP = [array2 objectAtIndex:0];
    aP.name = name;
    aP.address = @"D street";
    
    NSLog(@"Person at %d is Name:%@, Addr:%@/n",0,[[array1 objectAtIndex:0] name],[[array1 objectAtIndex:0] name]);
    
//    STAssertEqualObjects(name, [[array1 objectAtIndex:0] name], "name not equals");
#if !__has_feature(objc_arc)
    
#endif
}

-(void)testMutableCopy
{
    Person *a=[[Person alloc] init];
    Person *b=[[Person alloc] init];
    Person *c=[[Person alloc] init];
    Person *d=[[Person alloc] init];
    Person *e=[[Person alloc] init];
    Person *f=[[Person alloc] init];
    NSArray *array1 = [NSArray arrayWithObjects:a,b,c,d,e,f, nil];

    NSMutableArray *array2 = [array1 mutableCopy];
    
    Person *g=[[Person alloc] init];
    
    [array2 addObject:g];
    [array2 removeObject:a];
    
    
}

-(void)testDeepCopy
{
    Person *a=[[Person alloc] init];
    Person *b=[[Person alloc] init];
    Person *c=[[Person alloc] init];
    Person *d=[[Person alloc] init];
    Person *e=[[Person alloc] init];
    Person *f=[[Person alloc] init];
    NSArray *array1 = [NSArray arrayWithObjects:a,b,c,d,e,f, nil];

    NSArray *array2 = [NSArray arrayWithObjects:[a copy],[b copy], nil];
     NSString *name = @"Jacky";
    
    Person *aP = [array2 objectAtIndex:0];
    aP.name = name;
    aP.address = @"D street";
    
    printf("Person at %d is Name:%s, Addr:%s/n",0,[[[array1 objectAtIndex:0] name] cStringUsingEncoding:NSUTF8StringEncoding],[[[array1 objectAtIndex:0] name] cStringUsingEncoding:NSUTF8StringEncoding]);
}

NSInteger intSort(id p1, id p2, void *context)
{
    Person *one = (Person*)p1;
    Person *two = (Person*)p2;
    return [[one name] caseInsensitiveCompare:[two name]];
}

-(void)testSort
{
    Person *a=[[Person alloc] init];
    Person *b=[[Person alloc] init];
    Person *c=[[Person alloc] init];
    Person *d=[[Person alloc] init];
    Person *e=[[Person alloc] init];
    Person *f=[[Person alloc] init];
    NSArray *array1 = [NSArray arrayWithObjects:a,b,c,d,e,f, nil];

    NSArray *sortedArray = [array1 sortedArrayUsingSelector:@selector(nameAsCompare:)];
    [array1 sortedArrayUsingFunction:intSort context:nil];
}

-(void)testSet
{
    NSSet *set1 = [[NSSet alloc] initWithObjects:@"One",@"two", nil];
    NSSet *set2 = [[NSSet alloc] initWithObjects:@"Three",@"two", nil];
    [set1 intersectsSet:set2];
    [set1 isSubsetOfSet:set2];
    
    [set1 isEqualToSet:set2];
    
    NSMutableSet *set3 = [set1 mutableCopy];
    [set3 unionSet:set2];
    [set3 minusSet:set2];
    [set3 addObjectsFromArray:nil];
    
    
}


-(void)testDictionaries
{
    NSMutableArray *kArr = [NSMutableArray arrayWithObjects:
                            @"1", @"2", @"3", @"4", nil];
    NSMutableArray *aArr = [NSMutableArray arrayWithObjects:@"2", nil];
    
    NSDictionary *guide = [NSDictionary dictionaryWithObjectsAndKeys:kArr,@"kArr",aArr,@"aArr" nil];
    
    NSEnumerator *emuerator = [guide keyEnumerator];

    id key;
    while ((key = [emuerator nextObject])) {
        [[guide objectForKey:key] addObject:@"test"];
    }
    
    NSMutableDictionary *dynaGuide = [guide mutableCopy];
    
    for (key in dynaGuide) {
        [[dynaGuide objectForKey:key] addObject:@"test"];
    }
}


@end
