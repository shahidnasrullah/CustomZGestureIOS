//
//  ViewController.h
//  CustomGesture
//
//  Created by Adil Soomro on 11/06/2013.
//  Copyright (c) 2013 Shahid Nasrullah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>

@property (retain, nonatomic) IBOutlet UILabel *lblResult;
@end
