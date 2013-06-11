CustomZGestureIOS
=================

Custom Z Gesture For iOS Application

To Add Z Gesture in your applicatino just copy CustomZGesture.h and CustomZGesture.m files in your project
and following code to use that gesture.

// Include CustomZGesture.h file

    #import "CustomZGesture.h"

// Add the gesture Recognizer to the view

    CustomZGesture * zGesture = [[CustomZGesture alloc] initWithTarget:self action:@selector(gestureDetected:)];
    [self.view addGestureRecognizer:zGesture];
    [zGesture release];


// Selector

    -(void) gestureDetected:(UIGestureRecognizer*) sender
    {
        NSLog(@"Gesture Recognized");
    }
