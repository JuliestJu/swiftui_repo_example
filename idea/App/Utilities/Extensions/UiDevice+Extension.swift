//
//  UiDevice+Extension.swift
//  idea
//
//  Created by Юлія Воротченко on 07.02.2024.
//

import UIKit

extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
