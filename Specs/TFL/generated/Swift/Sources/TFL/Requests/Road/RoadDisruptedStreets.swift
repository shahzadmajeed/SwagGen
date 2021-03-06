//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.Road {

    public enum RoadDisruptedStreets {

        public static let service = APIService<Response>(id: "Road_DisruptedStreets", tag: "Road", method: "GET", path: "/Road/all/Street/Disruption", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Optional, the start time to filter on. */
                public var startDate: Date

                /** Optional, The end time to filter on. */
                public var endDate: Date

                public init(startDate: Date, endDate: Date) {
                    self.startDate = startDate
                    self.endDate = endDate
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: RoadDisruptedStreets.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(startDate: Date, endDate: Date) {
                let options = Options(startDate: startDate, endDate: endDate)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: JSONDictionary = [:]
                params["startDate"] = options.startDate.encode()
                params["endDate"] = options.endDate.encode()
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Object

            /** OK */
            case status200(Object)

            public var success: Object? {
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

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 200: self = try .status200(JSONDecoder.decode(data: data))
                default: throw APIError.unexpectedStatusCode(statusCode: statusCode, data: data)
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
