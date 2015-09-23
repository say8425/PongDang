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
 @header KOEmoticonResource.h
 하나의 이모티콘 리소스 정보를 담는 구조체.
 */
#import <Foundation/Foundation.h>
#import "KOEmoticon.h"

/*!
 @class KOEmoticonResource
 @discussion 하나의 이모티콘 리소스 정보 클래스.
 */
@interface KOEmoticonResource : NSObject

/*!
 @property ID
 @abstract 이모티콘 리소스 ID.
 */
@property (nonatomic, readonly) NSNumber *ID;

/*!
 @property emoticonID
 @abstract 이모티콘 세트 ID.
 */
@property (nonatomic, readonly) NSString *emoticonID;

/*!
 @property emoticonType
 @abstract 이모티콘 세트 type.
 */
@property (nonatomic, readonly) KOEmoticonType emoticonType;

/*!
 @property imageURL
 @abstract 이모티콘 리소스 이미지 URL.
 */
@property (nonatomic, readonly) NSString *imageURL;

/*!
 @property thumbnailURL
 @abstract 이모티콘 리소스 썸네일 URL.
 */
@property (nonatomic, readonly) NSString *thumbnailURL;

// not used.
@property (nonatomic, readonly) NSString *soundURL;
@property (nonatomic, readonly) NSString *playURL;
@property (nonatomic, readonly) NSString *image2URL;

@end
