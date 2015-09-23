/**
 * Copyright 2015 Kakao Corp.
 *
 * Redistribution and modification in source or binary forms are not permitted without specific prior written permission.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*!
 @header KOEmoticonView.h
 이모티콘 이미지뷰
 */
#import <UIKit/UIKit.h>
#import "KOEmoticonViewParam.h"

/*!
 @class KOEmoticonView
 @discussion 이모티콘 이미지뷰
 */
@interface KOEmoticonView : UIImageView

/*!
 @property useLoadingIndicator
 @abstract 이모티콘 이미지 로딩 중에 loading indicator(UIActivityIndicatorView) 를 사용할지 여부.
 */
@property (nonatomic) BOOL useLoadingIndicator;

/*!
 @property viewParam
 @abstract 이모티콘 이미지를 로딩시켜주기 위한 URL, Version, ID 등의 정보.
 */
@property (nonatomic, strong) KOEmoticonViewParam *viewParam;

@end
