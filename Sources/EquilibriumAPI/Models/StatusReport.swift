//
//  SceneStatusReport.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 22.06.25.
//

public struct DeviceState: Codable {
    public let powered: Bool
    public let input: Int?
}

public struct DeviceStates: Codable {
    public let states: [Int : DeviceState]
}

public struct StatusReport: Codable {
    public let current_scene_id: Int?
    public let scene_status: SceneStatus?
    public let devices: DeviceStates?
}
