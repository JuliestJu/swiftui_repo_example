//
//  String+Extension.swift
//  idea
//
//  Created by Юлія Воротченко on 18.01.2024.
//

import Foundation

extension String {
    
    func replaceAllChars(with char: String) -> String {
        var result = ""
        for _ in self {
            result += char
        }
        return result
    }
}
