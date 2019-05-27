//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension Auth {

    /** This API is deprecated please use "login" without send the URL instead */
    public enum AuthLoginWithoutRedirect {

        public static let service = APIService<Response>(id: "auth.loginWithoutRedirect", tag: "auth", method: "GET", path: "/auth/{cp}/loginWithoutRedirect.html", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                public var cp: String

                public var idp: String

                public var country: String?

                public var token: String?

                public init(cp: String, idp: String, country: String? = nil, token: String? = nil) {
                    self.cp = cp
                    self.idp = idp
                    self.country = country
                    self.token = token
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: AuthLoginWithoutRedirect.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(cp: String, idp: String, country: String? = nil, token: String? = nil) {
                let options = Options(cp: cp, idp: idp, country: country, token: token)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "cp" + "}", with: "\(self.options.cp)")
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                params["idp"] = options.idp
                if let country = options.country {
                  params["country"] = country
                }
                if let token = options.token {
                  params["token"] = token
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Auth

            /** Request was successful */
            case status200(Auth)

            public var success: Auth? {
                switch self {
                case .status200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(Auth.self, from: data))
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
