//
//  NotesListViewController.swift
//  Scribble
//
//  Created by Shivam Rishi on 07/08/19.
//  Copyright © 2019 Shivam Rishi. All rights reserved.
//

import UIKit
import CoreData

class NotesListViewController: UITableViewController {

  var notesArray = [NoteList]()
    
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadNotes()
        
    }

    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteListCell", for: indexPath)
        
        let note = notesArray[indexPath.row]
        
        cell.textLabel?.text = note.title
        
        return cell
    }
    
    //MARK: - Add New Item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add New Note", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Note", style: .default) { (action) in
            
            if textfield.text != ""
            {
                
              let note  = NoteList(context: self.context)
                note.title = textfield.text!;
                self.notesArray.append(note)
              
                self.saveNotes()
                
            } else {
                print("empty string")
                
              let innerAlert = UIAlertController(title: nil, message: "Empty String cannot be added", preferredStyle: .alert)
              innerAlert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
              self.present(innerAlert, animated: true, completion: nil)
                
            }
            
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create a new Note "
            textfield = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: - Model Manipulation Methods
    
    func saveNotes()
    {
        do
        {
        try context.save()
        }
        catch {
            print("error \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadNotes()
    {
     
        let request : NSFetchRequest<NoteList> = NoteList.fetchRequest()
        
        do
        {
         notesArray =  try context.fetch(request)
        }
         catch
            {
                print("error \(error)")
            }
        tableView.reloadData()
    }
    
    
    
    
  
}
