//
//  NewIdeaView.swift
//  idea
//
//  Created by Юлія Воротченко on 06.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct NewIdeaView: View {
    struct ViewState: Equatable {
        @BindingViewState var email: String
    }
    
    let store: StoreOf<NewIdeaFeature>
    
    var body: some View {
        content
            .onAppear { self.store.send(.view(.onViewLoad)) }
    }
    
    @ViewBuilder private var content: some View {
        WithViewStore(self.store, observe: \.view, send: { .view($0) }) { viewStore in
            Text("Add new Idea Feauture")
        }
    }
}

#Preview {
    let store = StoreOf<NewIdeaFeature>(initialState: NewIdeaFeature.State(), reducer: {})
    return NewIdeaView(store: store)
}

extension BindingViewStore<NewIdeaFeature.State> {
    var view: NewIdeaView.ViewState {
        NewIdeaView.ViewState(email: self.$something)
    }
}
