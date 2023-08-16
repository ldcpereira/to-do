//
//  ToDoApp.swift
//  ToDo
//
//  Created by Lucas Pereira on 13/06/23.
//

import GoogleMobileAds
import SwiftUI

@main
struct ToDoApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            if case .active = newScenePhase {
                initMobileAds()
            }
        }
    }
    
    func initMobileAds() {
        GADMobileAds.sharedInstance().start(completionHandler: {_ in
            print("batata")
        })
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [GADSimulatorID]
        // Comment this if want SDK Crash Reporting
        //GADMobileAds.sharedInstance().disableSDKCrashReporting()
    }
}
