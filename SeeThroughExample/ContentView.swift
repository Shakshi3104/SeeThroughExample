//
//  ContentView.swift
//  SeeThroughExample
//
//  Created by MacBook Pro M1 on 2021/10/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Semi-transparent Camera
            SemiTransparentCameraView()
            
            // UI
            OverlayContentView()
        }
        .onTapGesture {
            // dismiss keyboard
            UIApplication.shared.dismissKeyboard()
        }
    }
}
