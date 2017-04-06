/**
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import RestKit

/** Log message details. */
public struct LogMessageResponse: JSONDecodable, JSONEncodable {

    /// The raw JSON object used to construct this model.
    public let json: [String: Any]

    /// The severity of the message.
    public enum Level: String {
        case info = "info"
        case error = "error"
        case warn = "warn"
    }

    /// The severity of the message.
    public let level: Level?

    /// The text of the message.
    public let msg: String?

    // MARK: JSONDecodable
    /// Used internally to initialize a `LogMessageResponse` model from JSON.
    public init(json: JSON) throws {
        self.json = try json.getDictionaryObject()
 
        guard let level = Level(rawValue: try json.getString(at: "level")) else {
            let type = type(of: Level.info)
            throw JSON.Error.valueNotConvertible(value: json, to: type)
        }
        self.level = level
        msg = try? json.getString(at: "msg")
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `LogMessageResponse` model to JSON.
    public func toJSONObject() -> Any {
        return json
    }
}
