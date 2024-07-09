//
//  IdeaItemView.swift
//  idea
//
//  Created by Юлія Воротченко on 06.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct IdeaItemView: View {
    
    let store: StoreOf<IdeaItemFeature>
    
    var body: some View {
        CardView {
            content
        }
        .onTapGesture {
            self.store.send(.view(.onItemTap))
        }
    }
    
    @ViewBuilder private var content: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading) {
                Group{
                    Text(viewStore.idea.idea)
                        .padding(8)
                    Text(viewStore.idea.description)
                        .padding(.horizontal, 8)
                    Text(viewStore.idea.createdDate.description)
                        .padding(8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    
    let store = StoreOf<IdeaItemFeature>(initialState: IdeaItemFeature.State(id: UUID(), idea: Idea.sampleArray()[0]), reducer: {})
    return IdeaItemView(store: store)
}
