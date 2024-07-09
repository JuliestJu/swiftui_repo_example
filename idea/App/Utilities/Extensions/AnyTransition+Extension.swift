//
//  File.swift
//  idea
//
//  Created by Юлія Воротченко on 22.01.2024.
//

import SwiftUI

extension AnyTransition {
    static var delayAndFade: AnyTransition {
        return AnyTransition.identity
              .combined(with: .opacity)
              .animation(.default.delay(0.1))
    }
}

