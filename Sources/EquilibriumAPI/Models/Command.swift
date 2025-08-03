//
//  Command.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 19.06.25.
//

import Foundation

public struct Command: Identifiable, Equatable, Codable, Hashable, Sendable {
    
    public let id: Int?
    public let name: String
    public let button: RemoteButton
    public let type: CommandType
    public let commandGroup: CommandGroupType
    public let deviceId: Int?
    public let device: Device?
    public let host: String?
    public let method: HTTPMethod?
    public let body: String?
    public let btAction: String?
    public let btMediaAction: String?
    public let macros: [Macro]?
    // Not needed for clients
    //let irAction: [Int]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case button
        case type
        case commandGroup = "command_group"
        case deviceId = "device_id"
        case device
        case host
        case method
        case body
        case btAction = "bt_action"
        case btMediaAction = "bt_media_action"
        case macros
        //case irAction = "ir_action"
    }
    
    public init(id: Int? = nil, name: String, button: RemoteButton, type: CommandType, commandGroup: CommandGroupType, deviceId: Int? = nil, device: Device? = nil, host: String? = nil, method: HTTPMethod? = nil, body: String? = nil, btAction: String? = nil, btMediaAction: String? = nil, macros: [Macro]? = nil) {
        self.id = id
        self.name = name
        self.button = button
        self.type = type
        self.commandGroup = commandGroup
        self.deviceId = deviceId
        self.device = device
        self.host = host
        self.method = method
        self.body = body
        self.btAction = btAction
        self.btMediaAction = btMediaAction
        self.macros = macros
    }
}
