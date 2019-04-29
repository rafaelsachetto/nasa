//
//  String+Extensions.swift
//  Nasa
//
//  Created by Rafael Sachetto on 28/04/19.
//  Copyright © 2019 Rafael Sachetto. All rights reserved.
//

import Foundation

extension StringProtocol {
    var firstUppercased: String {
        return prefix(1).uppercased() + dropFirst()
    }
    var firstCapitalized: String {
        return prefix(1).capitalized + dropFirst()
    }
}
