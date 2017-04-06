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

/** ExampleCollection. */
public struct ExampleCollection: JSONDecodable, JSONEncodable {

    /// An array of Examples collection.
    public let examples: [ExampleResponse]?

    /**
     Initialize a `ExampleCollection` with member variables.

     - parameter examples: An array of Examples collection.

     - returns: An initialized `ExampleCollection`.
    */
    public init(examples: [ExampleResponse]? = nil) {
        self.examples = examples
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `ExampleCollection` model from JSON.
    public init(json: JSON) throws {
        examples = try? json.decodedArray(at: "examples", type: ExampleResponse.self)
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `ExampleCollection` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        if let examples = examples {
            json["examples"] = examples.map { $0.toJSONObject() }
        }
        return json
    }
}
