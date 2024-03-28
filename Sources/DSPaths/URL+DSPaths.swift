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
        guard let cacheDirectory = DSPaths.cacheDirectory() else {
            return nil
        }
        return URL(fileURLWithPath: cacheDirectory)
    }

    static func cacheDirectory(withPath path: String?) -> URL? {
        guard let cachePath = DSPaths.cache(withFile: path) else {
            return nil
        }

        return URL(fileURLWithPath: cachePath)
    }

    static func cacheDirectory(withPathComponents pathComponents: [String]?) -> URL? {
        guard let cachePath = DSPaths.cache(withPathComponents: pathComponents) else {
            return nil
        }
        return URL(fileURLWithPath: cachePath)
    }

    static func documentDirectory() -> URL? {
        guard let documentDirectory = DSPaths.documentDirectory() else {
            return nil
        }
        return URL(fileURLWithPath: documentDirectory)
    }

    static func documentDirectory(withPath path: String?) -> URL? {
        guard let documentDirectory = DSPaths.document(withFile: path) else {
            return nil
        }
        return URL(fileURLWithPath: documentDirectory)
    }

    static func documentDirectory(withPathComponents pathComponents: [String]?) -> URL? {
        guard let documentPath = DSPaths.document(withPathComponents: pathComponents) else {

            return nil
        }
        return URL(fileURLWithPath: documentPath)
    }

    static func libraryDirectory() -> URL? {
        guard let libraryPath = DSPaths.libraryDirectory() else {
            return nil
        }
        return URL(fileURLWithPath: libraryPath)
    }

    static func libraryDirectory(withPath path: String?) -> URL? {
        guard let libraryPath = DSPaths.library(withFile: path) else {
            return nil
        }
        return URL(fileURLWithPath: libraryPath)
    }

    static func libraryDirectory(withPathComponents pathComponents: [String]?) -> URL? {
        guard let libraryPath = DSPaths.library(withPathComponents: pathComponents) else {
            return nil
        }

        return URL(fileURLWithPath: libraryPath)
    }

    static func supportDirectory() -> URL? {
        guard let supportDirectory = DSPaths.supportDirectory() else {
            return nil
        }
        return URL(fileURLWithPath: supportDirectory)
    }

    static func supportDirectory(withPath path: String?) -> URL? {
        guard let libraryPath = DSPaths.library(withFile: path) else {
            return nil
        }
        return URL(fileURLWithPath: libraryPath)
    }

    static func supportDirectory(withPathComponents pathComponents: [String]?) -> URL? {
        guard let supportPath = DSPaths.support(withPathComponents: pathComponents) else {
            return nil
        }
        return URL(fileURLWithPath: supportPath)
    }

    static func tempDirectory() -> URL? {
        guard let tempDirectory = DSPaths.tempDirectory() else {
            return nil
        }
        return URL(fileURLWithPath: tempDirectory)
    }

    static func tempDirectory(withPath path: String?) -> URL? {
        guard let libraryPath = DSPaths.library(withFile: path) else {
            return nil
        }
        return URL(fileURLWithPath: libraryPath)
    }

    static func tempDirectory(withPathComponents pathComponents: [AnyHashable]?) -> URL? {
        guard let tempPath = DSPaths.temp(withPathComponents: pathComponents) else {
            return nil
        }
        return URL(fileURLWithPath: tempPath)
    }

    static func userDirectory() -> URL? {
        guard let userDirectory = DSPaths.userDirectory() else {
            return nil
        }
        return URL(fileURLWithPath: userDirectory)
    }

    static func userDirectory(withPath path: String?) -> URL? {
        guard let tempPath = DSPaths.temp(withFile: path) else {
            return nil
        }
        return URL(fileURLWithPath: tempPath)
    }

    static func userDirectory(withPathComponents pathComponents: [String]?) -> URL? {
        guard let userPath = DSPaths.user(withPathComponents: pathComponents) else {
            return nil
        }
        return URL(fileURLWithPath: userPath)
    }
}

