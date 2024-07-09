//
//  TabBarAppearance.swift
//  idea
//
//  Created by Юлія Воротченко on 20.02.2024.
//

import UIKit

class TabBarAppearanceConfigurator {
    
    static func configureTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        
        // MARK: - Normal Button Appearance
        appearance.stackedLayoutAppearance.normal.iconColor = .blue
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        
        // MARK: - Selected Button Appearance
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(.yellow)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(.yellow)]
        
        UITabBar.appearance().standardAppearance = appearance
    }
}
