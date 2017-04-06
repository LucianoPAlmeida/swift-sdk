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

/** ValueResponse. */
public struct ValueResponse: JSONDecodable, JSONEncodable {

    /// The name of the corresponding entity.
    public let value: String

    /// Any metadata related to the entity value.
    public let metadata: Any

    /// The timestamp for creation of the entity value.
    public let created: String

    /// The timestamp for the last update to the entity value.
    public let updated: String

    /**
     Initialize a `ValueResponse` with member variables.

     - parameter value: The name of the corresponding entity.
     - parameter metadata: Any metadata related to the entity value.
     - parameter created: The timestamp for creation of the entity value.
     - parameter updated: The timestamp for the last update to the entity value.

     - returns: An initialized `ValueResponse`.
    */
    public init(value: String, metadata: Any, created: String, updated: String) {
        self.value = value
        self.metadata = metadata
        self.created = created
        self.updated = updated
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `ValueResponse` model from JSON.
    public init(json: JSON) throws {
        value = try json.getString(at: "value")
        metadata = try json.getJSON(at: "metadata")
        created = try json.getString(at: "created")
        updated = try json.getString(at: "updated")
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `ValueResponse` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["value"] = value
        json["metadata"] = metadata
        json["created"] = created
        json["updated"] = updated
        return json
    }
}
