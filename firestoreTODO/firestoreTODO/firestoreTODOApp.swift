//
//  firestoreTODOApp.swift
//  firestoreTODO
//
//  Created by Guyleaf on 2021/5/26.
//

import SwiftUI

@main
struct firestoreTODOApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
        }
    }
}
