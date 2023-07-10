//
//  Created by Timofey Hammer on 2023-07-06.
//

import Foundation

struct NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func myFirstRequest() {
        request(route: .temp, method: .get, completion: { _ in })
    }
    
    private func request<T: Decodable>(route: Route,
                                         method: Method,
                                         parameters: [String: Any]? = nil,
                                         completion: @escaping(Result<T, Error>) -> Void) {
            guard let request = createRequest(route: route, method: method, parameters: parameters) else {
                completion(.failure(AppError.unknownError))
                return
            }
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                var result: Result<Data, Error>?
                if let data = data {
                    result = .success(data)
                    let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
                    print("The response is:\n\(responseString)")
                } else if let error = error {
                    result = .failure(error)
                    print("The error is: \(error.localizedDescription)")
                }
                
                DispatchQueue.main.async {
                   
                }
            }.resume()
        }
    
    private func createRequest(route: Route, method: Method, parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlRequest.url = urlComponent?.url
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
            case .post, .delete, .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        
        return urlRequest
    }
}
