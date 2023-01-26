import XCTest
import Foundation

extension XCUIElement {
    func assertContains(text: String) {
        let predicate = NSPredicate(format: "label CONTAINS[c] %@", text)
        let elementQuery = staticTexts.containing(predicate)
        XCTAssertTrue(elementQuery.count > 0)
    }
}
