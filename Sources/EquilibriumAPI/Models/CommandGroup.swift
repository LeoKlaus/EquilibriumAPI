//
//  CommandGroup.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 19.06.25.
//

public struct CommandGroup: Identifiable, Equatable, Codable, Hashable {
    public let id: Int?
    public let name: String
    public let type: CommandGroupType
    public let deviceId: Int?
    public let commands: [Command]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case deviceId = "device_id"
        case commands
    }
    
    public init(id: Int? = nil, name: String, type: CommandGroupType, deviceId: Int? = nil, commands: [Command]? = nil) {
        self.id = id
        self.name = name
        self.type = type
        self.deviceId = deviceId
        self.commands = commands
    }
}
