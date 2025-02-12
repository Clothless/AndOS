import Flutter
import UIKit

public class AndOsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "and_os", binaryMessenger: registrar.messenger())
    let instance = AndOsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "isDeviceJailbroken":
    var bundleId = call.arguments as! [String: Any]
        result(IOS.isDeviceJailbroken(bundleId))
    case "isAppInDebugMode":
        result(IOS.isAppInDebugMode())
    case "isRunningOnEmulator":
        result(IOS.isRunningOnEmulator())
    case "isRuntimeTampered":
        result(IOS.isRuntimeTampered())
    case "isFridaDetected":
        result(IOS.isFridaDetected())
    case "isAppBeingDebugged":
        result(IOS.isAppBeingDebugged())
    case "isRunningInSimulator":
        result(IOS.isRunningInSimulator())
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
