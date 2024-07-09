//
//  MainFeature.swift
//  idea
//
//  Created by Юлія Воротченко on 22.01.2024.
//

import SwiftUI
import ComposableArchitecture

enum Tab: Int, CaseIterable {
    case home = 0
    case search
    case settings
    
    var icon: String {
        switch self {
        case .home: return "home"
        case .settings: return "settings"
        case .search: return "search"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .settings: return "Settings"
        case .search: return "Search"
        }
    }
}

struct MainFeature: Reducer {
    
    struct State: Equatable {
        @BindingState var currentTab = Tab.home
        var ideas = IdeasFeature.State()
        var account = AccountFeature.State()
        var newIdea = NewIdeaFeature.State()
    }
    
    @CasePathable
    enum Action: Equatable {
        
        enum ViewAction: BindableAction, Equatable {
            case binding(BindingAction<State>)
        }
        
        case view(ViewAction)
        case onTabChanged(Tab)
        case ideas(IdeasFeature.Action)
        case account(AccountFeature.Action)
        case newIdea(NewIdeaFeature.Action)
        
        enum Delegate: Equatable {
            case didLogout
        }
        
        case delegate(Delegate)
    }
    
    var body: some Reducer<State, Action> {
        Scope(state: \.ideas, action: /Action.ideas) {
            IdeasFeature()
        }
        Scope(state: \.account, action: /Action.account) {
            AccountFeature()
        }
        Scope(state: \.newIdea, action: /Action.newIdea) {
            NewIdeaFeature()
        }
        BindingReducer(action: /Action.view)
        Reduce { state, action in
            switch action {
            case let .onTabChanged(tab):
                state.currentTab = tab
                return .none
            case .ideas(.delegate(.didFavoriteChanged)):
                return .none
            case .account:
                return .none
            case .delegate:
                return .none
            case .view(.binding):
                return .none
            case .view(.binding(\.$currentTab)):
                return .none
            case .ideas:
                return .none
            case .newIdea:
                return .none
            }
        }
    }
}
