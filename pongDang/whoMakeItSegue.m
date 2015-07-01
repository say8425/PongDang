//
//  ProposeSegue.m
//  PongDang
//
//  Created by Cheon Park on 2014. 7. 18..
//  Copyright (c) 2014년 northPenguin. All rights reserved.
//

#import "whoMakeItSegue.h"

@implementation whoMakeItSegue

- (void)perform {
    UIView *sourceView = ((UIViewController *)self.sourceViewController).view;
    UIView *destinView = ((UIViewController *)self.destinationViewController).view;
    UIWindow *window   = [[[UIApplication sharedApplication]delegate]window];

    [destinView setAlpha:0.0];
    [window insertSubview:destinView aboveSubview:sourceView];

    [UIView animateWithDuration:0.42
                     animations:^{
                         [destinView setAlpha:1.0];
                     }
                     completion:^(BOOL finished) {
                         [sourceView removeFromSuperview];
                         [window setRootViewController:self.destinationViewController];
                     }];
}

@end
