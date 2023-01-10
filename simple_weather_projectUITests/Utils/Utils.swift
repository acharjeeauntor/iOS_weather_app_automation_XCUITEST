//
//  Utils.swift
//  simple_weather_projectUITests
//
//  Created by Auntor Acharja on 8/1/23.
//

import Foundation

class Utils{
    
    
    struct WeatherData: Codable {
        let name: String
        let message: String?
        let main: Main
        let weather: [Weather]
        let sys: Sys
    }

    struct Main: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Double
        let humidity: Double
    }

    struct Weather: Codable {
        let id: Int
        let main:String
        let description: String
        let icon: String
    }

    struct Sys: Codable {
        let country: String
    }
    

        func getWeatherData(city:String,apicompletionHandler: @escaping (_ data:WeatherData?) -> Void){
        let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=imperial&appid=ae33ba58ccfc685593adadaaac3626da"
        let urlString = "\(weatherURL)&q=\(city)"

        let apicall = URLSession.shared.dataTask(with:URL(string: urlString)!,completionHandler: { (data, response, error ) -> Void in
            guard let data = data , error == nil else{
                print("Somthing Wrong..")
                return
            }

            var result:WeatherData?
            do{
                result = try JSONDecoder().decode(WeatherData.self, from: data)
            }catch{
                print("Somting Wrong in API, \(error.localizedDescription)")
            }

            if let data = result{
                apicompletionHandler(data)
            }else{
                print("Weather data is nill")
            }
        })

        apicall.resume()
    }

    
}
