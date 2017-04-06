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

/** RuntimeLogMessage. */
public struct RuntimeLogMessage: JSONDecodable, JSONEncodable {

    /// The severity of the message (info, error, or warn).
    public let level: String

    /// The text of the message.
    public let msg: String

    /**
     Initialize a `RuntimeLogMessage` with member variables.

     - parameter level: The severity of the message (info, error, or warn).
     - parameter msg: The text of the message.

     - returns: An initialized `RuntimeLogMessage`.
    */
    public init(level: String, msg: String) {
        self.level = level
        self.msg = msg
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `RuntimeLogMessage` model from JSON.
    public init(json: JSON) throws {
        level = try json.getString(at: "level")
        msg = try json.getString(at: "msg")
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `RuntimeLogMessage` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["level"] = level
        json["msg"] = msg
        return json
    }
}
