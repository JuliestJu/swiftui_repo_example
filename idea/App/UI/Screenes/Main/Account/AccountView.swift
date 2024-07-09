//
//  AccountView.swift
//  idea
//
//  Created by Юлія Воротченко on 06.02.2024.
//

import SwiftUI
import ComposableArchitecture

struct AccountView: View {
    struct ViewState: Equatable {
        @BindingViewState var email: String
    }
    
    let store: StoreOf<AccountFeature>
    
    var body: some View {
        content
            .onAppear { self.store.send(.view(.onViewLoad)) }
    }
    
    @ViewBuilder private var content: some View {
        WithViewStore(self.store, observe: \.view, send: { .view($0) }) { viewStore in
            Text("Account Feauture")
        }
    }
}

#Preview {
    let store = StoreOf<AccountFeature>(initialState: AccountFeature.State(), reducer: {})
    return AccountView(store: store)
}

extension BindingViewStore<AccountFeature.State> {
    var view: AccountView.ViewState {
        AccountView.ViewState(email: self.$email)
    }
}
