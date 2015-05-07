//
//  DSTextViewController.m
//  DSPaths
//
//  Created by Danny Sung on 05/07/2015.
//  Copyright (c) 2015 Danny Sung. All rights reserved.
//

#import "DSTextViewController.h"
#import "DSPaths.h"
#import "NSURL+DSAppTemplate.h"

@interface DSTextViewController ()
@property (nonatomic, strong) NSMutableString *text;
@end

@implementation DSTextViewController

- (void)viewDidLoad {
    self.textView.text = @"";
    
    [self appendFormat:@"----------------------\n"];
    [self appendFormat:@"DocumentDirectory\n"];
    
    NSURL *url = [NSURL fileURLWithPath:[DSPaths documentDirectory]];
    NSURL *tURL;
    [self appendFormat:@"Actual: %@\n", url.absoluteString];
    
    tURL = [NSURL expandWithURL:url];
    [self appendFormat:@"Expand: %@\n", tURL.absoluteString];
    
    tURL = [NSURL contractWithURL:tURL];
    [self appendFormat:@"Contract: %@\n", tURL.absoluteString];
    
    tURL = [NSURL expandWithURL:tURL];
    [self appendFormat:@"Expand: %@\n", tURL.absoluteString];
    
    if( [tURL isEqual:url] ) {
        [self appendFormat:@"* Pass\n"];
    } else {
        [self appendFormat:@"* Fail\n"];
    }
}

- (void)append:(NSString *)string {
    [self.text appendString:string];
    self.textView.text = self.text;
}

- (void)appendFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) {
    va_list args;
    va_start(args, format);
    NSString *s = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);

    [self append:s];
}

#pragma mark Properties

- (NSMutableString *)text {
    if( !_text ) {
        _text = [[NSMutableString alloc] init];
    }
    return _text;
}

@end
