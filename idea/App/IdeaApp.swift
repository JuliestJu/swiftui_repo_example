//
//  ideaApp.swift
//  idea
//
//  Created by Юлія Воротченко on 16.01.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct IdeaApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            AppView(store: self.appDelegate.store)
        }
        .onChange(of: self.scenePhase) { _, newPhase in
            self.appDelegate.store.send(.didChangeScenePhase(newPhase))
        }
    }
}
