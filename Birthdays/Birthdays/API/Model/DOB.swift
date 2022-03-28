//
//  DOB.swift
//  Birthdays
//
//  Created by David Norris on 28/03/2022.
//

import Foundation

struct DOB: Codable, Hashable {
    
    let date: String?
    let age: Int?
    
    
    init(
        date: String? = nil,
        age: Int? = nil
    ){
        self.date = date ?? ""
        self.age = age ?? 0
    }
    
    public var birthday: String {
        guard let date = date else {
            return "n/a"
        }
        
        guard let date = CommonUtils.dateFormatter.date(from: String(date.prefix(10))) else {
            return "n/a"
        }
        let endResult = CommonUtils.birthdayDateFormatter.string(from: date)
        
        return endResult
    }
    
    public var yearsOld: String {
        guard let age = age else {
            return "n/a"
        }
        
        return "\(age) YEARS OLD"
    }
  
}


