//
//  SampleCommandExecuteScreen.swift
//  simple_weather_projectUITests
//
//  Created by Auntor Acharja on 27/1/23.
//

import Foundation
import NMSSH

class SampleCommandExecuteScreen{
    
    
    func getAccountCodeFromAsterisk(didNumber:String) -> String{
        let session = NMSSHSession(host: "192.168.30.9", andUsername: "root")
        session.connect()
        session.authenticate(byPassword: "honagcg1230")
        let response = session.channel.execute("asterisk -rx 'sip show peer \(didNumber)' | grep -w Accountcode",error: nil)
        session.disconnect()
        print("Response: \(response)")
        let accountCode = String(response.split(separator: ":")[1]).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return accountCode 
    }
}
