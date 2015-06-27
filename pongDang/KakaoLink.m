//
//  KakaoLink.m
//  PongDang
//
//  Created by Cheon Park on 2014. 7. 3..
//  Copyright (c) 2014년 northPenguin. All rights reserved.
//

#import "KakaoLink.h"

@implementation KakaoLink

- (NSString *)activityType {
    return @"KakaoActivity";
}

- (NSString *)activityTitle {
    return @"KakaoTalk";
}

- (UIImage *)activityImage {
    return [UIImage imageNamed:@"icon_kakao"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    return [KOAppCall canOpenKakaoTalkAppLink];
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    for (id item in activityItems) {
        if ([item isKindOfClass:[NSString class]]) {
            self.tempLabel = item;
        }
    }
}

- (void)performActivity {
    KakaoTalkLinkObject *shareLabel = [KakaoTalkLinkObject createLabel:self.tempLabel];
    [KOAppCall openKakaoTalkAppLink:@[shareLabel]];
}


@end
