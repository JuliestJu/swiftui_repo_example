//
//  AppDelegate.swift
//  idea
//
//  Created by Юлія Воротченко on 16.01.2024.
//

import SwiftUI

/// The SceneDelegate class responsible for managing the app's scenes.
final class SceneDelegate: NSObject, UIWindowSceneDelegate {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    /// Called when a shortcut item is selected to perform an action.
    ///
    /// - Parameters:
    ///   - windowScene: The window scene.
    ///   - shortcutItem: The shortcut item that was selected.
    ///   - completionHandler: The completion handler to call when the action is complete.
    func windowScene(
        _ windowScene: UIWindowScene,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
//        self.appDelegate.store.send(.appDelegate(.didLaunchedWithShortcutItem(shortcutItem)))
        completionHandler(true)
    }
}

