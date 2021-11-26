//
//  ImageRowView.swift
//  examen-ios
//
//  Created by Carlos Ponce on 21/11/21.
//

import SwiftUI
import Combine

struct ImageRowView: View {
    @Binding var userViewModel: UserViewModel
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Image(uiImage: userViewModel.image)
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

