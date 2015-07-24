//
//  TodayViewController.m
//  Widget
//
//  Created by Cheon Park on 2015. 7. 16..
//  Copyright (c) 2015년 northPenguin. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(0.0, 118);
    
#pragma mark - Communication ready
    
    NSURL *tempURL = [NSURL URLWithString:@"http://hangang.dkserver.wo.tc"];
    NSURLRequest *tempRequest = [NSURLRequest requestWithURL:tempURL];
    
    if (currentConnection) {
        [currentConnection cancel];
        currentConnection = nil;
        self.apiReturnData = nil;
    }
    currentConnection = [[NSURLConnection alloc]initWithRequest:tempRequest delegate:self];
    self.apiReturnData = [NSMutableData data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.apiReturnData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.apiReturnData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"URL Connection Failed!");
    currentConnection = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    id tempJson = [NSJSONSerialization JSONObjectWithData:self.apiReturnData options:0 error:nil];
    self.temp   = [[tempJson objectForKey:@"temp"]floatValue];
    
    NSMutableAttributedString *tempText = [[NSMutableAttributedString alloc]initWithString:
                                           [NSString stringWithFormat:@"%.1f", self.temp]];
    NSMutableAttributedString *tempUnit = [[NSMutableAttributedString alloc]initWithString:@"℃"];
    
    [tempText setAttributes:@{NSFontAttributeName:[UIFont fontWithName:nil size:14],
                              NSForegroundColorAttributeName:[UIColor colorWithWhite:1.0f alpha:0.65f]} range:NSMakeRange(0, [tempText length])];
    [tempUnit setAttributes:@{NSFontAttributeName:[UIFont fontWithName:nil size:7],
                              NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, [tempUnit length])];
    [tempText appendAttributedString:tempUnit];
    
    self.tempLabel.attributedText = tempText;
    currentConnection = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}

@end
