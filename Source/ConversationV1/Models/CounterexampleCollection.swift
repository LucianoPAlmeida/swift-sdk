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

/** CounterexampleCollection. */
public struct CounterexampleCollection: JSONDecodable, JSONEncodable {

    /// An array of CounterExample collection.
    public let counterexamples: [ExampleResponse]?

    /**
     Initialize a `CounterexampleCollection` with member variables.

     - parameter counterexamples: An array of CounterExample collection.

     - returns: An initialized `CounterexampleCollection`.
    */
    public init(counterexamples: [ExampleResponse]? = nil) {
        self.counterexamples = counterexamples
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `CounterexampleCollection` model from JSON.
    public init(json: JSON) throws {
        counterexamples = try? json.decodedArray(at: "counterexamples", type: ExampleResponse.self)
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `CounterexampleCollection` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        if let counterexamples = counterexamples {
            json["counterexamples"] = counterexamples.map { $0.toJSONObject() }
        }
        return json
    }
}
