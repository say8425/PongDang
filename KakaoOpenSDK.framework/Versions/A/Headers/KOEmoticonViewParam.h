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
 @header KOEmoticonViewParam.h
 이모티콘 이미지를 로딩시켜주기 위한 URL, Version, ID 등의 정보를 저장하는 구조체.
 */
#import <Foundation/Foundation.h>

extern NSString * const kEmoticonItemId;
extern NSString * const kEmoticonItemVersion;
extern NSString * const kEmoticonItemType;
extern NSString * const kEmoticonImageURL;

/*!
 @class KOEmoticonViewParam
 @discussion 이모티콘 이미지를 로딩시켜주기 위한 URL, Version, ID 등의 정보를 저장하는 구조체.
 */
@interface KOEmoticonViewParam : NSObject

/*!
 @property itemId
 @abstract 이모티콘 세트를 식별하는 ID.
 */
@property (nonatomic, readonly) NSString *itemId;

/*!
 @property itemVersion
 @abstract 이모티콘 세트 버전 정보.
 */
@property (nonatomic, readonly) NSNumber *itemVersion;

/*!
 @property itemType
 @abstract 이모티콘 세트의 종류.
 */
@property (nonatomic, readonly) NSString *itemType;

/*!
 @property imageURL
 @abstract 이모티콘 세트 내의 특정 이모티콘 이미지 URL
 */
@property (nonatomic, readonly) NSString *imageURL;

- (instancetype)initWithJsonString:(NSString *)jsonString;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

/*!
 @abstract json string 형태로 변환한다.
 */
- (NSString *)toJsonString;

@end
