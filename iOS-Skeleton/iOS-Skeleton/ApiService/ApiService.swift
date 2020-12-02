//
//  ApiService.swift
//  iOS-Skeleton
//
//  Created by Fayme on 23/11/20.
//

import Foundation

enum ApiError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct ApiService {
    let resourceUrl: URL
    
    init() {
        let resourceString = "http://dummy.restapiexample.com/api/v1/employees"
        guard let resourceUrl = URL(string: resourceString) else {fatalError("Url is invalid")}
        self.resourceUrl = resourceUrl
    }
    
    func getEmployees(completion: @escaping(Result<[Employee], ApiError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceUrl) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let employeeResponse = try decoder.decode(Employees.self, from: jsonData)
                let employees = employeeResponse.employees
                completion(.success(employees))
            }catch{
                completion(.failure(.canNotProcessData))
            }
        }
        dataTask.resume()
    }
    
    
}
