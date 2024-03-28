//
//  DSPaths+Temp.h
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//
import Foundation

extension DSPaths {
    /// Get the full path to the Temp Directory.
    /// - Returns: Full path to the NSTempDirectory.
    /// @retval nil if not available
    class var tempDirectory: String {
        return NSTemporaryDirectory()
    }

    /// Append path components to the Temp Directory.
    /// - Parameter pathComponents: path components to append
    /// - Returns: full path to components in NSTempDirectory
    /// @retval nil if NSTempDirectory could not be determined.
    /// @retval nil if pathComponenets is nil
    class func temp(withPathComponents pathComponents: [String]) -> String {
        let path = self.tempDirectory
        if pathComponents.isEmpty {
            return path
        }

        var array = [path]

        array.append(contentsOf: pathComponents)

        let rtn = NSString.path(withComponents: array)

        return rtn
    }

    /// Get the full path to a file within the Temp Directory.
    /// - Parameter filename: name to add to Temp Directory
    /// - Returns: Full path to file in NSTempDirectory
    /// @retval nil if not NSCachesDirectory could not be determined.
    /// @retval nil if filename is nil
    /// @
    class func temp(withFile filename: String) -> String {
        return self.temp(withPathComponents: [filename].compactMap { $0 })
    }

    /// Get the full path to the Temp Directory and create it if necessary.
    /// - Parameters:
    ///   - shouldCreate: Specify \em TRUE to create the path and intermediate paths if necessary.
    ///   - errorOut: On input, a pointer to an error object. If an error occurs, this pointer is set to an actual error object containing the error information. You may specify \em nil for this parameter if you do not want the error information.
    /// - seealso: tempDirectory
    /// - Returns: full path to Temp Directory
    class func tempDirectoryCreateIfNecessary(_ shouldCreate: Bool) throws -> String {

        let path = self.tempDirectory

        if shouldCreate {
            try self.createDirectory(path)
        }

        return path
    }
}

//
//  DSPaths+Temp.m
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//
