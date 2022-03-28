//
//  PersonRowView.swift
//  Birthdays
//
//  Created by David Norris on 28/03/2022.
//

import SwiftUI

struct PersonRowView: View {
    
    var person: Person = Person()
    
    var body: some View {
        NavigationLink(destination: {
            PersonDetailView(person: person)
                .navigationBarHidden(true)
        }, label: {
            VStack(spacing:0) {
                HStack(spacing:0){
                    CircleView(name: person.name.fullName)
                    
                    PersonView(person: person)
                    
                    Spacer()
                }
            }
            .padding(.top, 12)
            .padding(.bottom, 16)
            .padding(.horizontal)
        }).buttonStyle(PlainButtonStyle())
    }
}

struct PersonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PersonRowView()
    }
}
