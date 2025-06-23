//
//  Macro.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 23.06.25.
//

public struct Macro: Codable, Identifiable, Equatable {
    public let id: Int?
    public let name: String?
    public let commands: [Command]?
    public let delays: [Int]
    public let scenes: [Scene]?
    public let devices: [Device]?
    
    public init(id: Int? = nil, name: String? = nil, commands: [Command]? = nil, delays: [Int] = [], scenes: [Scene]? = nil, devices: [Device]? = nil) {
        self.id = id
        self.name = name
        self.commands = commands
        self.delays = delays
        self.scenes = scenes
        self.devices = devices
    }
}
