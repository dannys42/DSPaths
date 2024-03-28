//
//  DSPaths+User.h
//  Pods
//
//  Created by Danny Sung on 05/07/2015.
//
//
import Foundation

extension DSPaths {
    /// Get the full path to the User Directory.
    /// - Returns: Full path to the NSTempDirectory.
    /// @retval nil if not available
    class var userDirectory: String {
        self.path(with: FileManager.SearchPathDirectory.userDirectory)
    }

    /// Get the full path to a file within the User Directory.
    /// - Parameter filename: name to add to Temp Directory
    /// - Returns: Full path to file in NSTempDirectory
    /// @retval nil if not NSCachesDirectory could not be determined.
    /// @retval nil if filename is nil
    /// @
    class func user(withFile filename: String) -> String {
        return self.path(withFile: filename, in: FileManager.SearchPathDirectory.userDirectory)
    }

    /// Append path components to the User Directory.
    /// - Parameter pathComponents: path components to append
    /// - Returns: full path to components in NSTempDirectory
    /// @retval nil if NSTempDirectory could not be determined.
    /// @retval nil if pathComponenets is nil
    class func user(withPathComponents pathComponents: [String]) -> String {
        return self.path(withComponents: pathComponents, in: FileManager.SearchPathDirectory.userDirectory)
    }
}

//
//  DSPaths+User.m
//  Pods
//
//  Created by Danny Sung on 05/07/2015.
//
//
