//
//  CameraView.swift
//  SeeThroughExample
//
//  Created by MacBook Pro M1 on 2021/10/08.
//

import SwiftUI
import AVFoundation

struct CameraView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        BaseCameraView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

class BaseCameraView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        _ = initCaptureSession
        (layer.sublayers?.first as? AVCaptureVideoPreviewLayer)?.frame = frame
    }
    
    lazy var initCaptureSession: Void = {
        guard let device = AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera],
            mediaType: .video,
            position: .unspecified)
                .devices.first(where: { $0.position == .back }),
              let input = try? AVCaptureDeviceInput(device: device)
        else { return }
        
        let session = AVCaptureSession()
        session.addInput(input)
        session.startRunning()
        
        layer.insertSublayer(AVCaptureVideoPreviewLayer(session: session), at: 0)
    }()
}

struct SemiTransparentCameraView: View {
    var body: some View {
        ZStack {
            // Camera
            CameraView()
                .edgesIgnoringSafeArea(.all)
            
            // Semi-transparent layer
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
