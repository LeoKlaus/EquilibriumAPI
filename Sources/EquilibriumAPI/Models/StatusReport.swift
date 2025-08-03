//
//  SceneStatusReport.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 22.06.25.
//

public struct DeviceState: Codable {
    public let powered: Bool
    public let input: Int?
    
    public init(powered: Bool, input: Int?) {
        self.powered = powered
        self.input = input
    }
}

public struct DeviceStates: Codable {
    public let states: [Int : DeviceState]
    
    public init(states: [Int : DeviceState]) {
        self.states = states
    }
}

public struct StatusReport: Codable {
    public let currentScene: Scene?
    public let sceneStatus: SceneStatus?
    public let devices: DeviceStates?
    
    public init(current_scene: Scene? = nil, scene_status: SceneStatus? = nil, devices: DeviceStates? = nil) {
        self.currentScene = current_scene
        self.sceneStatus = scene_status
        self.devices = devices
    }
    
    enum CodingKeys: String, CodingKey {
        case currentScene = "current_scene"
        case sceneStatus = "scene_status"
        case devices
    }
}
