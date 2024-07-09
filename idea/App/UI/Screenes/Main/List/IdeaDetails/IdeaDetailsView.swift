//
//  IdeaDetailsView.swift
//  idea
//
//  Created by Юлія Воротченко on 06.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct IdeaDetailsView: View {
    
    let store: StoreOf<IdeaDetailsFeature>
    
    var body: some View {
        content
            .onAppear { self.store.send(.view(.onViewAppear)) }
    }
    
    @ViewBuilder private var content: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Text(viewStore.idea.description)
        }
    }
}

#Preview {
    let store = StoreOf<IdeaDetailsFeature>(initialState: IdeaDetailsFeature.State(id: UUID(), idea: Idea.sampleArray()[0])) {}
    return IdeaDetailsView(store: store)
}
