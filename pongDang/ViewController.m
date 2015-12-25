//
//  ViewController.m
//  PongDang
//
//  Created by Cheon Park on 2014. 6. 29..
//  Copyright (c) 2014년 northPenguin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //[self setModalPresentationStyle:UIModalPresentationCurrentContext];
    self.nowHanGang.font = [UIFont fontWithName:@"NanumMyeongjoOTF" size:20];

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

    [tempText setAttributes:@{NSFontAttributeName:[UIFont fontWithName:nil size:30],
                              NSForegroundColorAttributeName:[UIColor whiteColor]} range:NSMakeRange(0, [tempText length])];
    [tempUnit setAttributes:@{NSFontAttributeName:[UIFont fontWithName:nil size:12],
                              NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, [tempUnit length])];
    [tempText appendAttributedString:tempUnit];
    
    [self.tempLoad setAttributedTitle:tempText forState:UIControlStateNormal];

    currentConnection = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)exportButton:(id)sender {
    if (![self presentedViewController]) {
        NSString *tempStringExport = [NSString stringWithFormat:@"현재 한강 수온은 %.1f입니다.", self.temp];
        KakaoLink *kakaoLink = [KakaoLink new];

        UIActivityViewController *exportController = [[UIActivityViewController alloc]initWithActivityItems:@[tempStringExport]
                                                                                      applicationActivities:@[kakaoLink]];

        [self presentViewController:exportController animated:YES completion:nil];
    }
}

- (IBAction)whoButton:(id)sender {
}

- (IBAction)tempLoad:(id)sender {
}

@end

