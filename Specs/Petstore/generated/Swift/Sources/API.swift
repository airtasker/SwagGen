//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public let version = "1.0.0"

public struct Config {
    /// Whether to discard any errors when decoding optional properties
    public static var safeOptionalDecoding = false

    /// Whether to remove invalid elements instead of throwing when decoding arrays
    public static var safeArrayDecoding = false

    /// Used to encode Dates when uses as string params
    public static let dateEncodingFormatter = DateFormatter(formatString: "yyyy-MM-dd'T'HH:mm:ssZZZZZ")
}

public enum Server {

    /** Test environment **/
    public static func test(space: String = "main", version: String = "v1") -> String {
        var url = "https://test.petstore.com/{version}/{space}"
        url = url.replacingOccurrences(of: "{\(space)}", with: space)
        url = url.replacingOccurrences(of: "{\(version)}", with: version)
        return url
    }

    /** Prod environment **/
    public static let prod = "http://petstore.swagger.io/v1"
}

/// Tags
public enum Pets {}
