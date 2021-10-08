//
//  OverlayView.swift
//  SeeThroughExample
//
//  Created by MacBook Pro M1 on 2021/10/08.
//

import SwiftUI

struct OverlayContentView: View {
    @State private var isPresented = false
    
    var body: some View {
        TextExampleView()
    }
}

struct TextExampleView: View {
    @State private var text = "See Through Example"
    
    var body: some View {
        VStack {
            Image(systemName: "iphone.rear.camera")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
            
            TextField("", text: $text)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 10)
        }
        .onTapGesture {
            UIApplication.shared.dismissKeyboard()
        }
    }
}

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayContentView()
    }
}
