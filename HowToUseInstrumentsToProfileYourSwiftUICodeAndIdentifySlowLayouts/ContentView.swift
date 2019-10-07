//
//  ContentView.swift
//  HowToUseInstrumentsToProfileYourSwiftUICodeAndIdentifySlowLayouts
//
//  Created by ramil on 07/10/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import Combine
import SwiftUI

class FrequentUpdater: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    var timer: Timer?

    init() {
        timer = Timer.scheduledTimer(
            withTimeInterval: 0.01,
            repeats: true
        ) { _ in
            self.objectWillChange.send()
        }
    }
}

struct ContentView: View {
    @ObservedObject var updater = FrequentUpdater()
    @State private var tapCount = 0

    var body: some View {
        VStack {
            Text("\(UUID().uuidString)")

            Button(action: {
                self.tapCount += 1
            }) {
                Text("Tap count: \(tapCount)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
