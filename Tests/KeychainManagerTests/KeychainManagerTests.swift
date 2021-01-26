import Foundation
import XCTest
@testable import KeychainManager

final class KeychainManagerTests: XCTestCase {
    
    override func tearDown() {
        KeychainManager.eraseAll()
        super.tearDown()
    }
    
    func testSaveStringToKeychain() {
        let success = KeychainManager.save(value: "Hello World", key: UUID().uuidString)
        XCTAssertTrue(success)
    }

    func testGetStringFromKeychain() {
        let key = UUID().uuidString
        let value = "Hello World"
        KeychainManager.save(value: value, key: key)
        
        let fetchedData = KeychainManager.get(forKey: key) as? String
        XCTAssertNotNil(fetchedData)
        XCTAssertEqual(fetchedData, value)
    }
    
    func testGetIntWithTypeFromKeychain() {
        let key = UUID().uuidString
        let value = 0001
        KeychainManager.save(value: value, key: key)
            
        let fetchedData = KeychainManager.get(forKey: key, asType: Int.self)
        XCTAssertNotNil(fetchedData)
        XCTAssertEqual(fetchedData, value)
        
    }
    
    func testUpdateValueInKeychain() {
        let key = UUID().uuidString
        let originalValue = "Hello World"
        let updatedValue = 2021
        
        KeychainManager.save(value: originalValue, key: key)
        let updateResult = KeychainManager.update(value: updatedValue, forKey: key)
        XCTAssertTrue(updateResult)
        let getUpdatedResult = KeychainManager.get(forKey: key, asType: Int.self)
        XCTAssertEqual(getUpdatedResult, updatedValue)
    }
    
    func testErase() {
        let key = UUID().uuidString
        KeychainManager.save(value: "Hello World", key: key)
        
        let erase = KeychainManager.erase(key: key)
        XCTAssertTrue(erase)
    }
    
    func testEraseAll() {
        let firstKey = UUID().uuidString
        let secondKey = UUID().uuidString
        
        KeychainManager.save(value: "Hello", key: firstKey)
        KeychainManager.save(value: "World", key: secondKey)

        KeychainManager.eraseAll()
        
        let firstKeyGetResult = KeychainManager.get(forKey: firstKey) as? String
        let secondKeyGetResult = KeychainManager.get(forKey: secondKey, asType: String.self)
        
        XCTAssertNil(firstKeyGetResult)
        XCTAssertNil(secondKeyGetResult)
    }
    
    static var allTests = [
        ("testSaveStringToKeychain", testSaveStringToKeychain),
        ("testGetStringToKeychain", testGetStringFromKeychain),
        ("testGetStringWithTypeFromKeychain", testGetIntWithTypeFromKeychain),
        ("testUpdateValueInKeychain", testUpdateValueInKeychain),
        ("testErase", testErase),
        ("testEraseAll", testEraseAll),
    ]
}
