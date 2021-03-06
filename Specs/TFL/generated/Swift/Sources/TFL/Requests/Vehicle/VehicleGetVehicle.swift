//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.Vehicle {

    public enum VehicleGetVehicle {

        public static let service = APIService<Response>(id: "Vehicle_GetVehicle", tag: "Vehicle", method: "GET", path: "/Vehicle/EmissionSurcharge", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The Vehicle Registration Mark */
                public var vrm: String

                public init(vrm: String) {
                    self.vrm = vrm
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: VehicleGetVehicle.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(vrm: String) {
                let options = Options(vrm: vrm)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: JSONDictionary = [:]
                params["vrm"] = options.vrm
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = EmissionsSurchargeVehicle

            /** OK */
            case status200(EmissionsSurchargeVehicle)

            public var success: EmissionsSurchargeVehicle? {
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
