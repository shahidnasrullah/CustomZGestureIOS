//
//  CustomZGesture.h
//  Medipad
//
//  Created by Adil Soomro on 04/06/2013.
//
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

typedef enum {
    Z_GESTURE_STATE_START,
    Z_GESTURE_STATE_MIDDLE,
    Z_GESTURE_STATE_END
} Z_GESTURE_STATE;

@interface CustomZGesture : UIGestureRecognizer
{
    CGPoint start;
    Z_GESTURE_STATE _currentState;
    BOOL startRecognized, middleRecognized, endRecognized;
}
@end
