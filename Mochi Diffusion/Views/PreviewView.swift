//
//  PreviewView.swift
//  Diffusion
//
//  Created by Fahim Farook on 12/15/2022.
//

import SwiftUI
import UniformTypeIdentifiers

struct PreviewView: View {
    @EnvironmentObject var store: Store

    var body: some View {
        if let sdi = store.getSelectedImage(), let img = sdi.image {
            Image(img, scale: 1, label: Text("generated"))
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        else {
            Image(systemName: "paintbrush.pointed")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white.opacity(0.2))
                .frame(maxWidth: 100, maxHeight: 100)
        }
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
    }
}
