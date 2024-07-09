//
//  MainView.swift
//  idea
//
//  Created by Юлія Воротченко on 22.01.2024.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    
    struct ViewState: Equatable {
        @BindingViewState var currentTab: Tab
    }
    
    let store: StoreOf<MainFeature>
    
    var body: some View {
        self.content
    }
    
    @ViewBuilder private var content: some View {
        WithViewStore(self.store, observe: \.currentTab) { viewStore in
            ZStack(alignment: .bottomTrailing) {
                // MARK: - Tab View
                TabView(selection: viewStore.binding(send: MainFeature.Action.onTabChanged)) {
                    // MARK: - Home or Dashboard Tab
                    IdeasView(
                        store: self.store.scope(
                            state: \.ideas,
                            action: \.ideas
                        )
                    )
                    .tabItem {
                        Image(Tab.home.icon)
                    }
                    .tag(Tab.home)
                    
                    // MARK: - Ideas Tab
                    IdeasView(
                        store: self.store.scope(
                            state: \.ideas,
                            action: \.ideas
                        )
                    )
                    .tabItem {
                        Image(Tab.search.icon)
                    }
                    .tag(Tab.search)
                    
                    // MARK: - Accounts Tab
                    AccountView(
                        store: self.store.scope(
                            state: \.account,
                            action: \.account
                        )
                    )
                    .tabItem {
                        Image(Tab.settings.icon)
                    }
                    .tag(Tab.settings)
                    
                }
                .accentColor(Color.black)
                .onAppear {
                    TabBarAppearanceConfigurator.configureTabBarAppearance()
                }
                // MARK: - Add Button
                FloatingButtonView()
                    .padding(.trailing, 16)
                    .safeAreaPadding(.bottom, 70)
            }
        }
    }
}

// MARK: BindingViewStore

extension BindingViewStore<MainFeature.State> {
    var view: MainView.ViewState {
        MainView.ViewState(currentTab: self.$currentTab)
    }
}

#Preview {
    let store = StoreOf<MainFeature>(initialState: MainFeature.State(), reducer: {})
    return MainView(store: store)
}



