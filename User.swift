//
//  User.swift
//  pensiune
//
//  Created by Radu Tothazan on 23/05/16.
//  Copyright © 2016 Radu Tothazan. All rights reserved.
//

import Foundation
class User {
    private var email: String!
    private var parola: String!
    private var privileges: String!
    
    init(email: String, parola: String, privileges: String){
        self.email = email
        self.parola = parola
        self.privileges = privileges
    }
    
    func getEmail() -> String{
        return self.email
    }
    func getParola() -> String{
        return self.parola
    }
    func getPrivileges() -> String{
        return self.privileges
    }
    
    
    func setEmail(email: String){
        self.email = email
    }
    func setParola(parola: String){
        self.parola = parola
    }
    func setPrivileges(privileges: String){
        self.privileges = privileges
    }
    
    
}
