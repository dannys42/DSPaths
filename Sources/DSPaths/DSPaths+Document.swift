//
//  DSPaths+Document.h
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//
import Foundation

extension DSPaths {
    /// Get the full path to the Documents Directory.
    /// - Returns: Full path to the NSDocumentDirectory.
    /// @retval nil if not available
    class func documentDirectory() -> String? {
        return self.path(with: FileManager.SearchPathDirectory.documentDirectory)
    }

    /// Get the full path to a file within the Documents Directory.
    /// - Parameter filename: name to add to Documents Directory
    /// - Returns: Full path to file in NSDocumentDirectory
    /// @retval nil if not NSDocumentDirectory could not be determined.
    /// @retval nil if filename is nil
    /// @
    class func document(withFile filename: String?) -> String? {
        return self.path(withFile: filename, in: FileManager.SearchPathDirectory.documentDirectory)
    }

    /// Append path components to the Documents Directory.
    /// - Parameter pathComponents: path componoents to append
    /// - Returns: full path to components in NSDocumentDirectory
    /// @retval nil if NSDocumentsDirectory could not be determined.
    /// @retval nil if pathComponenets is nil
    class func document(withPathComponents pathComponents: [String]?) -> String? {
        return self.path(withComponents: pathComponents, in: FileManager.SearchPathDirectory.documentDirectory)
    }
}

//
//  DSPaths+Document.m
//  Pods
//
//  Created by Danny Sung on 05/06/2015.
//
//
