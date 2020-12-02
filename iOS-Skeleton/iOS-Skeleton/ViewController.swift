//
//  ViewController.swift
//  iOS-Skeleton
//
//  Created by Fayme on 23/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var employeeViewModel: EmployeeViewModel!
    
    //private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UINib(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeTableViewCell")
        callToViewModelForUIUpdate()
        
    }
    
    func callToViewModelForUIUpdate(){
            
            self.employeeViewModel =  EmployeeViewModel()
            self.employeeViewModel.bindEmployeeViewModelToController = {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeViewModel.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as! EmployeeTableViewCell

        cell.employeeNameLabel.text = employeeViewModel.employees[indexPath.row].employeeName
        cell.employeeSalaryLabel.text = employeeViewModel.employees[indexPath.row].employeeSalary
        cell.employeeAgeLabel.text = employeeViewModel.employees[indexPath.row].employeeAge

        return cell
    }
    
    
    
}

