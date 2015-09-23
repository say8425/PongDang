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
 @header KOEmoticon.h
 이모티콘 세트 정보를 담는 구조체.
 */
#import <Foundation/Foundation.h>

/*!
 @abstract KOEmoticonType 이모티콘 세트의 타입.
 @constant KOEmoticonTypeUnknown 알수없음.
 @constant KOEmoticonTypeSticker 스티커.
 */
typedef NS_ENUM(NSInteger, KOEmoticonType) {
    KOEmoticonTypeUnknown,
    KOEmoticonTypeSticker
};

extern NSString* convertEmoticonTypeString(KOEmoticonType type);

/*!
 @class KOEmoticon
 @discussion 이모티콘 세트 정보 클래스.
 */
@interface KOEmoticon : NSObject

/*!
 @property ID
 @abstract 이모티콘 세트 ID
 */
@property (nonatomic, readonly) NSString *ID;

/*!
 @property editorName
 @abstract 이모티콘 세트 저작자 이름.
 */
@property (nonatomic, readonly) NSString *editorName;

/*!
 @property expiredAt
 @abstract 이모티콘 세트 만료 시간.
 */
@property (nonatomic, readonly) NSDate *expiredAt;

/*!
 @property expired
 @abstract 이모티콘 세트가 만료되었는지 여부.
 */
@property (nonatomic, readonly, getter=isExpired) BOOL expired;

/*!
 @property purchasable
 @abstract 이모티콘 세트가 구매 가능한지 여부.
 */
@property (nonatomic, readonly, getter=isPurchasable) BOOL purchasable;

/*!
 @property needToUpdate
 @abstract 이모티콘 세트가 업데이트 필요한지 여부.
 */
@property (nonatomic, readonly) BOOL needToUpdate;

/*!
 @property offImageURL
 @abstract 이모티콘 세트의 탭에 사용될 Off Image URL (탭 선택 안되었을 때, 사용)
 */
@property (nonatomic, readonly) NSString *offImageURL;

/*!
 @property onImageURL
 @abstract 이모티콘 세트의 탭에 사용될 On Image URL (탭 선택 되었을 때, 사용)
 */
@property (nonatomic, readonly) NSString *onImageURL;

/*!
 @property title
 @abstract 이모티콘 세트의 이름.
 */
@property (nonatomic, readonly) NSString *title;

/*!
 @property titleImageURL
 @abstract 이모티콘 세트의 대표 이미지 URL
 */
@property (nonatomic, readonly) NSString *titleImageURL;

/*!
 @property type
 @abstract 이모티콘 세트 타입. (Sticker, ...)
 */
@property (nonatomic, readonly) KOEmoticonType type;

/*!
 @property version
 @abstract 이모티콘 세트 버전.
 */
@property (nonatomic, readonly) NSInteger version;

/*!
 @property order
 @abstract 이모티콘 세트 탭 정렬 순서.
 */
@property (nonatomic, readonly) NSNumber *order;

/*!
 @property resources
 @abstract 이모티콘 세트내의 이모티콘들.
 */
@property (nonatomic, readonly) NSArray *resources;

@end
