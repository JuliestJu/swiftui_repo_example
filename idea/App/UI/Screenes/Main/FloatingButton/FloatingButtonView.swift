//
//  SwiftUIView.swift
//  idea
//
//  Created by Юлія Воротченко on 04.03.2024.
//

import SwiftUI

struct FloatingButtonView: View {
    
    @State private var offset: CGSize = CGSize.zero
    @State private var dragOffset: CGSize = CGSize.zero
    
    var body: some View {
        Button(action: {
            print("+++")
        }) {
            Image("add_icon")
                .resizable()
                .frame(width: 65, height: 65)
                .background(Color.clear)
                .foregroundColor(.green)
                .clipShape(Circle())
                .shadow(radius: 4, x: 0, y: 4)
        }
        .offset(x: offset.width + dragOffset.width, y: offset.height + dragOffset.height)
        .gesture(DragGesture()
            .onChanged { value in
                self.dragOffset = value.translation
            }
            .onEnded { value in
                self.offset.width += value.translation.width
                self.offset.height += value.translation.height
                self.dragOffset = .zero
            }
        )
    }
}

#Preview {
    FloatingButtonView()
}
