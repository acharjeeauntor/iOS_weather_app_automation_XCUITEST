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
    
    // Identifiers
    private var searchFieldIdentifier = "search"
    private var tempTextFieldIdentifier = "temp"
    private var tempStatusTextFieldIdentifier = "status"
    private var cityTextFieldIdentifier = "city"
    private var FeelsLikeTextFieldIdentifier = "feelsLike"
    private var minTempTextFieldIdentifier = "mintemp"
    private var maxTempTextFieldIdentifier = "maxtemp"
    private var humidityTextFieldIdentifier = "humidity"
    private var pressureTextFieldIdentifier = "pressure"
    
    

    func enterCityName(cityName:String){
        var searchField = app.searchFields[searchFieldIdentifier]
        searchField.tap()
        searchField.typeText(cityName)
        app.buttons["Go"].tap()
        app.wait(for: XCUIApplication.State.unknown, timeout:6 )
    }
    
    
    func getEnvironmentStatus() -> String
    {
        return app.staticTexts[tempStatusTextFieldIdentifier].label
    }
    
    func getCityName() -> String
    {
        return app.staticTexts[cityTextFieldIdentifier].label
    }
    
    func getTemp() -> String
    {
        return app.staticTexts[tempTextFieldIdentifier].label
    }
    
    func getFeelsLikeData() -> String
    {
        return app.staticTexts[FeelsLikeTextFieldIdentifier].label
    }
    
    func getMinTempData() -> String
    {
        return app.staticTexts[minTempTextFieldIdentifier].label
    }
    
    func getMaxTempData() -> String
    {
        return app.staticTexts[maxTempTextFieldIdentifier].label
    }
    
    func getPressureData() -> String
    {
        return app.staticTexts[pressureTextFieldIdentifier].label
    }
    
    func getHumidityData() -> String
    {
        return app.staticTexts[humidityTextFieldIdentifier].label
    }
    
}
