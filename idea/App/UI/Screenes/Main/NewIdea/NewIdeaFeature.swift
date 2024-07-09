//
//  NewIdea.swift
//  idea
//
//  Created by Юлія Воротченко on 06.02.2024.
//

import Foundation
import ComposableArchitecture

struct NewIdeaFeature: Reducer {
    
    struct State: Equatable {
        @BindingState var something = ""
        @PresentationState var dialog: ConfirmationDialogState<Action.DialogAction>?
    }
    
    enum Action: Equatable {
        enum ViewAction:  BindableAction, Equatable {
            case onViewLoad
            case onSaveTap
            case binding(BindingAction<State>)
        }
        
        enum DialogAction: Equatable {
            case sameDialogConfirm
        }
        
        enum InternalAction: Equatable {
            case confirmAddNewIdea
        }
        
        enum Delegate: Equatable {
            case didAddIdea
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
        .ifLet(\.$dialog, action: /Action.dialog)
    }
}
