//
//  TodayViewController.h
//  Widget
//
//  Created by Cheon Park on 2015. 7. 16..
//  Copyright (c) 2015년 northPenguin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController <NSURLConnectionDataDelegate, NSURLConnectionDataDelegate> {
        NSURLConnection *currentConnection;
}

@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (retain, nonatomic) NSMutableData *apiReturnData;
@property (assign, nonatomic) float temp;

@end
