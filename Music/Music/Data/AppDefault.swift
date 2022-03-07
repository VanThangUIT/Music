//
//  AppDefault.swift
//  Music
//
//  Created by Nguyen Van Thang on 28/02/2022.
//

import Foundation

class AppDefault: NSObject {
    private let defaults: UserDefaults
    
    static let share = AppDefault(defaults: UserDefaults.standard)
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }
    
    var code: String {
        get {
            return self.defaults.string(forKey: "code") ?? ""
        }
        set(value) {
            self.defaults.set(value, forKey: "code")
            self.defaults.synchronize()
        }
    }
    
    var sessionId: String {
        get {
            return self.defaults.string(forKey: "session_id") ?? ""
        }
        set(value) {
            self.defaults.set(value, forKey: "session_id")
            self.defaults.synchronize()
        }
    }
    
    var token: String {
        get {
            return self.defaults.string(forKey: "token") ?? ""
        }
        set(value) {
            self.defaults.set(value, forKey: "token")
            self.defaults.synchronize()
        }
    }
    
    var email: String {
        get {
            return self.defaults.string(forKey: "email") ?? ""
        }
        set(value) {
            self.defaults.set(value, forKey: "email")
            self.defaults.synchronize()
        }
    }
    
    var password: String {
        get {
            return self.defaults.string(forKey: "password") ?? ""
        }
        set(value) {
            self.defaults.set(value, forKey: "password")
            self.defaults.synchronize()
        }
    }
}
