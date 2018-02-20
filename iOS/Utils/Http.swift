//
//  HTTP.swift
//  nativeHandset
//
//  Created by Albert Gao on 30/01/18.
//  Copyright © 2018 salect. All rights reserved.
//

import Foundation

class Http {
    var url: String
    var shouldDispatch: Bool
    var successCallback: (_ result: String) -> Void
    var errorCallback: (_ errMessage: String) -> Void

    private var dataTask: URLSessionDataTask?

    init(
        url:String,
        shouldDispatch:Bool,
        successCallback: @escaping (_ result: String) -> Void,
        errorCallback: @escaping (_ errMessage: String) -> Void
    )
    {
        self.url = url
        self.shouldDispatch = shouldDispatch
        self.successCallback = successCallback
        self.errorCallback = errorCallback
    }

    func get(isDispatch:Bool = false, queryString:[String: Any]) {
        guard var urlComponents = URLComponents(string: self.url) else {
            self.errorCallback("URLComponents init failed")
            return
        }

        urlComponents.query = Http.dictToQuerystring(dictionary:queryString)

        guard let url = urlComponents.url else {
            self.errorCallback("Retrieve urlComponents.url failed")
            return
        }

        self.sendRequest(url)
    }

    func post(isDispatch:Bool = false, postBody:[String: Any?]) {
        let url = String(format: self.url)
        guard let serviceUrl = URL(string: url) else {
            return
        }

        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")

        guard let httpBody = try? JSONSerialization.data(withJSONObject: postBody, options: []) else {
            self.errorCallback("Error when constructing json object")
            return
        }
        request.httpBody = httpBody

        self.sendRequest(request)
    }

    // MARK: private utils
    private func sendRequest(_ url: URL) {
        self.dataTask?.cancel()
        self.dataTask = URLSession.shared.dataTask(
                with: url,
                completionHandler: self.receiveResponse
        )
        dataTask?.resume()
    }

    private func sendRequest(_ url: URLRequest) {
        self.dataTask?.cancel()
        self.dataTask = URLSession.shared.dataTask(
                with: url,
                completionHandler: self.receiveResponse
        )
        dataTask?.resume()
    }

    private func receiveResponse(data: Data?, response: URLResponse?, error: Error?) {
        defer {
            self.dataTask = nil
        }

        if let error = error {
            runDispatchedCallback(callback: self.errorCallback, info: error.localizedDescription)
            return
        }

        if let data = data, let response = response as? HTTPURLResponse {
            let str = self.getStrFromJson(jsonObject: data)
            if response.statusCode > 226 {
                DispatchQueue.main.async {
                    self.errorCallback(str)
                }
            } else {
                self.successCallback(str)
            }
        }
    }
    
    private func runDispatchedCallback(callback:@escaping (String) -> Void, info:String) {
        if self.shouldDispatch {
            DispatchQueue.main.async {
                callback(info)
            }
        } else {
            callback(info)
        }
    }
    
    private func stringToDictionary(jsonText: String) -> [String: Any]? {
        if let data = jsonText.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(
                        with: data,
                        options: []
                ) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }

    private func getStrFromJson(jsonObject:Data) -> String {
        if let str = String(data: jsonObject, encoding: String.Encoding.utf8) {
            return str
        } else {
            return "{}"
        }
    }

    static func dictToJsonString(dictionary:Dictionary<String, Any>) -> String {
        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)
        if let jsonString = jsonString {
            return jsonString
        } else {
            return "{}"
        }
    }
    
    static func dictToQuerystring(dictionary:Dictionary<String, Any>) -> String {
        return dictionary.flatMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }).joined(separator: "&")
    }
}
