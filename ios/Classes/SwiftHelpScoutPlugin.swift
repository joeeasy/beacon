import Flutter
import UIKit
import Beacon;

public class SwiftHelpScoutPlugin: NSObject, FlutterPlugin {
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "help_scout", binaryMessenger: registrar.messenger())
    let instance = SwiftHelpScoutPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let helpScouteImplementation: HelpScoutImplementation = HelpScoutImplementation();
    if(call.method == "setupBeacon") {
       
        helpScouteImplementation.setupBeacon(arguments: call.arguments ?? [""]);
        
        
    } else if(call.method == "openBeacon") {
        helpScouteImplementation.openBeacon(arguments: call.arguments ?? [""]);
    }
  }
}
