//
//  NSURL+AppTemplate.h
//  Music Stitcher
//
//  Created by Danny Sung on 09/09/2014.
//  Copyright (c) 2014 Sung Heroes LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (AppTemplate)

@property (nonatomic, readonly) NSString *templateKey;
@property (nonatomic, readonly) NSArray *relativePathComponents;
@property (nonatomic, readonly) BOOL isTemplate;

- (instancetype)expandedURL;
+ (instancetype)contractURL:(NSString *)urlString;
+ (instancetype)templatePath:(NSString *)path fromRoot:(NSSearchPathDirectory)searchPath;

@end
