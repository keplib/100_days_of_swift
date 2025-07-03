//
//  ContentView.swift
//  coreImageIntro
//
//  Created by Balázs Képli on 24/6/25.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        
        let loadImage = UIImage(resource: .example)
        let beginImage = CIImage(image: loadImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.twirlDistortion()
        currentFilter.inputImage = beginImage
        currentFilter.radius = 1000
        currentFilter.center = CGPoint(x: loadImage.size.width / 2, y: loadImage.size.height / 2)

        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        let uiImage = UIImage(cgImage: cgImage)
        
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView()
}
