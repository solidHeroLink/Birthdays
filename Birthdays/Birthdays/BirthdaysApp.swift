//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by David Norris on 28/03/2022.
//

import SwiftUI

@main
struct BirthdaysApp: App {
    @StateObject private var birthdayViewModel = BirthdayViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(birthdayViewModel)
                .onAppear() {
                    fetch()
                }
        }
    }
    
    func fetch() {
        
        birthdayViewModel.fetch() { err in
            if let err = err {
                print(err)
                return
            }
            print("Successfully fetched  \(birthdayViewModel.response.results.count) people")
        }
    }
}
