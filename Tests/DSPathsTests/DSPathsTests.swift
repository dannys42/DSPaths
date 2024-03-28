import XCTest
@testable import DSPaths

final class DSPathsTests: XCTestCase {
    func testThat_CacheDirectory_IsDefined() {
        XCTAssertNotNil( DSPaths.cacheDirectory() )
    }

    func testThat_DocumentDirectory_IsDefined() {
        XCTAssertNotNil( DSPaths.documentDirectory() )
    }

    func testThat_CustomarySupportDirectory_IsDefined() {
        XCTAssertNotNil( DSPaths.customarySupportDirectory() )
    }

    func testThat_SupportDirectory_IsDefined() {
        XCTAssertNotNil( DSPaths.supportDirectory() )
    }

    func testThat_LibraryDirectory_IsDefined() {
        XCTAssertNotNil( DSPaths.libraryDirectory() )
    }

    func testThat_TemporaryDirectory_IsDefined() {
        XCTAssertNotNil( DSPaths.tempDirectory() )
    }

}
