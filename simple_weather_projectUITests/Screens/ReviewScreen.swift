//
//  ReviewScreen.swift
//  simple_weather_projectUITests
//
//  Created by Auntor Acharja on 8/1/23.
//

import Foundation
import XCTest

let utils = Utils()
class ReviewScreen:BaseTest{

    func enterCityName(cityName:String){
       var searchTextField =  app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .textField).element
        searchTextField.tap()
        searchTextField.typeText(cityName)
        app/*@START_MENU_TOKEN@*/.buttons["Go"]/*[[".keyboards",".buttons[\"go\"]",".buttons[\"Go\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.wait(for: XCUIApplication.State.unknown, timeout: 10)
    }
    
    
    func getEnvironmentStatus() -> String
    {
        return app.staticTexts.element(boundBy:0).label
    }
}
