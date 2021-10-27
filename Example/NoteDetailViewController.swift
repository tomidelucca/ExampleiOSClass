//
//  NoteDetailViewController.swift
//  Example
//
//  Created by Contingencia IS on 17/10/2021.
//

import Foundation
import UIKit

class NoteDetailViewController: UIViewController {
    
    private let label: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        
        // Setup Label
        label.text = "Hola, como estas?"
        label.backgroundColor = .lightGray

        // Add Subview
        view.addSubview(label)

        // Setup AutoLayout Constraints
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func update(with note: Note) {
        label.text = note.text
    }
}
