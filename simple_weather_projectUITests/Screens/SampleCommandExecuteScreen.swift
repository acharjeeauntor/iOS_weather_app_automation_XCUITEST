//
//  SampleCommandExecuteScreen.swift
//  simple_weather_projectUITests
//
//  Created by Auntor Acharja on 27/1/23.
//

import Foundation
import NMSSH

class SampleCommandExecuteScreen{
    
    let host = ServerConfig.host.rawValue
    let userName = ServerConfig.userName.rawValue
    let password = ServerConfig.password.rawValue
    
    
    func getAccountCodeFromAsterisk(didNumber:String) -> String{
        let session = NMSSHSession(host:host, andUsername:userName)
        session.connect()
        session.authenticate(byPassword:password)
        let response = session.channel.execute("asterisk -rx 'sip show peer \(didNumber)' | grep -w Accountcode",error: nil)
        session.disconnect()
        print("Response: \(response)")
        let accountCode = String(response.split(separator: ":")[1]).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return accountCode 
    }
}
