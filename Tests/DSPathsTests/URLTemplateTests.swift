import XCTest
@testable import DSPaths

final class URLTemplateTests: XCTestCase {

    func testThat_DocumentDirectory_CanContract() {
        let observedValue = URL.contract(with: .documentDirectory())
        let expectedValue = URL(string: "file:///\(kDOCUMENT_DIRECTORY)")!

        XCTAssertEqual(observedValue.absoluteString, expectedValue.absoluteString)
    }

    func testThat_ContractedDocumentDirectory_CanExpand() {
        let inputValue = URL.contract(with: .documentDirectory())
        let expectedValue = URL.documentDirectory()

        let observedValue = URL.expand(with: inputValue)

        XCTAssertEqual(observedValue, expectedValue)
        XCTAssertNotEqual(inputValue, expectedValue)
    }

    func testThat_CustomarySupportDirectory_CanContract() {
        let observedValue = URL.contract(with: .supportDirectory()!)
        let expectedValue = URL(string: "file:///\(kSUPPORT_DIRECTORY)")!

        XCTAssertEqual(observedValue.absoluteString, expectedValue.absoluteString)
    }


    func testThat_CustomPathAfterTemplate_IsPreserved() {
        let inputValue = URL(string: "file:///\(kSUPPORT_DIRECTORY)/a")!
        let expectedValue = [ "a" ]

        let observedValue = URL.expand(with: inputValue)

        let observedComponents = Array(observedValue.pathComponents.suffix(1))

        XCTAssertEqual(observedComponents, expectedValue)
    }


    func testThat_CustomSubPathAfterTemplate_IsPreserved() {
        let inputValue = URL(string: "file:///\(kSUPPORT_DIRECTORY)/a/b/c")!
        let expectedValue = [ "a", "b", "c" ]

        let observedValue = URL.expand(with: inputValue)

        let observedComponents = Array(observedValue.pathComponents.suffix(3))

        XCTAssertEqual(observedComponents, expectedValue)
    }

    func testThat_ContractedCustomarySupportDirectory_CanExpand() {
        let inputValue = URL.contract(with: .supportDirectory()!)
        let expectedValue = URL.supportDirectory()

        let observedValue = URL.expand(with: inputValue)

        XCTAssertEqual(observedValue, expectedValue)
        XCTAssertNotEqual(inputValue, expectedValue)
    }


    func testThat_NonTemplatableDirectory_RemainsUnchanged() {
        let inputValue = URL(string: "file:///a/b/c")!
        let expectedValue = inputValue

        let observedValue = URL.contract(with: inputValue)
        XCTAssertEqual(observedValue, expectedValue)
    }
}
