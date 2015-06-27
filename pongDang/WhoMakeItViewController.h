//
//  WhoMakeItViewController.h
//  PongDang
//
//  Created by Cheon Park on 2014. 7. 4..
//  Copyright (c) 2014년 northPenguin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WhoMakeItViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *whoMake;

- (IBAction)serverName:(id)sender;
- (IBAction)codeName:(id)sender;
- (IBAction)cameraName:(id)sender;

@end
