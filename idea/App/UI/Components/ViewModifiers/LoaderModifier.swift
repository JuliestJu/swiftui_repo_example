//
//  LoaderModifier.swift
//  idea
//
//  Created by Юлія Воротченко on 07.02.2024.
//

import SwiftUI

struct LoaderModifier: ViewModifier {

    var isLoading: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
                .disabled(isLoading)
                .blur(radius: isLoading ? 10 : 0)

            if isLoading {
                VStack {
                    ProgressView()
                        .progressViewStyle(.main)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(Color.primary)
                .opacity(isLoading ? 1 : 0)
            }
        }
    }
}

extension View {
    func loader(isLoading: Bool) -> some View {
        modifier(LoaderModifier(isLoading: isLoading))
    }
}

