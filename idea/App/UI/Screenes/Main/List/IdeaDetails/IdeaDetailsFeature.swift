//
//  IdeaDetailsFeature.swift
//  idea
//
//  Created by Юлія Воротченко on 06.02.2024.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct IdeaDetailsFeature: Reducer {
    
    struct State: Equatable, Identifiable {
        let id: UUID
        let idea: Idea
              
    }
    
    enum Action: Equatable {
        enum ViewAction: Equatable {
            case onViewAppear
        }
        
        enum InternalAction: Equatable {
            case loadIdeas
        }

        case view(ViewAction)
        case `internal`(InternalAction)
      
    }
    
    @Dependency(\.dismiss) var dismiss
    
    var body: some Reducer<State, Action> {
        
        Reduce { state, action in
            switch action {
            case let .view(viewAction):
                switch viewAction {
                case .onViewAppear:
                    return .concatenate(
                        .send(.internal(.loadIdeas))
                    )
                }
                
            // internal actions
            case let .internal(internalAction):
                switch internalAction {
                case .loadIdeas:
                    return .none
                }
            }
        }
    }
}
