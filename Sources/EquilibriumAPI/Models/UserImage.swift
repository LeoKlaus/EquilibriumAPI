//
//  UserImage.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 19.06.25.
//

public struct UserImage: Identifiable, Equatable, Codable, Hashable {
    public let id: Int?
    public let filename: String
    public let path: String
    
    public init(id: Int, filename: String, path: String) {
        self.id = id
        self.filename = filename
        self.path = path
    }
}
