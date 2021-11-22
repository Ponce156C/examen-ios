//
//  examen_iosApp.swift
//  examen-ios
//
//  Created by Carlos Ponce on 20/11/21.
//

import SwiftUI
import PartialSheet

@main
struct examen_iosApp: App {
    let sheetManager: PartialSheetManager = PartialSheetManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sheetManager)
        }
    }
}
