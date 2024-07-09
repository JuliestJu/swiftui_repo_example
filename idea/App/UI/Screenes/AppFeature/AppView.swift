//
//  AppView.swift
//  idea
//
//  Created by Юлія Воротченко on 18.01.2024.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
    
    let store: StoreOf<AppFeature>
    
    var body: some View {
        self.content
    }
    
    @ViewBuilder private var content: some View {
        SwitchStore(self.store) { state in
            switch state {
            case .loading:
                CaseLet(/AppFeature.State.loading, action: AppFeature.Action.loading) { store in
                    LoadingView(store: store)
                        .transition(.delayAndFade)
                }
            case .main:
                CaseLet(/AppFeature.State.main, action: AppFeature.Action.main) { store in
                    MainView(store: store)
                        .transition(.delayAndFade)
                }
            }
        }
    }
}

#Preview {
    let store = StoreOf<AppFeature>(initialState: AppFeature.State(), reducer: {})
    return AppView(store: store)
}
