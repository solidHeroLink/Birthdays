//
//  ContentView.swift
//  Birthdays
//
//  Created by David Norris on 28/03/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var birthdayViewModel: BirthdayViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                Divider()
                ForEach(birthdayViewModel.response.results, id: \.self) { person in
                    PersonRowView(person: person)
                    Divider()
                        
                }
            }
            .navigationTitle("Birthdays")
            .navigationBarTitleDisplayMode(.inline)
           
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BirthdayViewModel())
    }
}
