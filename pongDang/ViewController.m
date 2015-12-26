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
    self.nowHanGang.font = [UIFont fontWithName:@"NanumMyeongjoOTF" size:20];

    [self setTempLoadForState];
    [self progressViewSetting];
    [self getTempStart];

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
    [self.progressView setHidden:YES];
    currentConnection = nil;
}

- (IBAction)tempLoad:(id)sender {
    [self.progressView setHidden:NO];
    [self getTempStart];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Custom Fuction
- (UIImage *)translucentImageFromImage:(UIImage *)image withAlpha:(CGFloat)alpha {
    CGRect rect = CGRectZero;
    rect.size = image.size;
    
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:rect blendMode:kCGBlendModeScreen alpha:alpha];
    UIImage * translucentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return translucentImage;
}

- (void)progressViewSetting {
    [self.progressView setSecondaryColor:[self colorFromHexString:@"#D3DBDE"]];
    [self.progressView setShowPercentage:NO];
    //    [self.progressView setBackgroundRingWidth:1.0f];
}

- (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

- (void)getTempStart {
    [self.progressView setIndeterminate:YES];
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

- (void)setTempLoadForState {
    UIImage *highlightImage = [self translucentImageFromImage:[UIImage imageNamed:@"dropWater.png"] withAlpha:0.4f];
    UIImage *normalImage = [self translucentImageFromImage:[UIImage imageNamed:@"dropWater.png"] withAlpha:0.6f];
    UIImage *selectedImage = [self translucentImageFromImage:[UIImage imageNamed:@"dropWater.png"] withAlpha:0.0f];
    
    [self.tempLoad setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [self.tempLoad setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self.tempLoad setBackgroundImage:selectedImage forState:UIControlStateSelected];
}

@end

