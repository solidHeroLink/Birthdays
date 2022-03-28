//
//  CircleView.swift
//  Birthdays
//
//  Created by David Norris on 28/03/2022.
//

import SwiftUI

struct CircleView: View {
    var name: String = "Will Kenny"
    var width: CGFloat = 69
    var height: CGFloat = 69
    var fontSize: CGFloat = 32
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("circleBackground"))
            Text(name.initials)
                .font(.system(size: fontSize))
                .fontWeight(.bold)
        }
        .frame(width: width, height: height)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
