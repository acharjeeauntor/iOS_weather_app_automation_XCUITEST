//
//  ReviewScreenTest.swift
//  simple_weather_projectUITests
//
//  Created by Auntor Acharja on 8/1/23.
//

import XCTest

//let utils = Utils()

class ReviewScreenTest:BaseTest{
    let reviewScreen = ReviewScreen()
    
    
    
    // Test Data
    let cityName = ReviewScreenData.cityName.rawValue
    
    
    

    // TC1: Verify for Searched city, City Name,Current Environment Status,Temp are showing properly or not
    func test1(){
        reviewScreen.enterCityName(cityName: cityName)
        
        // Actual Result
        let actualStatus = reviewScreen.getEnvironmentStatus()
        let actualCityName = reviewScreen.getCityName()
        let actualTempValue = reviewScreen.getTemp()
        
        
        
        
        utils.getWeatherData(city:cityName,apicompletionHandler:{ (data) in
            if let apidata = data{
                
                // Expected Result
                let expectedStatus = apidata.weather[0].main
                let expectedCityName = apidata.name
                let expectedTempValue = String(round(apidata.main.temp))
                
                
                
                
                
                
                
                
                
                
                XCTAssertEqual(expectedCityName, actualCityName)
                XCTAssertEqual(expectedStatus, actualStatus)
                XCTAssertEqual(expectedTempValue, actualTempValue)
            }else{
                print("Weather Data is nill")
            }
            })
        
    }
}

