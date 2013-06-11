//
//  CustomZGesture.m
//  Medipad
//
//  Created by Adil Soomro on 04/06/2013.
//
//

#import "CustomZGesture.h"
#import <math.h>

@implementation CustomZGesture

- (void) reset
{
    [super reset];
    [self resetZGesture];
}

-(void) resetZGesture
{
    _currentState = Z_GESTURE_STATE_START;
    start = CGPointZero;
    startRecognized = NO;
    middleRecognized = NO;
    endRecognized = NO;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    start = [touch locationInView: [touch view]];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView: [touch view]];
    CGPoint prevPoint = [touch previousLocationInView:[touch view]];
    
    if(_currentState == Z_GESTURE_STATE_START)
    {
        if(currentPoint.x > prevPoint.x)
        {
            _currentState = Z_GESTURE_STATE_START;
            startRecognized = YES;
        }
        else if(currentPoint.y > prevPoint.y && currentPoint.x < prevPoint.x)
        {
            _currentState = Z_GESTURE_STATE_MIDDLE;
        }
        else
        {
            self.state = UIGestureRecognizerStateFailed;
        }
    }
    else if (_currentState == Z_GESTURE_STATE_MIDDLE)
    {
        if(currentPoint.y > prevPoint.y && currentPoint.x < prevPoint.x)
        {
            _currentState = Z_GESTURE_STATE_MIDDLE;
            middleRecognized = YES;
        }
        else if (currentPoint.x > prevPoint.x)
        {
            _currentState = Z_GESTURE_STATE_END;
        }
        else
        {
            self.state = UIGestureRecognizerStateFailed;
        }
    }
    else
    {
        if (currentPoint.x > prevPoint.x)
        {
            _currentState = Z_GESTURE_STATE_END;
            endRecognized = YES;
        }
        else
        {
            self.state = UIGestureRecognizerStateFailed;
        }
    }
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    if(_currentState == Z_GESTURE_STATE_END)
    {
        if(endRecognized && startRecognized && middleRecognized)
        {
            self.state = UIGestureRecognizerStateRecognized;
        }
        else
        {
            self.state = UIGestureRecognizerStateFailed;
        }
    }
    else
    {
        self.state = UIGestureRecognizerStateFailed;
    }
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.state = UIGestureRecognizerStateFailed;
}

- (BOOL)canBePreventedByGestureRecognizer:(UIGestureRecognizer *)preventedGestureRecognizer
{
    return NO;
}

@end
