    //
    //  ContentView.swift
    //  Notes
    //
    //  Created by Justin Gray on 6/15/24.
    //

import SwiftUI
import FirebaseAuth

struct NoteOverview: View {
    
    @StateObject var noteApp = NoteViewModel()
    @State var note = NoteModel(title: "", notesdata: "")
    @AppStorage("uid") var userID : String = ""
    
    var body: some View {
        NavigationStack{
            List {
                ForEach($noteApp.notes){ $note in
                    NavigationLink{
                        NoteDetail(note: $note)
                    }
                label: {
                    Text(note.title)
                }
                }
                Section {
                    NavigationLink {
                        NoteDetail(note: $note )
                    }label: {
                        Text("New note")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                    }
                }
                
                Section {
                    if userID == "" {
                        NavigationLink {
                            AuthView()
                        }label: {
                            Text("Sign In")
                        }
                    }
                    else {
                        Text("Current User (Tap to Sign Out): \(userID)")
                            .onTapGesture {
                                let firebaseAuth = Auth.auth()
                                do {
                                  try firebaseAuth.signOut()
                                    userID = ""
                                } catch let signOutError as NSError {
                                  print("Error signing out: %@", signOutError)
                                }
                            }
                    }
                }
            }
            .onAppear {
                noteApp.fetechData()
            }
            .refreshable {
                noteApp.fetechData()
            }
        }
    }
}

#Preview {
    NoteOverview()
}
