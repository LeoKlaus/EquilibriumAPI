//
//  Data+Append.swift
//  EquilibriumAPI
//
//  Created by Leo Wehrfritz on 23.06.25.
//

import Foundation

extension Data {
    mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
}
