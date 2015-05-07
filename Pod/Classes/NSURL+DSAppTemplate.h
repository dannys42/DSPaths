//
//  NSURL+AppTemplate.h
//
//  Created by Danny Sung on 09/09/2014.
//  Copyright (c) 2014 Sung Heroes LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (DSAppTemplate)

@property (nonatomic, readonly) NSString *templateKey;
@property (nonatomic, readonly) BOOL isTemplated;


/** Expand a contracted FileURL.
 Looks for templateKeys in the first 2 path components of the passed url.  If matching, the url will be expanded.  If not matching, the original url is duplicated.
 @param url FileURL to expand
 @return an expanded FileURL
 */
+ (instancetype)expandWithURL:(NSURL *)url;

/** Contract (or abbreviate) a FileURL.
 This method is used when attempting place absolute paths in a persistent store.  It resovles standard paths at runtime, contracting them to known "template" keys.  The currently supported mapped keys are:
 
    - _ApplicationSupportDirectory
    - _CustomaryApplicationSupportDirectory
    - _LibraryDirectory
    - _DocumentDirectory
    - _CacheDirectory
    - _TempDirectory
    - _UserDirectory
 @param url FileURL to contract
 @return contracted URL if possible.  If not possible or not a FileURL, return a copy of url.
 */
+ (instancetype)contractWithURL:(NSURL *)url;

@end
