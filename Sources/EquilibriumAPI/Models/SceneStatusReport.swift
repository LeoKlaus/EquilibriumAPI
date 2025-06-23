//
//  SceneStatusReport.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 22.06.25.
//

public struct SceneStatusReport: Codable {
    public let id: Int?
    public let status: SceneStatus?
}
