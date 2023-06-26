//
//  ViewController.swift
//  lab3hw
//
//  Created by Stepan Leonov on 26.06.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userLabelWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Is called when the view first loads")
        userLabelWidth.constant = self.view.frame.width / 2
        userLabel.layer.cornerRadius = self.view.frame.width / 4
        userLabel.clipsToBounds = true
        userLabel.text = "SL"
        
        userNameLabel.text = "Stepan Leonov"
        
        universityLabel.text = "Innopolis University"
        cityLabel.text = "Innopolis"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Is called every time the view appears on screen (multiple times contrary to the viewDidLoad, which is called only once)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Is called just before the view appears on screen")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Is called just before the view disappears from the screen")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Is called after the view already disappeared from the screen")
    }
    
    
    @IBAction func cityEditButtonClicked(_ sender: UIButton) {
        let ac = UIAlertController(title: "Enter new value", message: nil, preferredStyle: .alert)
        ac.addTextField { (textField) in
            textField.placeholder = "City"
        }
        let submitAction = UIAlertAction(title: "Done", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            self.applyEditsToCity(text: answer.text!)
        }
        ac.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .default))
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    @IBAction func universityEditButtonClicked(_ sender: UIButton) {
        let ac = UIAlertController(title: "Enter new value", message: nil, preferredStyle: .alert)
        ac.addTextField { (textField) in
            textField.placeholder = "University"
        }
        let submitAction = UIAlertAction(title: "Done", style: .default) { [unowned ac] _ in
            let answer = ac.textFields![0]
            self.applyEditsToUniversity(text: answer.text!)
        }
        ac.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .default))
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    private func applyEditsToUniversity(text: String) {
        self.universityLabel.text = text
    }
    
    private func applyEditsToCity(text: String) {
        self.cityLabel.text = text
    }

}

