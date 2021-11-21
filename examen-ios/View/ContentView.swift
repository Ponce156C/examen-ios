//
//  ContentView.swift
//  examen-ios
//
//  Created by Carlos Ponce on 20/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing:5) {
            TextFieldRowView(name: "")
            Spacer()
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
