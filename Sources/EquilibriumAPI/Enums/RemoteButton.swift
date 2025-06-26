//
//  RemoteButton.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 19.06.25.
//

public enum RemoteButton: String, Codable {
    case powerToggle = "power_toggle"
    case powerOff = "power_off"
    case powerOn = "power_on"
    case volumeUp = "volume_up"
    case volumeDown = "volume_down"
    case mute
    case directionUp = "direction_up"
    case directionDown = "direction_down"
    case directionLeft = "direction_left"
    case directionRight = "direction_right"
    case select
    case guide
    case back
    case menu
    case home
    case exit
    case play
    case pause
    case playpause
    case stop
    case fastForward = "fast_forward"
    case rewind
    case nextTrack = "next_track"
    case previousTrack = "previous_track"
    case record
    case green
    case red
    case blue
    case yellow
    case numberZero = "number_zero"
    case numberOne = "number_one"
    case numberTwo = "number_two"
    case numberThree = "number_three"
    case numberFour = "number_four"
    case numberFive = "number_five"
    case numberSix = "number_six"
    case numberSeven = "number_seven"
    case numberEight = "number_eight"
    case numberNine = "number_nine"
    case channelUp = "channel_up"
    case channelDown = "channel_down"
    case brightnessUp = "brightness_up"
    case brightnessDown = "brightness_down"
    case turnOn = "turn_on"
    case turnOff = "turn_off"
    case other
}
