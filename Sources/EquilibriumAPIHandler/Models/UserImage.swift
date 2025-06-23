//
//  UserImage.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 19.06.25.
//

public struct UserImage: Identifiable, Equatable, Codable {
    public let id: Int?
    public let filename: String
    public let path: String
}
