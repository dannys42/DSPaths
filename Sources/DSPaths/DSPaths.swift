//
//  DSAppPaths.swift
//
//  Created by Danny Sung on 09/05/2014.
//  Copyright (c) 2014 Sung Heroes LLC. All rights reserved.
//  Converted to Swift on 03/22/2024
//

import Foundation

class DSPaths {
    /// Get a valid path for a given searchPath.
    /// A convenience method that gets the first path from a call to:
    /// @code
    /// NSSearchPathForDirectoriesInDomains(searchPathDirectory, NSUserDomainMask, YES);
    /// @endcode
    /// - Parameter searchPathDirectory:
    /// - Returns: filesystem path
    /// @retval nil if not found
    class func path(with searchPathDirectory: FileManager.SearchPathDirectory) -> String? {
        let paths = FileManager.default.urls(for: searchPathDirectory, in: .userDomainMask).map(\.path)

        var resolvedPath: String?
        if paths.count > 0 {
            resolvedPath = paths[0]
        }
        return resolvedPath
    }

    /// Get the full path to a file within the search Path Directory.
    /// - Parameter filename: name to add to Documents Directory
    /// - Returns: full path to file in the given search path
    /// @retval nil if searchPathDirectory could not be determined.
    /// @retval nil if filename is nil
    /// - seealso: pathWithSearchPathDirectory:
    class func path(withFile filename: String?, in searchPathDirectory: FileManager.SearchPathDirectory) -> String? {
        let path = self.path(with: searchPathDirectory)
        if path == nil {
            return nil
        }
        if filename == nil {
            return nil
        }

        return NSString.path(withComponents: [path, filename].compactMap { $0 })
    }

    /// Append path components to a search Path Directory.
    /// - Parameter pathComponents: path components to append
    /// - Returns: full path to file in the given search path
    /// @retval nil if searchPathDirectory could not be determined.
    /// @retval nil if filename is nil
    /// - seealso: pathWithSearchPathDirectory:
    class func path(withComponents pathComponents: [String]?, in searchPathDirectory: FileManager.SearchPathDirectory) -> String? {
        var rtn: String?
        let path = self.path(with: searchPathDirectory)
        if path == nil {
            return nil
        }
        if pathComponents == nil {
            return nil
        }

        var array = [AnyHashable](repeating: 0, count: 1 + (pathComponents?.count ?? 0))
        array.append(path ?? "")
        if let pathComponents {
            array.append(contentsOf: pathComponents)
        }

        if let array = array as? [String] {
            rtn = NSString.path(withComponents: array)
        }

        return rtn

    }

    /// Create a path and all intermediate paths.
    /// - Parameters:
    ///   - directory: full path to create
    ///   - errorOut: On input, a pointer to an error object. If an error occurs, this pointer is set to an actual error object containing the error information. You may specify \em nil for this parameter if you do not want the error information.
    class func createDirectory(_ directory: String?) throws {
        if directory == nil {
            return
        }
        try FileManager.default.createDirectory(
            atPath: directory ?? "",
            withIntermediateDirectories: true,
            attributes: nil)
    }
}