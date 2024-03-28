//
//  DSPaths+ApplicationSupport.swift
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//
import Foundation

extension DSPaths {
    /// Get the full path to the Application Support Directory.
    /// - Returns: Full path to the NSApplicationSupportDirectory.
    /// @retval nil if not available
    class func supportDirectory() -> String? {
        return self.path(with: FileManager.SearchPathDirectory.applicationSupportDirectory)
    }

    /// Get the full path to a file within the Application Support Directory.
    /// - Parameter filename: name to add to Application Support Directory
    /// - Returns: Full path to file in NSApplicationSupportDirectory
    /// @retval nil if not NSApplicationSupportDirectory could not be determined.
    /// @retval nil if filename is nil
    /// @
    class func support(withFile filename: String?) -> String? {
        return self.path(withFile: filename, in: FileManager.SearchPathDirectory.applicationSupportDirectory)
    }

    /// Append path components to the Application Support Directory.
    /// - Parameter pathComponents: path components to append
    /// - Returns: full path to components in NSApplicationSupportDirectory
    /// @retval nil if NSApplicationSupportDirectory could not be determined.
    /// @retval nil if pathComponenets is nil
    class func support(withPathComponents pathComponents: [String]?) -> String? {
        return self.path(withComponents: pathComponents, in: FileManager.SearchPathDirectory.applicationSupportDirectory)
    }

    /// Get the full path to the Application Support Directory and create it if necessary.
    /// - Parameters:
    ///   - shouldCreate: Specify \em TRUE to create the path and intermediate paths if necessary.
    ///   - errorOut: On input, a pointer to an error object. If an error occurs, this pointer is set to an actual error object containing the error information. You may specify \em nil for this parameter if you do not want the error information.
    /// - seealso: supportDirectory
    /// - Returns: full path to NSApplicationSupportDirectory
    class func supportDirectoryCreateIfNecessary(_ shouldCreate: Bool) throws -> String? {
        let path = self.path(with: FileManager.SearchPathDirectory.applicationSupportDirectory)
        if path == nil {
            return nil
        }

        if shouldCreate {
            try self.createDirectory(path)
        }

        return path
    }
}
