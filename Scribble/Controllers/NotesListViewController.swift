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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteListCell", for: indexPath)
        
        return cell
    }
    
   
    
  
}
