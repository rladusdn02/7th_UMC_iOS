//
//  UserTargetType.swift
//  UMC-iOS-workbook

import Foundation
import Moya

///각 case에는 API의 내용이 담기도록 네이밍함
///method+내용 형식으로 작성함
enum UserTargetType {
    case getAllUsers
    case postFile(image: Data)
}

extension UserTargetType: TargetType {
    var baseURL: URL {
        guard let baseURL = URL(string: "https://api.escuelajs.co") else {
            fatalError("Error: Invalid URL")
        }
        
        return baseURL
    }
    var path: String {
        switch self {
        case .getAllUsers:
            return "/api/v1/users"
        case .postFile(image: let image):
            return "/api/v1/files/upload"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllUsers:
            return .get
        case .postFile(image: let image):
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getAllUsers:
            return .requestPlain
        case let .postFile(imageData):
            let formData = MultipartFormData(
                provider: .data(imageData),
                name: "file",
                fileName: "mamechi",
                mimeType: "image/png"
            )
            
            return .uploadMultipart([formData])
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getAllUsers:
            return ["Content-Type" : "application/json"]
        case .postFile:
            return ["Content-Type" : "multipart/form-data"]
        }
    }
}
