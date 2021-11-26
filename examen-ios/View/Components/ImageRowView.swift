//
//  ImageRowView.swift
//  examen-ios
//
//  Created by Carlos Ponce on 21/11/21.
//

import SwiftUI
import Combine

struct ImageRowView: View {
    @State var updatedImage = false
    @Binding var ImageSelected: UIImage
    
    var body: some View {
        
        let img = ImageSelected == UIImage() ? UIImage(systemName: "person.fill") : ImageSelected
    
        ZStack {
            VStack {
                ZStack {
                    Image(uiImage: img ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color("invertColor"), lineWidth:1))
                        .frame(width: 200, height: 200, alignment: .center)
                }
            }
            VStack{
                Spacer()
                Image(systemName: "camera.fill")
                    .resizable()
                    .foregroundColor(Color.blue)
                    .frame(width: 25, height: 20, alignment: .bottomTrailing)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 13)
                    .background(Color("invertColor"))
                    .cornerRadius(30)
                    .offset(x: 90, y: -10)
            }
        }
        
    }
}

