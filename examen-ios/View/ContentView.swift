//
//  ContentView.swift
//  examen-ios
//
//  Created by Carlos Ponce on 20/11/21.
//

import SwiftUI
import UIKit
import PartialSheet

struct ContentView: View {
    @State private var isCamera = false
    @State private var isLibrary = false
    @State private var isGraphicsPrensent = false
    
    @EnvironmentObject var partialSheetManager : PartialSheetManager
    var graphicViewModel = GraphicsViewModel()
    @State var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack (spacing:10) {
//                  MARK: User Name Row
                    TextFieldRowView(name: userViewModel.name, viewModel: $userViewModel)
//                  MARK: User Image Row
                    Button(action: {
                        self.partialSheetManager.showPartialSheet {
                            SourceTypeSelectView(isLibrary: $isLibrary, isCamera: $isCamera)
                        }
                    }) {
                        ImageRowView(userViewModel: self.$userViewModel)
                    }
//                  MARK: Graphics Row
                    NavigationLink(destination: GraphicsView(viewModel: graphicViewModel)) {
                            Text("Gráficas")
                                .frame(width: 150, alignment: .center)
                                .padding(20)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(10)
                        }
                    Spacer()
                }
                .padding(.horizontal)
//               MARK: Present Views
                .fullScreenCover(isPresented: $isLibrary, content: {
                    ImagePicker(sourceType: .photoLibrary, partialSheetManager: _partialSheetManager, viewModel: self.$userViewModel)
                })
                .fullScreenCover(isPresented: $isCamera, content: {
                    ImagePicker(sourceType: .camera, partialSheetManager: _partialSheetManager, viewModel: self.$userViewModel)
                })
                .fullScreenCover(isPresented: $isGraphicsPrensent, content: {})
            }
            .navigationBarTitle("Examen - ios")
        }
        .addPartialSheet(style: .defaultStyle())
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
