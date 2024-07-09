//
//  AppFeature.swift
//  idea
//
//  Created by Юлія Воротченко on 18.01.2024.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct AppFeature: Reducer {

    enum State: Equatable {
        case loading(LoadingFeature.State)
        case main(MainFeature.State)
        
        public init() { self = .loading(LoadingFeature.State())}
    }
    
    enum Action: Equatable {
        enum AppDelegateAction: Equatable {
            case didFinishLaunching
        }
        
        case appDelegate(AppDelegateAction)
        case didChangeScenePhase(ScenePhase)
        
        case loading(LoadingFeature.Action)
        case main(MainFeature.Action)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .appDelegate(appDelegateAction):
                return self.performAppDelegateAction(appDelegateAction)
            case let .didChangeScenePhase(phase):
                Log.info("didChangeScenePhase \(phase)")
                return .none
            case let .loading(action: .delegate(loadingAction)):
                switch loadingAction {
                case .didLoaded:
                    state = .main(MainFeature.State())
                }
                return .none
            case let .main(action: .delegate(mainAction)):
                switch mainAction {
                case .didLogout:
                    return .none
                }
            case .loading, .main:
                return .none
            }
        }
        .ifCaseLet(/State.loading, action: /Action.loading) {
            LoadingFeature()
        }
        .ifCaseLet(/State.main, action: /Action.main) {
            MainFeature()
        }
    }
    
    private func performAppDelegateAction(_ action: AppFeature.Action.AppDelegateAction) -> Effect<AppFeature.Action> {
        switch action {
        case .didFinishLaunching:
            //here we configure whole app things, later here will configure storage and cloudkit, usernotifications etc
            Log.initialize()
            return .none
        }
    }
}
