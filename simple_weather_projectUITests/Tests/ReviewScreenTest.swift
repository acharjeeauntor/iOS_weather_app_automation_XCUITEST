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

    // TC1: Verify for Searched city, Current Environment Status is showing properly or not
    func test1(){
        reviewScreen.enterCityName(cityName: "Dhaka")
        let actualStatus = reviewScreen.getEnvironmentStatus()
        print("Actual \(actualStatus)")
        utils.getWeatherData(city:"Dhaka",apicompletionHandler:{ (data) in
            if let apidata = data{
                let expectedStatus = apidata.weather[0].main
                print("Expected \(expectedStatus)")
                XCTAssertEqual(expectedStatus, actualStatus)
            }else{
                print("Weather Data is nill")
            }
            })
        
    }
}

