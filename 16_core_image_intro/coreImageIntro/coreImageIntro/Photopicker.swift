//
//  Photopicker.swift
//  coreImageIntro
//
//  Created by Balázs Képli on 27/6/25.
//

import PhotosUI
import SwiftUI

//struct Photopicker: View {
//    
//    @State private var pickerItem: PhotosPickerItem?
//    @State private var selectedImage: Image?
//    
//    var body: some View {
//        VStack {
//            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images )
//            
//            selectedImage?
//                .resizable()
//                .scaledToFit()
//        }
//        .onChange(of: pickerItem) {
//            Task {
//                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
//            }
//        }
//    }
//}

struct Photopicker: View {
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .images) {
                Label("Select some picturtes", systemImage: "photo")
            }
            
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    
                }
            }
        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()
                
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    Photopicker()
}
