//
//  InspectorView.swift
//  Mochi Diffusion
//
//  Created by Joshua Park on 12/19/22.
//

import SwiftUI
import StableDiffusion

struct InspectorView: View {
    @EnvironmentObject var store: Store
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        if let sdi = store.getSelectedImage() {
            let info = getHumanReadableInfo(sdi: sdi)

            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text(info)
                            .textSelection(.enabled)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .frame(maxWidth: 300)
                    }
                }

                Spacer().frame(height: 12)

                HStack(alignment: .center) {
                    Button("Copy to Prompt") {
                        store.copyToPrompt()
                    }
                    Button("Copy") {
                        let pb = NSPasteboard.general
                        pb.declareTypes([.string], owner: nil)
                        pb.setString(info, forType: .string)
                    }
                }
            }
        }
        else {
            Text("No info")
        }
    }
}

struct InspectorView_Previews: PreviewProvider {
    static var previews: some View {
        InspectorView()
    }
}
