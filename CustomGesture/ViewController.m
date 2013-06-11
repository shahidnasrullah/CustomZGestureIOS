//
//  ViewController.m
//  CustomGesture
//
//  Created by Adil Soomro on 11/06/2013.
//  Copyright (c) 2013 Shahid Nasrullah. All rights reserved.
//

#import "ViewController.h"
#import "CustomZGesture.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.lblResult setText:@""];
    
    CustomZGesture * zGesture = [[CustomZGesture alloc] initWithTarget:self action:@selector(gestureDetected:)];
    [self.view addGestureRecognizer:zGesture];
    [zGesture release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_lblResult release];
    [super dealloc];
}

-(void) gestureDetected:(UIGestureRecognizer*) sender
{
    [self.lblResult setText:@"Z Gesture Detected"];
    [self.lblResult performSelector:@selector(setText:) withObject:@"" afterDelay:2];
}

@end
