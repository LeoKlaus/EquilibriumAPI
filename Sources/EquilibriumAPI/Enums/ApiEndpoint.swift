//
//  ApiEndpoint.swift
//  EquilibriumAPI
//
//  Created by Leo Wehrfritz on 26.06.25.
//

public enum ApiEndpoint: Sendable {
    case commands
    case command(id: Int)
    case sendCommand(id: Int)
    
    case devices
    case device(id: Int)
    
    case bluetoothDevices
    case bluetoothStartAdvert
    case bluetoothStartPairing
    case bluetoothConnect(address: String)
    case bluetoothDisconnect
    
    case images
    case image(id: Int)
    
    case macros
    case macro(id: Int)
    case sendMacro(id: Int)
    
    case scenes
    case scene(id: Int)
    case startScene(id: Int)
    case setCurrentScene(id: Int)
    case getKeymapSuggestion(id: Int)
    case stopCurrentScene
    
    case info
    case systemStatus
    
    case wsStatus
    case wsCommands
    case wsBtPairing
    case wsKeyboard
    
    public var path: String {
        switch self {
        case .commands:
            "/commands"
        case .command(let id):
            "/commands/\(id)"
        case .sendCommand(let id):
            "/commands/\(id)/send"
        case .devices:
            "/devices"
        case .device(let id):
            "/devices/\(id)"
        case .bluetoothDevices:
            "/bluetooth/devices"
        case .bluetoothStartAdvert:
            "/bluetooth/start_advertisement"
        case .bluetoothStartPairing:
            "/bluetooth/start_pairing"
        case .bluetoothConnect(let address):
            "/bluetooth/connect/\(address)"
        case .bluetoothDisconnect:
            "/bluetooth/disconnect"
        case .images:
            "/images"
        case .image(let id):
            "/images/\(id)"
        case .macros:
            "/macros"
        case .macro(let id):
            "/macros/\(id)"
        case .sendMacro(let id):
            "/macros/\(id)/execute"
        case .scenes:
            "/scenes"
        case .scene(let id):
            "/scenes/\(id)"
        case .startScene(let id):
            "/scenes/\(id)/start"
        case .setCurrentScene(let id):
            "/scenes/\(id)/set_current"
        case .getKeymapSuggestion(let id):
            "/scenes/\(id)/keymap_suggestions"
        case .stopCurrentScene:
            "/scenes/stop"
        case .info:
            "/info"
        case .systemStatus:
            "/system/status"
        case .wsStatus:
            "/ws/status"
        case .wsCommands:
            "/ws/commands"
        case .wsBtPairing:
            "/ws/bt_pairing"
        case .wsKeyboard:
            "/ws/keyboard"
        }
    }
}
