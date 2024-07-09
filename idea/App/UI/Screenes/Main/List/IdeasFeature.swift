//
//  ListFeature.swift
//  idea
//
//  Created by Юлія Воротченко on 06.02.2024.
//

import Foundation
import ComposableArchitecture
import CasePaths

struct IdeasFeature: Reducer {
    
    struct State: Equatable {
        var isLoading = false
        var initalItems: IdentifiedArrayOf<IdeaItemFeature.State> = []
        var items: IdentifiedArrayOf<IdeaItemFeature.State> = []
        var path = StackState<Path.State>()
    }
    
    @CasePathable
    enum Action: BindableAction, Equatable {
        
        enum ViewAction: Equatable {
            case onViewLoad
            case onPulledToRefresh
        }
        
        enum InternalAction: Equatable {
            case loadIdeas
            case ideasResponse(TaskResult<[Idea]>)
            case processItems([Idea])
        }
        
        enum Delegate: Equatable {
            case didFavoriteChanged(Bool, Idea)
        }
        
        case view(ViewAction)
        case `internal`(InternalAction)
        case delegate(Delegate)
        case binding(BindingAction<State>)
        case idea(id: IdeaItemFeature.State.ID, action: IdeaItemFeature.Action)
        case path(StackAction<Path.State, Path.Action>)
        
    }
    
    struct Path: Reducer {
        enum State: Equatable {
            case details(IdeaDetailsFeature.State)
        }
        
        enum Action: Equatable {
            case details(IdeaDetailsFeature.Action)
        }
        
        var body: some Reducer<State, Action> {
            Scope(state: /State.details, action: /Action.details) {
                IdeaDetailsFeature()
            }
        }
    }
    
    private enum CancelID { case ideas }
    
    @Dependency(\.uuid) var uuid
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                // view actions
            case let .view(viewAction):
                switch viewAction {
                case .onViewLoad:
                    state.isLoading = true
                    return .send(.internal(.loadIdeas))
                case .onPulledToRefresh:
                    state.isLoading = true
                    return .send(.internal(.loadIdeas))
                }
                // internal actions
            case let .internal(internalAction):
                switch internalAction {
                case .loadIdeas:
                    state.isLoading = false
                    state.initalItems = IdentifiedArrayOf(uniqueElements: Idea.sampleArray().map {
                        IdeaItemFeature.State(id: UUID(), idea: $0)})
                    return .run { _ in
                       print("RUNNNN")
                    }.cancellable(id: CancelID.ideas)
                    
                case .processItems(_):
                    return .none
                case .ideasResponse:
                    return .none
                }
                //idea item(cell) actions
            case let .idea(_, ideaAction):
                switch ideaAction {
                case .view:
                    return .none
                case let .delegate(ideaItemDelegate):
                    switch ideaItemDelegate {
                    case let .didItemTapped(item):
                        state.path.append(.details(.init(id:  self.uuid(), idea: item)))
                        return .none
                    }
                }
                // path actions
            case let .path(pathAction):
                switch pathAction {
                default:
                    return .none
                }
                
            case .delegate, .binding:
                return .none
            }
        }
        .forEach(\.initalItems, action: /Action.idea(id:action:)) {
            IdeaItemFeature()
        }
        .forEach(\.path, action: /Action.path) {
            Path()
        }
    }
}
