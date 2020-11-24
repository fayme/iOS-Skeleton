//
//  ViewController.swift
//  iOS-Skeleton
//
//  Created by Fayme on 23/11/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let apiService = ApiService()
        apiService.getEmployees{ [weak self] result in
            switch result {
            case .success(let employees):
                print("Employees:, \(employees.count)!")
                
            case .failure(let error):
                print(error)
            }
        }
    }


}

