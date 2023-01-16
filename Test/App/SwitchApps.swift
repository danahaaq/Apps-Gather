//
//  SwitchApps.swift
//  Test
//
//  Created by Aldanah Alqbbani on 23/06/1444 AH.
//

import Foundation
import SwiftUI

struct SwitchApps: View {
    var body: some View{
        NavigationView{
            Form{
                Section(""){
                    NavigationLink {
                        ContentView()
                    } label: {
                        Label("Change Object based on user tap App", systemImage: "folder")
                    }
                    NavigationLink {
                        ScanApp()
                    } label: {
                        Label("Scan App", systemImage: "folder")
                    }
                    NavigationLink {
                        SpeachApp()
                    } label: {
                        Label("Speach App", systemImage: "folder")
                    }
                    
                    NavigationLink {
                        WeSplitApp()
                    } label: {
                        Label("We Split App", systemImage: "folder")
                    }
                    NavigationLink {
                        Temperature_conversion()
                    } label: {
                        Label("Temperature conversion App ", systemImage: "folder")
                    }
                    NavigationLink {
                        Guess_the_Flag()
                    } label: {
                        Label("Guess the Flag App ", systemImage: "folder")
                    }
                    NavigationLink {
                        BetterSleep()
                    } label: {
                        Label("Better Sleep App ", systemImage: "folder")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Applications")
        }
    }
}
struct SwitchApps_Previews:PreviewProvider{
    static var previews: some View {
        SwitchApps()
    }
}
