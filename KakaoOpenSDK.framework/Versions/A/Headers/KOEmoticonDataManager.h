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
 @header KOEmoticonDataManager.h
 이모티콘 세트를 관리하는 Manager 클래스.
 */
#import <Foundation/Foundation.h>

extern NSString * const KOEmoticonSaveNotification;

/*!
 @class KOEmoticonDataManager
 @discussion 이모티콘 세트를 관리하는 Manager.
 */
@interface KOEmoticonDataManager : NSObject

/*!
 @property emoticons
 @abstract fetch된 이모티콘 세트 정보를 정렬해서 준다.
 */
@property (nonatomic, readonly) NSArray *emoticons;

+ (instancetype)sharedManager;

/*!
 @abstract 서버로 부터 이모티콘 세트의 대한 정보를 fetch해 온다.
 */
- (void)fetchAllEmoticons;

@end
