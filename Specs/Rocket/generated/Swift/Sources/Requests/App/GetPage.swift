//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension App {

    /** Returns a page with the specified id.
If targeting the search page you must url encode the search term as a parameter
using the `q` key. For example if your browser path looks like `/search?q=the`
then what you pass to this endpoint would look like `/page?path=/search%3Fq%3Dthe`.
 */
    public enum GetPage {

        public static let service = APIService<Response>(id: "getPage", tag: "app", method: "GET", path: "/page", hasBody: false)

        /** Only relevant when loading item detail pages as these embed a detailed item in the main page entry.
        If no value is specified no item dependencies are expanded.
        If 'children' is specified then the list of any direct children will be expanded. For example
        seasons of a show or episodes of a season.
        If 'all' is specified then the parent chain will be expanded along with any child list at each level.
        For example if an episode is specified then its season will be expanded and that season's episode list.
        The season will have its show expanded and the show will have its season list expanded.
        The 'all' options is useful when you deep link into a show/season/episode for the first time as
        it provides full context for navigating around the show page. Subsequent navigation around
        children of the show should only need to request expand of children.
        If an expand is specified which is not relevant to the item type, it will be ignored.
         */
        public enum ItemDetailExpand: String, Codable, Equatable, CaseIterable {
            case all = "all"
            case children = "children"
        }

        /** Only relevant when loading show detail pages as these embed a detailed item in the main page entry.
        Given a targeted show page, it can be useful to get the details of a child season. This option
        provides a means to return the `first` or `latest` season of a show embedded in the page.
        The `expand` parameter also works here so for example you could land on a show page and request the
        `item_detail_select_season=latest` along with `item_detail_expand=all`. This would then return the
        detail of the latest season with its list of child episode summaries, and also expand
        the detail of the show with its list of seasons summaries.
         */
        public enum ItemDetailSelectSeason: String, Codable, Equatable, CaseIterable {
            case first = "first"
            case latest = "latest"
        }

        /** Only relevant to page entries of type `TextEntry`.
        Converts the value of a text page entry to the specified format.
         */
        public enum TextEntryFormat: String, Codable, Equatable, CaseIterable {
            case markdown = "markdown"
            case html = "html"
        }

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The path of the page to load, e.g. '/movies'. */
                public var path: String

                /** The number of items to load when prefetching and paging each list in the page row. */
                public var listPageSize: Int?

                /** The number of items to load when prefetching a continuous scroll list entry in a page.
By default any list page entry with template pattern `/^CS\d+$/` will
be considered a continuous scroll list.
 */
                public var listPageSizeLarge: Int?

                /** The maximum number of lists to prefetch in the page. */
                public var maxListPrefetch: Int?

                /** Only relevant when loading item detail pages as these embed a detailed item in the main page entry.
If no value is specified no item dependencies are expanded.
If 'children' is specified then the list of any direct children will be expanded. For example
seasons of a show or episodes of a season.
If 'all' is specified then the parent chain will be expanded along with any child list at each level.
For example if an episode is specified then its season will be expanded and that season's episode list.
The season will have its show expanded and the show will have its season list expanded.
The 'all' options is useful when you deep link into a show/season/episode for the first time as
it provides full context for navigating around the show page. Subsequent navigation around
children of the show should only need to request expand of children.
If an expand is specified which is not relevant to the item type, it will be ignored.
 */
                public var itemDetailExpand: ItemDetailExpand?

                /** Only relevant when loading show detail pages as these embed a detailed item in the main page entry.
Given a targeted show page, it can be useful to get the details of a child season. This option
provides a means to return the `first` or `latest` season of a show embedded in the page.
The `expand` parameter also works here so for example you could land on a show page and request the
`item_detail_select_season=latest` along with `item_detail_expand=all`. This would then return the
detail of the latest season with its list of child episode summaries, and also expand
the detail of the show with its list of seasons summaries.
 */
                public var itemDetailSelectSeason: ItemDetailSelectSeason?

                /** Only relevant to page entries of type `TextEntry`.
Converts the value of a text page entry to the specified format.
 */
                public var textEntryFormat: TextEntryFormat?

                /** The maximum rating (inclusive) of items returned, e.g. 'auoflc-pg'. */
                public var maxRating: String?

                /** The type of device the content is targeting. */
                public var device: String?

                /** The active subscription code. */
                public var sub: String?

                /** The list of segments to filter the response by. */
                public var segments: [String]?

                /** The set of opt in feature flags which cause breaking changes to responses.
While Rocket APIs look to avoid breaking changes under the active major version, the formats of responses
may need to evolve over this time.
These feature flags allow clients to select which response formats they expect and avoid breaking
clients as these formats evolve under the current major version.
### Flags
- `all` - Enable all flags. Useful for testing. _Don't use in production_.
- `idp` - Dynamic item detail pages with schedulable rows.
- `ldp` - Dynamic list detail pages with schedulable rows.
See the `feature-flags.md` for available flag details.
 */
                public var ff: [FeatureFlags]?

                public init(path: String, listPageSize: Int? = nil, listPageSizeLarge: Int? = nil, maxListPrefetch: Int? = nil, itemDetailExpand: ItemDetailExpand? = nil, itemDetailSelectSeason: ItemDetailSelectSeason? = nil, textEntryFormat: TextEntryFormat? = nil, maxRating: String? = nil, device: String? = nil, sub: String? = nil, segments: [String]? = nil, ff: [FeatureFlags]? = nil) {
                    self.path = path
                    self.listPageSize = listPageSize
                    self.listPageSizeLarge = listPageSizeLarge
                    self.maxListPrefetch = maxListPrefetch
                    self.itemDetailExpand = itemDetailExpand
                    self.itemDetailSelectSeason = itemDetailSelectSeason
                    self.textEntryFormat = textEntryFormat
                    self.maxRating = maxRating
                    self.device = device
                    self.sub = sub
                    self.segments = segments
                    self.ff = ff
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetPage.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(path: String, listPageSize: Int? = nil, listPageSizeLarge: Int? = nil, maxListPrefetch: Int? = nil, itemDetailExpand: ItemDetailExpand? = nil, itemDetailSelectSeason: ItemDetailSelectSeason? = nil, textEntryFormat: TextEntryFormat? = nil, maxRating: String? = nil, device: String? = nil, sub: String? = nil, segments: [String]? = nil, ff: [FeatureFlags]? = nil) {
                let options = Options(path: path, listPageSize: listPageSize, listPageSizeLarge: listPageSizeLarge, maxListPrefetch: maxListPrefetch, itemDetailExpand: itemDetailExpand, itemDetailSelectSeason: itemDetailSelectSeason, textEntryFormat: textEntryFormat, maxRating: maxRating, device: device, sub: sub, segments: segments, ff: ff)
                self.init(options: options)
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                params["path"] = options.path
                if let listPageSize = options.listPageSize {
                  params["list_page_size"] = listPageSize
                }
                if let listPageSizeLarge = options.listPageSizeLarge {
                  params["list_page_size_large"] = listPageSizeLarge
                }
                if let maxListPrefetch = options.maxListPrefetch {
                  params["max_list_prefetch"] = maxListPrefetch
                }
                if let itemDetailExpand = options.itemDetailExpand?.encode() {
                  params["item_detail_expand"] = itemDetailExpand
                }
                if let itemDetailSelectSeason = options.itemDetailSelectSeason?.encode() {
                  params["item_detail_select_season"] = itemDetailSelectSeason
                }
                if let textEntryFormat = options.textEntryFormat?.encode() {
                  params["text_entry_format"] = textEntryFormat
                }
                if let maxRating = options.maxRating {
                  params["max_rating"] = maxRating
                }
                if let device = options.device {
                  params["device"] = device
                }
                if let sub = options.sub {
                  params["sub"] = sub
                }
                if let segments = options.segments?.joined(separator: ",") {
                  params["segments"] = segments
                }
                if let ff = options.ff?.encode().map({ String(describing: $0) }).joined(separator: ",") {
                  params["ff"] = ff
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Page

            /** The page requested. */
            case status200(Page)

            /** Bad request. */
            case status400(ServiceError)

            /** Not found. */
            case status404(ServiceError)

            /** Internal server error. */
            case status500(ServiceError)

            /** Service error. */
            case defaultResponse(statusCode: Int, ServiceError)

            public var success: Page? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: ServiceError? {
                switch self {
                case .status400(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<Page, ServiceError> {
                if let successValue = success {
                    return .success(successValue)
                } else if let failureValue = failure {
                    return .failure(failureValue)
                } else {
                    fatalError("Response does not have success or failure response")
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                case .status400(let response): return response
                case .status404(let response): return response
                case .status500(let response): return response
                case .defaultResponse(_, let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status400: return 400
                case .status404: return 404
                case .status500: return 500
                case .defaultResponse(let statusCode, _): return statusCode
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status400: return false
                case .status404: return false
                case .status500: return false
                case .defaultResponse: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(Page.self, from: data))
                case 400: self = try .status400(decoder.decode(ServiceError.self, from: data))
                case 404: self = try .status404(decoder.decode(ServiceError.self, from: data))
                case 500: self = try .status500(decoder.decode(ServiceError.self, from: data))
                default: self = try .defaultResponse(statusCode: statusCode, decoder.decode(ServiceError.self, from: data))
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
