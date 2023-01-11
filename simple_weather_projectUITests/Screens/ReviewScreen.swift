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
        app.wait(for: XCUIApplication.State.unknown, timeout:6 )
    }
    
    
    func getEnvironmentStatus() -> String
    {
        return app.staticTexts.element(boundBy:0).label
    }
    
    func getCityName() -> String
    {
        return app.staticTexts.element(boundBy:1).label
    }
    
    func getTemp() -> String
    {
        return app.staticTexts.element(boundBy:2).label
    }
    
    func getFeelsLikeData() -> String
    {
        return app.staticTexts.element(boundBy:7).label
    }
    
    func getMinTempData() -> String
    {
        return app.staticTexts.element(boundBy:9).label
    }
    
    func getMaxTempData() -> String
    {
        return app.staticTexts.element(boundBy:11).label
    }
    
    func getPressureData() -> String
    {
        return app.staticTexts.element(boundBy:13).label
    }
    
    func getHumidityData() -> String
    {
        return app.staticTexts.element(boundBy:15).label
    }
    
}
