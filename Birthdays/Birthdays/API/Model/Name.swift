//
//  Name.swift
//  Birthdays
//
//  Created by David Norris on 28/03/2022.
//

struct Name: Codable, Hashable {
    
    let title: String?
    let first: String?
    let last: String?
    
    init(
        title: String? = nil,
        first: String? = nil,
        last: String? = nil
    ){
        self.title = title ?? ""
        self.first = first ?? ""
        self.last = last ?? ""
    }
    
    public var fullName: String {
        
        var fullName = ""
        
        if let first = first {
            fullName += first
        }
        if let last = last {
            fullName += " " + last
        }
        
        return fullName.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}


