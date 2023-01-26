//
//  XCTestCase.swift
//  simple_weather_projectUITests
//
//  Created by Auntor Acharja on 26/1/23.
//

import Foundation
import XCTest

extension XCTestCase {
    func takeScreenshot(name: String) {
      let fullScreenshot = XCUIScreen.main.screenshot()
      let screenshot = XCTAttachment(uniformTypeIdentifier: "public.png", name: "Screenshot-\(name)-\(UIDevice.current.name).png", payload: fullScreenshot.pngRepresentation, userInfo: nil)
        screenshot.lifetime = .deleteOnSuccess
      add(screenshot)
    }
}
