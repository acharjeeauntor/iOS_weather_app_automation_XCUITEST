//
//  CommandExecuteTest.swift
//  simple_weather_projectUITests
//
//  Created by Auntor Acharja on 27/1/23.
//

import Foundation
import XCTest

class CommandExecuteTest:BaseTest{
    
    let sampleCommandExecuteScreen = SampleCommandExecuteScreen()
    let utils = Utils()
    
    // Test Data
    lazy var DID = utils.getCommandTestData().didNumber
    
    
    // TC1: Verify Account code from Asterisk server and DID number is correct or not
    func test1_getAccountCode(){
        let actualAccountCode = sampleCommandExecuteScreen.getAccountCodeFromAsterisk(didNumber: DID)
        XCTAssertEqual(DID,actualAccountCode,"Account code from Asterisk server and DID number is not correct")
    }
}
