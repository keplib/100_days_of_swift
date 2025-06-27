//
//  ShareLink.swift
//  coreImageIntro
//
//  Created by Balázs Képli on 27/6/25.
//

import SwiftUI

struct ShareLinkView: View {
    var body: some View {
        
        let example = Image(.example)
                
        VStack {
            ShareLink(item: URL(string: "https://www.google.com")!) {
                Label("Spread the word!", systemImage: "swift")
            }
            
            ShareLink(item: example, preview: SharePreview("Test image", image: example)) {
                Label("Share an image", systemImage: "swift")
            }
        }
    }
}

#Preview {
    ShareLinkView()
}
