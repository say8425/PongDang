//
//  WhoMakeItViewController.m
//  PongDang
//
//  Created by Cheon Park on 2014. 7. 4..
//  Copyright (c) 2014년 northPenguin. All rights reserved.
//

#import "WhoMakeItViewController.h"

@interface WhoMakeItViewController ()

@end

@implementation WhoMakeItViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setModalPresentationStyle:UIModalPresentationCurrentContext];
    self.whoMake.font = [UIFont fontWithName:@"NanumMyeongjoOTF" size:17];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)serverName:(id)sender {
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=WaaGrr"]]) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"twitter://user?screen_name=WaaGrr"]];
    } else {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://twitter.com/WaaGrr"]];
    }
}

- (IBAction)codeName:(id)sender {
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=say8425"]]) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"twitter://user?screen_name=say8425"]];
    } else {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://twitter.com/say8425"]];
    }

}

- (IBAction)cameraName:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://luvisyh.blog.me"]];
}


@end
