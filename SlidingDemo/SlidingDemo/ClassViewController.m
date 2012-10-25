//
//  ClassViewController.m
//  SlidingDemo
//
//  Created by wenbo on 10/24/12.
//  Copyright (c) 2012 wenbo. All rights reserved.
//

#import "ClassViewController.h"

#define SLIDING_VIEW_HEIGHT 400

@implementation ClassViewController

-(id)init{
    if(self = [super init]){
    }
    return self;
}


-(void)loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 620, 480)];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushButton setTitle:@"push" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(buttonPushed) forControlEvents:UIControlEventTouchUpInside];
    pushButton.frame = CGRectMake(115, 200, 80, 40);
    [self.view addSubview:pushButton];
    
    self.slidingView = [[MyView alloc] initWithFrame:CGRectMake(0, -SLIDING_VIEW_HEIGHT, 320, SLIDING_VIEW_HEIGHT)];
    [self.slidingView setBackgroundColor:[UIColor colorWithWhite:.2 alpha:.8]];
    self.slidingView.delegate = self;
    [self.view addSubview:self.slidingView];
}

-(void)slideView:(Direction)_direction
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.75];
    self.slidingView.frame = CGRectMake(0, _direction==DOWN?0: -SLIDING_VIEW_HEIGHT, 320, SLIDING_VIEW_HEIGHT);
    [UIView commitAnimations];
}

-(void)buttonPushed
{
    [self slideView:DOWN];
}

-(void)viewTouched
{
    [self slideView:UP];
}

@end
