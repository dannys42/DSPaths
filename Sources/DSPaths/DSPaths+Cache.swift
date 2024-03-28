//
//  DSPaths+Caches.swift
//
//  Created by Danny Sung on 05/06/2015.
//  Converted to Swift on 03/22/2024
//

import Foundation

extension DSPaths {
    /// Get the full path to the Cache Directory.
    /// - Returns: Full path to the NSCachesDirectory.
    /// @retval nil if not available
    class func cacheDirectory() -> String? {
        return self.path(with: FileManager.SearchPathDirectory.cachesDirectory)
    }

    /// Get the full path to a file within the Cache Directory.
    /// - Parameter filename: name to add to Cache Directory
    /// - Returns: Full path to file in NSCachesDirectory
    /// @retval nil if not NSCachesDirectory could not be determined.
    /// @retval nil if filename is nil
    /// @
    class func cache(withFile filename: String?) -> String? {
        return self.path(withFile: filename, in: FileManager.SearchPathDirectory.cachesDirectory)
    }

    /// Append path components to the Cache Directory.
    /// - Parameter pathComponents: path components to append
    /// - Returns: full path to components in NSCachesDirectory
    /// @retval nil if NSCachesDirectory could not be determined.
    /// @retval nil if pathComponenets is nil
    class func cache(withPathComponents pathComponents: [String]?) -> String? {
        return self.path(withComponents: pathComponents, in: FileManager.SearchPathDirectory.cachesDirectory)
    }

    /// Get the full path to the Temp Directory and create it if necessary.
    /// - Parameters:
    ///   - shouldCreate: Specify \em TRUE to create the path and intermediate paths if necessary.
    ///   - errorOut: On input, a pointer to an error object. If an error occurs, this pointer is set to an actual error object containing the error information. You may specify \em nil for this parameter if you do not want the error information.
    /// - seealso: tempDirectory
    /// - Returns: full path to Temp Directory
    class func cacheDirectoryCreateIfNecessary(_ shouldCreate: Bool) throws -> String? {
        let path = self.path(with: FileManager.SearchPathDirectory.cachesDirectory)
        if path == nil {
            return nil
        }

        if shouldCreate {
            try self.createDirectory(path)
        }

        return path
    }
}
