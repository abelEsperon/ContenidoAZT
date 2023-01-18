//
//  VersionApp.swift
//  ContenidoAZT
//
//  Created by Abel Gonzalez on 17/01/23.
//

import Foundation
import UIKit


class VersionApp {
    
    func getVersion() -> String {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return "no version info"
        }
        return version
    }
    
}
//extension Bundle {
//
//    func applicationBuildNumber () -> String {
//        if var compil = (Bundle.mainBundle().infoDictionary?["CFBundleVersion"] as String {
//            return compil
//        }
//        return "Build Number Not Available"
//    }
//
//    let versionNumber = NSBundle.applicationVersionNumber
//
//}
//
//func getVersionString(sTitulo:String) -> String{
//    var sVersion = ""
//    if let dictionary = Bundle.main.infoDictionary {
//        version = dictionary["CFBundleShortVersionString"] as? String ?? "0"
//        buildNumber = dictionary["CFBundleVersion"] as? String ?? "0"
//        sVersion = sTitulo.replacingOccurrences(of: "{[VERSION]}", with: version)
//        sVersion = sVersion.replacingOccurrences(of: "{[BUILDNUMBER]}", with: buildNumber)
//    }
//    return sVersion
//}
