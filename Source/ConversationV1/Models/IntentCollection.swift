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

/** IntentCollection. */
public struct IntentCollection: JSONDecodable, JSONEncodable {

    /// An array of Intent collection.
    public let intents: [IntentExportResponse]?

    /**
     Initialize a `IntentCollection` with member variables.

     - parameter intents: An array of Intent collection.

     - returns: An initialized `IntentCollection`.
    */
    public init(intents: [IntentExportResponse]? = nil) {
        self.intents = intents
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `IntentCollection` model from JSON.
    public init(json: JSON) throws {
        intents = try? json.decodedArray(at: "intents", type: IntentExportResponse.self)
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `IntentCollection` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        if let intents = intents {
            json["intents"] = intents.map { $0.toJSONObject() }
        }
        return json
    }
}
