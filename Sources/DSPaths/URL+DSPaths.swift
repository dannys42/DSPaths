//
//  NSURL+DSPaths.h
//  Pods
//
//  Created by Danny Sung on 05/07/2015.
//
//

import Foundation

extension URL {
    static func cacheDirectory() -> URL? {
        let cacheDirectory = DSPaths.cacheDirectory
        return URL(fileURLWithPath: cacheDirectory)
    }

    static func cacheDirectory(withPath path: String) -> URL {
        let cachePath = DSPaths.cache(withFile: path)

        return URL(fileURLWithPath: cachePath)
    }

    static func cacheDirectory(withPathComponents pathComponents: [String]) -> URL {
        let cachePath = DSPaths.cache(withPathComponents: pathComponents)
        return URL(fileURLWithPath: cachePath)
    }

    static func documentDirectory() -> URL {
        return URL(fileURLWithPath: DSPaths.documentDirectory)
    }

    static func documentDirectory(withPath path: String) -> URL {
        let documentPath = DSPaths.document(withFile: path)
        return URL(fileURLWithPath: documentPath)
    }

    static func documentDirectory(withPathComponents pathComponents: [String]) -> URL {
        let documentPath = DSPaths.document(withPathComponents: pathComponents)
        return URL(fileURLWithPath: documentPath)
    }

    static func libraryDirectory() -> URL? {
        let libraryPath = DSPaths.libraryDirectory
        return URL(fileURLWithPath: libraryPath)
    }

    static func libraryDirectory(withPath path: String) -> URL {
        let libraryPath = DSPaths.library(withFile: path)
        return URL(fileURLWithPath: libraryPath)
    }

    static func libraryDirectory(withPathComponents pathComponents: [String]) -> URL {
        let libraryPath = DSPaths.library(withPathComponents: pathComponents)

        return URL(fileURLWithPath: libraryPath)
    }

    static func supportDirectory() -> URL? {
        let supportDirectory = DSPaths.supportDirectory
        return URL(fileURLWithPath: supportDirectory)
    }

    static func supportDirectory(withPath path: String) -> URL {
        let libraryPath = DSPaths.library(withFile: path)
        return URL(fileURLWithPath: libraryPath)
    }

    static func supportDirectory(withPathComponents pathComponents: [String]) -> URL {
        let supportPath = DSPaths.support(withPathComponents: pathComponents)
        return URL(fileURLWithPath: supportPath)
    }

    static func tempDirectory() -> URL? {
        let tempDirectory = DSPaths.tempDirectory
        return URL(fileURLWithPath: tempDirectory)
    }

    static func tempDirectory(withPath path: String) -> URL {
        let libraryPath = DSPaths.library(withFile: path)
        return URL(fileURLWithPath: libraryPath)
    }

    static func tempDirectory(withPathComponents pathComponents: [String]) -> URL {
        let tempPath = DSPaths.temp(withPathComponents: pathComponents)
        return URL(fileURLWithPath: tempPath)
    }

    static func userDirectory() -> URL {
        let userDirectory = DSPaths.userDirectory
        return URL(fileURLWithPath: userDirectory)
    }

    static func userDirectory(withPath path: String) -> URL {
        let tempPath = DSPaths.temp(withFile: path)
        return URL(fileURLWithPath: tempPath)
    }

    static func userDirectory(withPathComponents pathComponents: [String]) -> URL {
        let userPath = DSPaths.user(withPathComponents: pathComponents)
        return URL(fileURLWithPath: userPath)
    }
}

