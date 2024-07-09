//
//  LoadingView.swift
//  idea
//
//  Created by Юлія Воротченко on 22.01.2024.
//

import SwiftUI
import ComposableArchitecture

struct LoadingView: View {
    
    let store: StoreOf<LoadingFeature>
    
    struct ViewState: Equatable {
        @BindingViewState var progress: Double
    }
    
    var body: some View {
        self.content
            .onAppear { self.store.send(.view(.onViewAppear)) }
    }
    
    @ViewBuilder private var content: some View {
        WithViewStore(self.store, observe: \.view, send: { .view($0) }) { viewStore in
            VStack(spacing: 10) {
                Text("Progress").font(.title2)
                ProgressViewWrapper(progress: viewStore.$progress)
            }
        }
    }
}

#Preview {
    let state = LoadingFeature.State(progress: 0.5)
    let store = StoreOf<LoadingFeature>(initialState: state) {}
    return LoadingView(store: store)
}

// MARK: BindingViewStore

extension BindingViewStore<LoadingFeature.State> {
    var view: LoadingView.ViewState {
        LoadingView.ViewState(progress: self.$progress)
    }
}
