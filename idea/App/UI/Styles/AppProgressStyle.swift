//
//  File.swift
//  idea
//
//  Created by Юлія Воротченко on 07.02.2024.
//

import Foundation
import SwiftUI

struct AppProgressStyle: ProgressViewStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        ProgressView(configuration)
            .scaleEffect(1.5)
            .tint(.black)
    }
}

extension ProgressViewStyle where Self == AppProgressStyle {
    static var main: AppProgressStyle { .init() }
}
