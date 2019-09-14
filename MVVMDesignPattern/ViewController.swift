//
//  ViewController.swift
//  MVVMDesignPattern
//
//  Created by Kiran Patil on 14/09/19.
//

import UIKit

class ViewController: UIViewController {

    var viewModel = ViewModel()
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var nextButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Programming Languages "
        tableView?.register(CustomCell.nib, forCellReuseIdentifier: CustomCell.identifier)
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.allowsMultipleSelection = true
        tableView?.dataSource = viewModel
        tableView?.delegate = viewModel
        viewModel.didToggleSelection = { [weak self] hasSelection in
            self?.nextButton?.isEnabled = hasSelection
        }
    }
    
    @IBAction func next(_ sender: Any) {
        showAlertWithSelectedLangueses()
    }
    
    private func showAlertWithSelectedLangueses() {
        let alert = UIAlertController(title: "Selected Languages", message: "\(viewModel.selectedItems.map { $0.title })", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

