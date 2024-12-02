//
//  APIClient.swift
//  UMC-iOS-workbook

import Foundation
import Alamofire

final class APIClient {
    static let shared = APIClient()
    
    private let session: Session
    private let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    private init() {
        guard let apiKey = apiKey else {
                    fatalError("API_KEY is missing in the Info.plist")
                }
        print(apiKey)
        let interceptor = AuthorizationInterceptor(kakaoKey: apiKey) // 본인의 API key
        session = Session(interceptor: interceptor)
    }
    
    public func request<T: Codable>(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        completion: @escaping (Result<T, Error>) -> Void) {
            session.request(url, method: method, parameters: parameters)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        completion(.success(value))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
}
   
