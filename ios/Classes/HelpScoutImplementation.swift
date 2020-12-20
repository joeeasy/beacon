//
//  HelpScoutImplementation.swift
//  help_scout
//
//  Created by Baba Yaga on 12/20/20.
//

import Foundation
import Beacon;

 public class HelpScoutImplementation {
    init() {
    }
    var settings: HSBeaconSettings = HSBeaconSettings();

    func setupBeacon(arguments: Any) -> Void {
        let channelArgs = arguments as? Array<String>
        identifyUser(email: channelArgs?[1] ?? "", name: channelArgs?[2] ?? "");
    }
    
    func openBeacon(arguments: Any)  -> Void {
        let channelArgs = arguments as? Array<String>
        HSBeacon.open(HSBeaconSettings(beaconId: channelArgs?[0] ?? ""));
    }
    func identifyUser(email:String, name:String) -> Void {
        let user=HSBeaconUser();
        user.email = email;
        user.name = name;
        HSBeacon.login(user);
    }
}
