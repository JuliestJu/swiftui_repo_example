//
//  ListView.swift
//  idea
//
//  Created by Юлія Воротченко on 06.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct IdeasView: View {
    
    let store: StoreOf<IdeasFeature>
    
    var gridItems: [GridItem] {
        if UIDevice.isIPad {
            [
                .init(.flexible(), spacing: 8),
                .init(.flexible(), spacing: 8)
            ]
        } else {
            [
                .init(.flexible())
            ]
        }
    }
    
    var body: some View {
        self.content
            .onLoad {
                self.store.send(.view(.onViewLoad))
            }
    }
    
    @ViewBuilder private var content: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStackStore(self.store.scope(state: \.path,
                                                  action: \.path)) {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: self.gridItems,
                              spacing: 10) {
                        Section {
                            ForEachStore(
                                self.store.scope(state: \.initalItems,
                                                 action: \.idea)
                            ) { itemStore in
                                IdeaItemView(store: itemStore)
                                    .padding(.horizontal)
                            }
                        } header: {
                            VStack {
                                Text("Here will be header with searchbar")
                                    .background(Color.teal)
                                    .frame(height: 130)
                            }
                        }
                    }
                }
                .modifier(NavigationBarModifier())
                .loader(isLoading: viewStore.isLoading)
                .refreshable {
                    await viewStore.send(.view(.onPulledToRefresh), while: \.isLoading)
                }
            } destination: {
                switch $0 {
                case .details:
                    CaseLet(/IdeasFeature.Path.State.details,
                             action: IdeasFeature.Path.Action.details,
                             then: IdeaDetailsView.init(store:)
                    )
                }
            }
        }
    }
}

#Preview {
    
    let array = IdentifiedArrayOf(uniqueElements: Idea.sampleArray().map {
        IdeaItemFeature.State(id: UUID(), idea: $0)})
    
    let store = StoreOf<IdeasFeature>(initialState: IdeasFeature.State(initalItems: array), reducer: {})
    return IdeasView(store: store)
}
