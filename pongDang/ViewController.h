//
//  ViewController.h
//  PongDang
//
//  Created by Cheon Park on 2014. 6. 29..
//  Copyright (c) 2014년 northPenguin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KakaoLink.h"

@interface ViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate> {
    NSURLConnection *currentConnection;
}
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UILabel *tempLabel;
@property (retain, nonatomic) NSMutableData *apiReturnData;
@property (strong, nonatomic) IBOutlet UILabel *nowHanGang;
@property (assign, nonatomic) float temp;

- (IBAction)exportButton:(id)sender;
- (IBAction)whoButton:(id)sender;

@end

