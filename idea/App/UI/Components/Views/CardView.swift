//
//  CardView.swift
//  idea
//
//  Created by Юлія Воротченко on 06.02.2024.
//

import Foundation
import SwiftUI

struct CardView<Content: View>: View {
    
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            content()
        }
        .background(Color.white)
        .cornerRadius(16.0)
        .shadow(color: .black, radius: 10.0)
    }
}

