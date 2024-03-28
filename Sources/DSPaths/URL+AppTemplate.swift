//  Converted to Swift 5.9.2 by Swiftify v5.9.29897 - https://swiftify.com/
//
//  NSURL+AppTemplate.h
//
//  Created by Danny Sung on 09/09/2014.
//  Copyright (c) 2014 Sung Heroes LLC. All rights reserved.
//

import Foundation

public extension URL {
    var templateKey: String? {
        let pathComponents = self.pathComponents
        if pathComponents.count <= 1 {
            return nil
        }

        let templateMap = URL.templateMap()
        let p1 = pathComponents[1]
        let templateKey = templateMap[p1]

        return templateKey
    }

    var isTemplated: Bool {
        if templateKey != nil {
            return true
        }
        return false
    }

    #if false

    func relativePathComponents() -> [String]? {
        var pathComponents = self.pathComponents
        if pathComponents.count > 2 {
            pathComponents.remove(at: 0) // 1st slash
            if URL.searchPath(fromKey: pathComponents[0]) > 0 {
                pathComponents.remove(at: 0)
            } else {
                pathComponents = nil
            }
        }
        return pathComponents
    }

    static func templatePath(_ path: String?, fromRoot searchPath: FileManager.SearchPathDirectory) -> Self {
        let templatePath = URL(fileURLWithPath: self.string(fromSearchPath: searchPath)).appendingPathComponent(path ?? "").path

        if templatePath == nil {
            return nil
        }

        let dsurl = URL(fileURLWithPath: templatePath)

        return dsurl as NSURL
    }

    /// Create a NSURL that expands template
    func expanded() -> Self {
        var url: URL?
        #if targetEnvironment(simulator)
        let searchPath = URL.searchPath(fromKey: templateKey)
        if searchPath.rawValue > 0 {
            var path: String?

            path = URL.expandSearchPath(searchPath)
            var relativePath: String?
            if let relativePathComponents = relativePathComponents() as? [String] {
                relativePath = NSString.path(withComponents: relativePathComponents)
            }

            path = URL(fileURLWithPath: path ?? "").appendingPathComponent(relativePath ?? "").path
            url = URL(fileURLWithPath: path ?? "")
        } else if self.path != nil {
            url = URL(fileURLWithPath: self.path)
        }
        #else
        url = self as URL
        #endif
        return url
    }

    /// Expand a contracted FileURL.
    /// Looks for templateKeys in the first 2 path components of the passed url.  If matching, the url will be expanded.  If not matching, the original url is duplicated.
    /// - Parameter url: FileURL to expand
    /// - Returns: an expanded FileURL

    #endif


    // MARK: Class Methods

    static func expand(with url: URL) -> URL {
        if !url.isFileURL {
            return url
        }

        let pathComponents = url.pathComponents
        let templateMap = URL.templateMap()

        var newPathComponents: [String] = []

        var nextIdx: Int = 0
        for idx in 0..<2 {
            let component = pathComponents[idx]
            let mappedPath = templateMap[component]
            if let mappedPath {
                newPathComponents.append(contentsOf: URL(fileURLWithPath: mappedPath).pathComponents)
                nextIdx = idx + 2
                break
            } else {
                newPathComponents.append(component)
                nextIdx = idx + 1
            }
        }


        if nextIdx < pathComponents.count {
            for idx in nextIdx..<pathComponents.count {
                let component = pathComponents[idx]
                newPathComponents.append(component)
            }
        }

        let rtn = NSURL.fileURL(withPathComponents: newPathComponents)!
        return rtn
    }

    /// Contract (or abbreviate) a FileURL.
    /// This method is used when attempting place absolute paths in a persistent store.  It resovles standard paths at runtime, contracting them to known "template" keys.  The currently supported mapped keys are:
    /// - _ApplicationSupportDirectory
    /// - _CustomaryApplicationSupportDirectory
    /// - _LibraryDirectory
    /// - _DocumentDirectory
    /// - _CacheDirectory
    /// - _TempDirectory
    /// - _UserDirectory
    /// - Parameter url: FileURL to contract
    /// - Returns: contracted URL if possible.  If not possible or not a FileURL, return a copy of url.
    static func contract(with url: URL) -> Self {
        if !url.isFileURL {
            return url
        }
        let urlString = url.path
        var matchKey: String?
        var matchScore = 0

        let templateMap = URL.templateMap()
        for (templateKey, templatePath) in templateMap {

            if urlString.hasPrefix(templatePath) {
                let score = templatePath.count
                if score > matchScore {
                    matchScore = score
                    matchKey = templateKey
                }
            }
        }

        if matchKey == nil {
            return url
        }

        let templatePath = templateMap[matchKey ?? ""]
        var rtn: URL
        if (templatePath?.count ?? 0) == (urlString.count) {
//            rtn = URL(filePath: "abc", directoryHint: .inferFromPath, relativeTo: nil)
            if #available(iOS 16.0, *) {
                rtn = URL(filePath: matchKey ?? "", directoryHint: .inferFromPath, relativeTo: URL(filePath: "/"))
            } else {
                rtn = URL(fileURLWithPath: matchKey ?? "")
                // Fallback on earlier versions
            }
        } else {
            let relativeUrlPath = (urlString as NSString?)?.substring(from: (templatePath?.count ?? 0) + 1)
            let contractPath = "\(matchKey ?? "")/\(relativeUrlPath ?? "")"
            rtn = URL(fileURLWithPath: contractPath)
        }

        return rtn
    }

    // MARK: Private Methods


    static let templateMapVar = {
        var map: [String : String] = [:]

        map[kLIBRARY_DIRECTORY] = DSPaths.libraryDirectory
        map[kDOCUMENT_DIRECTORY] = DSPaths.documentDirectory
        map[kSUPPORT_DIRECTORY] = DSPaths.supportDirectory
        map[kCUSTOMARY_SUPPORT_DIRECTORY] = DSPaths.customarySupportDirectory
        map[kCACHE_DIRECTORY] = DSPaths.cacheDirectory
        map[kTEMP_DIRECTORY] = DSPaths.tempDirectory
        map[kUSER_DIRECTORY] = DSPaths.userDirectory
        var templateMap = map
        return templateMap
    }()

    static func templateMap() -> [String : String] {
        // [Swiftify] `dispatch_once()` call was converted to the initializer of the `templateMapVar` variable
        return templateMapVar
    }
}

//
//  NSURL+AppTemplate.m
//  Music Stitcher
//
//  Created by Danny Sung on 09/09/2014.
//  Copyright (c) 2014 Sung Heroes LLC. All rights reserved.
//


let kSUPPORT_DIRECTORY = "_ApplicationSupportDirectory"
let kCUSTOMARY_SUPPORT_DIRECTORY = "_CustomaryApplicationSupportDirectory"
let kLIBRARY_DIRECTORY = "_LibraryDirectory"
let kDOCUMENT_DIRECTORY = "_DocumentDirectory"
let kCACHE_DIRECTORY = "_CacheDirectory"
let kTEMP_DIRECTORY = "_TempDirectory"
let kUSER_DIRECTORY = "_UserDirectory"
/* Not yet supported
 #define kDOCUMENTATION_DIRECTORY        @"_DocumentationDirectory"
 */
