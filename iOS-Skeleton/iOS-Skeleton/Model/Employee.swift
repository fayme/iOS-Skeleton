//
//  Employee.swift
//  iOS-Skeleton
//
//  Created by Fayme on 23/11/20.
//

import Foundation

// MARK: - Employees
struct Employees: Decodable {
    let status: String
    let employees: [Employee]
    
    enum CodingKeys: String, CodingKey {
            case employees = "data"
            case status
    }
    
    init (from decoder :Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            employees = try container.decode([Employee].self, forKey: .employees)
            status = try container.decode(String.self, forKey: .status)
    }
}

// MARK: - Data
struct Employee: Decodable {
    let id, employeeName, employeeSalary, employeeAge: String
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
