//
//  PersonView.swift
//  Birthdays
//
//  Created by David Norris on 28/03/2022.
//

import SwiftUI

struct PersonView: View {
    var person: Person = Person()
    var body: some View {
        HStack() {
            VStack(alignment: .leading, spacing: 0) {
                HStack{
                    Text(person.name.fullName)
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                }
                HStack{
                    Text(person.dob.birthday)
                        .font(.system(size: 13))
                }
                .padding(.top, 6)
                Spacer()
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
