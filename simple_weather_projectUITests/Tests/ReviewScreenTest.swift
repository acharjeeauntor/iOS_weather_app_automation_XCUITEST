//
//  ReviewScreenTest.swift
//  simple_weather_projectUITests
//
//  Created by Auntor Acharja on 8/1/23.
//

import XCTest

class ReviewScreenTest:BaseTest{

    let reviewScreen = ReviewScreen()
    let weatherManager = WeatherManager()
    let utils = Utils()
    
    // Test Data
    lazy var cityName = utils.getReviewScreenTestData().cityName
    
    
    // TC1: Verify for Searched city, City Name,Current Environment Status,Temp are showing Correctly or not
    func test1_Basic_Temp_Check(){
        takeScreenshot(name: "test1_Basic_Temp_Check")
        reviewScreen.enterCityName(cityName: cityName)
  
      
        // Actual Result
        let actualStatus = reviewScreen.getEnvironmentStatus().lowercased()
        let actualCityName = reviewScreen.getCityName()
        let actualTempValue = reviewScreen.getTemp()
        
        
        
        utils.getWeatherData(city:cityName,apicompletionHandler:{ (data) in
            if let apidata = data{
                
                // Expected Result
                let expectedStatus = apidata.weather[0].description
                let expectedCityName = apidata.name
                let tempValue = String(round(apidata.main.temp))
                let expectedTempValue = String(tempValue.split(separator: ".")[0])

             
                XCTAssertEqual(expectedCityName, actualCityName,"City Name is incorrect")
                XCTAssertEqual(expectedStatus, actualStatus,"Current environment status is incorrect")
                XCTAssertEqual(expectedTempValue, actualTempValue,"Current Temp is incorrect")
            }else{
                print("Weather Data is nill")
            }
            })
        
    }
    
    
    // TC2: Verify for Searched city, Max/Min Temp,Pressure,Humidity,Feels Like are showing Correctly or not
    func test2_Advance_Temp_Check(){
        takeScreenshot(name: "test2_Advance_Temp_Check")
        reviewScreen.enterCityName(cityName: cityName)
        
        // Actual Result
        let actualFeelsLikeValue = reviewScreen.getFeelsLikeData()
        let actualMinTempValue = reviewScreen.getMinTempData()
        let actualMaxTempValue = reviewScreen.getMaxTempData()
        let actualPressureValue = reviewScreen.getPressureData()
        let actualHumidityValue = reviewScreen.getHumidityData()
        
        
        
        utils.getWeatherData(city:cityName,apicompletionHandler:{ (data) in
            if let apidata = data{
                
                // Expected Result
                let feelsLikeValue = String(round(apidata.main.feels_like))
                let expectedFeelsLikeValue = String(feelsLikeValue.split(separator: ".")[0])+" ºC"
                
                let minTempValue = String(round(apidata.main.temp_min))
                let expectedMinTempValue = String(minTempValue.split(separator: ".")[0])+" ºC"
                
                let maxTempValue = String(round(apidata.main.temp_max))
                let expectedMaxTempValue = String(maxTempValue.split(separator: ".")[0])+" ºC"
                
                let pressureValue = String(round(apidata.main.pressure))
                let expectedPressureValue = String(pressureValue.split(separator: ".")[0])+" hPa"
                
                let humidityValue = String(round(apidata.main.humidity))
                let expectedHumidityValue = String(humidityValue.split(separator: ".")[0])+" %"
                

                                
                XCTAssertEqual(expectedFeelsLikeValue, actualFeelsLikeValue,"Feels Like Value is incorrect")
                XCTAssertEqual(expectedMinTempValue, actualMinTempValue,"Min Temp Value is incorrect")
                XCTAssertEqual(expectedMaxTempValue, actualMaxTempValue,"Max Temp Value is incorrect")
                XCTAssertEqual(expectedPressureValue, actualPressureValue,"Pressure Value is incorrect")
                XCTAssertEqual(expectedHumidityValue, actualHumidityValue,"Humidity Value is incorrect")
            }else{
                print("Weather Data is nill")
            }
            })
        
    }
    
    
    // TC3: Get Location name from main project function return value
    func test3_Peoject_Function_call(){
       // takeScreenshot(name: "test3_Peoject_Function_call")
        
        // weatherManager.getAddress(name: cityName), Here getAddress() is the public function of WeatherManager class which is created inside project core file.
        let returnValue = weatherManager.getAddress(name: cityName)
        let expectedValue = "Your Location is: \(cityName)"
        XCTAssertEqual(expectedValue, returnValue,"Location name is incorrect")
        
    }
    
}

