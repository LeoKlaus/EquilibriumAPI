//
//  Scene.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 19.06.25.
//

public struct Scene: Identifiable, Equatable, Codable, Hashable {
    public let id: Int?
    public let name: String?
    public let image: UserImage?
    public let imageId: Int?
    public let bluetoothAddress: String?
    public let keymap: String?
    public let devices: [Device]?
    public let deviceIds: [Int]?
    public let startMacro: Macro?
    public let startMacroId: Int?
    public let stopMacro: Macro?
    public let stopMacroId: Int?
    public let macros: [Macro]?
    public let macroIds: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case imageId = "image_id"
        case bluetoothAddress = "bluetooth_address"
        case keymap
        case devices
        case deviceIds = "device_ids"
        case startMacro = "start_macro"
        case startMacroId = "start_macro_id"
        case stopMacro = "stop_macro"
        case stopMacroId = "stop_macro_id"
        case macros
        case macroIds = "macro_ids"
    }
    
    public init(id: Int? = nil, name: String? = nil, image: UserImage? = nil, imageId: Int? = nil, bluetoothAddress: String? = nil, keymap: String? = nil, devices: [Device]? = nil, deviceIds: [Int]? = nil, startMacroId: Int? = nil, startMacro: Macro? = nil, stopMacroId: Int? = nil, stopMacro: Macro? = nil, macros: [Macro]? = nil, macroIds: [Int]? = nil) {
        self.id = id
        self.name = name
        self.image = image
        self.imageId = imageId
        self.bluetoothAddress = bluetoothAddress
        self.keymap = keymap
        self.devices = devices
        self.deviceIds = deviceIds
        self.startMacro = startMacro
        self.startMacroId = startMacroId
        self.stopMacro = stopMacro
        self.stopMacroId = stopMacroId
        self.macros = macros
        self.macroIds = macroIds
    }
}
