//
//  URL+MimeType.swift
//  EquilibriumAPI
//
//  Created by Leo Wehrfritz on 23.06.25.
//

import Foundation
import UniformTypeIdentifiers

public extension URL {
    /// Returns the uniform type identity for the given file
    var mimeType: String {
        return UTType(filenameExtension: pathExtension)?.preferredMIMEType ?? "image/jpeg"
    }
}
