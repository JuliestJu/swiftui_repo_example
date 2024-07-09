//
//  AccountFeature.swift
//  idea
//
//  Created by Юлія Воротченко on 06.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct AccountFeature: Reducer {
    
    struct State: Equatable {
        var accountId: UUID? = nil
        let appVersion = "\(Configuration.current.appVersion)"
        let supportedVersion = "17.0"
        var notificationsPermissionStatus = ""
        
        @BindingState var name = ""
        @BindingState var enableNotifications = false
        @BindingState var email = ""
    }
    
    enum Action: Equatable {
        enum ViewAction:  BindableAction, Equatable {
            case onViewLoad
            case onSaveTap
            case onPermissionsTap
            case onLogoutTap
            case binding(BindingAction<State>)
        }
        
        enum DialogAction: Equatable {
            case onConfirmLogout
        }
        
        enum InternalAction: Equatable {
            case notificationPermissionsStatusResult(UNAuthorizationStatus)
            case confirmLogout
        }
        
        enum Delegate: Equatable {
            case didLogout
        }
        
        case view(ViewAction)
        case `internal`(InternalAction)
        case delegate(Delegate)
        case dialog(PresentationAction<Action.DialogAction>)
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer(action: /Action.view)
        
        Reduce { state, action in
            switch action {
                //View Action
            case .view:
                return .none
                //Internal
            case .internal:
                return .none
                //Delegate
            case .delegate:
                return .none
                //Dialog
            case .dialog:
                return .none
            }
        }
    }
}
