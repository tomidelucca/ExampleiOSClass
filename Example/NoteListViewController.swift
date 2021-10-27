//
//  NoteListViewController.swift
//  Example
//
//  Created by Contingencia IS on 19/10/2021.
//

import Foundation
import UIKit

class NoteListViewController: UIViewController, UITableViewDelegate {
    
    // Instanciamos la tableview
    private let tableView = UITableView()

    // Instanciamos el DataSource
    private let dataSource = NoteListViewControllerTableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        // Setup TableView
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NoteCell")
        
        // Add Subview
        view.addSubview(tableView)
        
        // Setup AutoLayout Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = NoteDetailViewController()
        let note = dataSource.noteAtIndex(indexPath.row)
        detail.update(with: note)
        
        navigationController?.pushViewController(detail, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

class NoteListViewControllerTableViewDataSource: NSObject, UITableViewDataSource {
    
    private let notes = [
        Note(text: "Hola, cómo estas?"),
        Note(text: "Hoy es miércoles"),
        Note(text: "Chau")
    ]
    
    func noteAtIndex(_ index: Int) -> Note {
        return notes[index]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        cell.textLabel?.text = notes[indexPath.row].text
        
        return cell
    }
}
