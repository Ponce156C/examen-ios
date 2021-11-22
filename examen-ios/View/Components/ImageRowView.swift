//
//  ImageRowView.swift
//  examen-ios
//
//  Created by Carlos Ponce on 21/11/21.
//

import SwiftUI
import Combine

struct ImageRowView: View {
//    @State var userImage = "person.fill"
    @State var updatedImage = false
    @Binding var ImageSelected: UIImage
    
    var body: some View {
        ZStack {
//            ImageRowView(userImage: userImage!)
            VStack {
                ZStack {
                    Image(uiImage: self.ImageSelected)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250, alignment: .center)
                        .cornerRadius(125)
                    Circle()
                        .stroke(Color("invertColor"), lineWidth: 2)
                        .frame(width: 250, height: 250)
                }
            }
            VStack{
                Spacer()
                Image(systemName: "camera.fill")
                    .resizable()
                    .foregroundColor(Color.blue)
                    .frame(width: 35, height: 30, alignment: .bottomTrailing)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 13)
                    .background(Color("invertColor"))
                    .cornerRadius(30)
                    .offset(x: 90, y: -10)
            }
        }
        
    }
}

