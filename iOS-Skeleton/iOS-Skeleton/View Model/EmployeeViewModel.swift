//
//  EmployeeViewModel.swift
//  iOS-Skeleton
//
//  Created by Fayme on 1/12/20.
//

import Foundation

class EmployeeViewModel {
    private let apiService : ApiService
    private(set) var employees = [Employee]() {
        didSet{
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    
    init() {
        self.apiService = ApiService()
        getEmployees()
    }
    
    func getEmployees() {
        apiService.getEmployees{ [weak self] result in
            switch result {
            case .success(let employees):
                print("Employees:, \(employees.count)!")
                self?.employees = employees
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
