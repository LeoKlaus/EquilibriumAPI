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
    public let current_scene: Scene?
    public let scene_status: SceneStatus?
    public let devices: DeviceStates?
    
    public init(current_scene: Scene? = nil, scene_status: SceneStatus? = nil, devices: DeviceStates? = nil) {
        self.current_scene = current_scene
        self.scene_status = scene_status
        self.devices = devices
    }
}
