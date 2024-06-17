//
//  AuthViewModel.swift
//  Notes
//
//  Created by Justin Gray on 6/16/24.
//

import Foundation
import FirebaseAuth

class AuthViewModel : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var userID =  ""
    
}
