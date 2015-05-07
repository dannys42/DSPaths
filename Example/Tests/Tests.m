//
//  DSPathsTests.m
//  DSPathsTests
//
//  Created by Danny Sung on 04/30/2015.
//  Copyright (c) 2014 Danny Sung. All rights reserved.
//

#import "DSPaths.h"
#import "NSURL+DSPaths.h"

SpecBegin(InitialSpecs)

describe(@"DocumentDirectory", ^{

    NSString *documentDirectory = [DSPaths documentDirectory];
    it(@"has Document Directory", ^{
        expect(documentDirectory).notTo.equal(nil);
    });
    
    NSURL *docFile = [NSURL documentDirectoryWithPath:@"foo/bar"];
    NSURL *contractDocFile = [NSURL contractWithURL:docFile];
    NSURL *expandDocFile = [NSURL expandWithURL:contractDocFile];
    it(@"Document Contraction", ^{
        expect(contractDocFile.relativePath).to.equal(@"_DocumentDirectory/foo/bar");
    });
    it(@"Document Expansion", ^{
        expect(expandDocFile).to.equal(docFile);
        expect(contractDocFile).notTo.equal(docFile);
    });
});

describe(@"these will pass", ^{
    
    it(@"can do maths", ^{
        expect(1).beLessThan(23);
    });
    
    it(@"can read", ^{
        expect(@"team").toNot.contain(@"I");
    });
    
    it(@"will wait and succeed", ^ /*AsyncBlock*/ {
        waitUntil(^(DoneCallback done) {
            done();
        });
    });
});

SpecEnd
