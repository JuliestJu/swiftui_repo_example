//
//  IdeaItemFeature.swift
//  idea
//
//  Created by Юлія Воротченко on 06.02.2024.
//

import Foundation
import ComposableArchitecture

struct IdeaItemFeature: Reducer {
    struct State: Equatable, Identifiable {
        let id: UUID
        let idea: Idea
    }
    
    enum Action: Equatable {
        enum ViewAction: Equatable {
            case onItemTap
        }
        
        enum Delegate: Equatable {
            case didItemTapped(Idea)
        }
        
        case view(ViewAction)
        case delegate(Delegate)
    }
    
    
    var body: some Reducer<State, Action> {
       
        Reduce { state, action in
            switch action {
            case let .view(viewAction):
                switch viewAction {
                case .onItemTap:
                    return .send(.delegate(.didItemTapped(state.idea)))
                }
            case let .delegate(delegateAction):
                switch delegateAction {
                    
                case .didItemTapped(let idea):
                    print(idea.idea)
                    return .none
                }
            }
        }
    }
}
