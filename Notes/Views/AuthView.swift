    //
    //  AuthView.swift
    //  Notes
    //
    //  Created by Justin Gray on 6/16/24.
    //

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct AuthView: View {
    
    @StateObject var auth = AuthViewModel()
    var currentUser = ""
    
    var body: some View {
        Text("NoteApp Sign In")
            .fontWeight(.bold)
        
        VStack{
            TextField("Email", text: $auth.email)
                .padding()
            SecureField("Password", text: $auth.password)
                .padding()
            
            if currentUser != ""{
                Text("Current UserUID is: ")
            }
            
            //Firebase Auth SignIn
            Button(action: {Auth.auth().signIn(withEmail: auth.email, password: auth.password){ authResult, error in
                
                  }},label: {
                Text("Sign In")
            })
            .padding()
            
            //Firebase Auth Create User
            Button(action: {Auth.auth().createUser(withEmail: auth.email, password: auth.password){ authResult, error in
            
                  }},
                   label: {
                Text("Create User")
            })
            .padding()
            
        }
        .padding()
    }
}


#Preview {
    AuthView()
}
