//
//  PersonDetailView.swift
//  Birthdays
//
//  Created by David Norris on 28/03/2022.
//

import SwiftUI

struct PersonDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var person: Person = Person()
    
    var body: some View {
        VStack(spacing: 0){
            CircleView(
                name: person.name.fullName,
                width: 137,
                height: 137,
                fontSize: 64
            )
            .padding(.top, 71)
            
            HStack(spacing:0){
                Text(person.name.fullName)
                    .font(.system(size: 36))
            }
            .padding(.top, 27)
            
            HStack(spacing:0){
                Text(person.dob.yearsOld)
                    .font(.system(size: 13))
                    .fontWeight(.bold)
            }
            .padding(.top, 15)
            
            Button(action: {
                self.mode.wrappedValue.dismiss()
            }, label: {
                HStack{
                    Spacer()
                    Text("GO BACK")
                        .font(.system(size: 13))
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .padding()
                .background(Color.black)
                .frame(height: 45)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2.5)
                .cornerRadius(8)
            })
            .padding(.horizontal)
            .padding(.top, 32)
            
            Spacer()
        }
    }
}

struct PersonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailView()
    }
}
