//
//  String+HTML.swift
//  Core
//
//  Created by Мах Ol on 19.11.2022.
//

import Foundation

public extension String {
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(
                data: data,
                options: [
                    .documentType: NSAttributedString.DocumentType.html,
                    .characterEncoding: String.Encoding.utf8.rawValue
                ],
                documentAttributes: nil
            )
        } catch {
            return nil
        }
    }
    
    var htmlToString: String? {
        return htmlToAttributedString?.string
    }
}
