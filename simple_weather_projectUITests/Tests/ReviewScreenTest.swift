//
//  ReviewScreenTest.swift
//  simple_weather_projectUITests
//
//  Created by Auntor Acharja on 8/1/23.
//

import XCTest

class ReviewScreenTest:BaseTest{
    let reviewScreen = ReviewScreen()

    func test1(){
        reviewScreen.getWeatherDataByCity(city: "Dhaka")
    }
}

