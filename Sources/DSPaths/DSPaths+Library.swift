//
//  DSPaths+Library.swift
//
//  Created by Danny Sung on 05/06/2015.
//
//
import Foundation

public extension DSPaths {
    /// Get the full path to the Library Directory.
    /// - Returns: Full path to the NSLibraryDirectory.
    /// @retval nil if not available
    class var libraryDirectory: String {
        self.path(with: FileManager.SearchPathDirectory.libraryDirectory)!
    }

    /// Get the full path to a file within the Library Directory.
    /// - Parameter filename: name to add to Library Directory
    /// - Returns: Full path to file in NSLibraryDirectory
    /// @retval nil if not NSLibraryDirectory could not be determined.
    /// @retval nil if filename is nil
    /// @
    class func library(withFile filename: String) -> String {
        return self.path(withFile: filename, in: FileManager.SearchPathDirectory.libraryDirectory)
    }

    /// Append path components to the Library Directory.
    /// - Parameter pathComponents: path componoents to append
    /// - Returns: full path to components in NSLibraryDirectory
    /// @retval nil if NSLibraryDirectory could not be determined.
    /// @retval nil if pathComponenets is nil
    class func library(withPathComponents pathComponents: [String]) -> String {
        return self.path(withComponents: pathComponents, in: FileManager.SearchPathDirectory.libraryDirectory)!
    }
}
