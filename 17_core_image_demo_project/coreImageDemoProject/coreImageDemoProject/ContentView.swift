//
//  ContentView.swift
//  coreImageDemoProject
//
//  Created by Balázs Képli on 3/7/25.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        VStack {
            Spacer()
            
            PhotosPicker(selection: $selectedItem) {
                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No picture", systemImage: "photo.badge.plus")
                }
            }
            .onChange(of: selectedItem, loadImage)
            
            Spacer()
            
            HStack {
                Text("Intensity")
                Slider(value: $filterIntensity)
            }
            
            HStack {
                Button("Change filter") {
                    // change filter
                }
                Spacer()
                
                // share the picture
            }
        }
        .padding()
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            processedImage = try await selectedItem?.loadTransferable(type: Image.self)
        }
    }
}

#Preview {
    ContentView()
}
