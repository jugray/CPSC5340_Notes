    //
    //  ContentView.swift
    //  Notes
    //
    //  Created by Justin Gray on 6/15/24.
    //

import SwiftUI

struct NoteOverview: View {
    
    @StateObject var noteApp = NoteViewModel()
    @State var note = NoteModel(title: "", notesdata: "")
    
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
                    NavigationLink {
                        AuthView()
                    }label: {
                        Text("Sign In")
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
