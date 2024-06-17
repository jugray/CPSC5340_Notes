    //
    //  NoteViewModel.swift
    //  Notes
    //
    //  Created by Justin Gray on 6/15/24.
    //

import Foundation
import FirebaseCore
import FirebaseFirestore


class NoteViewModel : ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var notes = [NoteModel]()
    
    func fetechData(){
        self.notes.removeAll()
        db.collection("notes").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    do {
                        self.notes.append(try document.data(as: NoteModel.self))
                    }catch {
                        print(error)
                    }
                }
            }
        }
    }
    
    func saveData(note: NoteModel){
        if let id = note.id {
            if !note.title.isEmpty || !note.notesdata.isEmpty {
                
                let docRef = db.collection("notes").document(id)
                docRef.updateData([
                    "title": note.title,
                    "notesdata": note.notesdata
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
            }
            
        }else {
            if !note.title.isEmpty || !note.notesdata.isEmpty {
                    // Add a new document with a generated id.
                do {
                    let ref = try db.collection("notes").addDocument(data: [
                        "title": note.title,
                        "notesdata": note.notesdata
                    ])
                    print("Document added with ID: \(ref.documentID)")
                } catch {
                    print("Error adding document: \(error)")
                }
            }
        }
    }
}
