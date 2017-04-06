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

/** DialogNodeCollection. */
public struct DialogNodeCollection: JSONDecodable, JSONEncodable {

    /// An array of dialog nodes.
    public let dialogNodes: [DialogNodeResponse]?

    /**
     Initialize a `DialogNodeCollection` with member variables.

     - parameter dialogNodes: An array of dialog nodes.

     - returns: An initialized `DialogNodeCollection`.
    */
    public init(dialogNodes: [DialogNodeResponse]? = nil) {
        self.dialogNodes = dialogNodes
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `DialogNodeCollection` model from JSON.
    public init(json: JSON) throws {
        dialogNodes = try? json.decodedArray(at: "dialog_nodes", type: DialogNodeResponse.self)
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `DialogNodeCollection` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        if let dialogNodes = dialogNodes {
            json["dialog_nodes"] = dialogNodes.map { $0.toJSONObject() }
        }
        return json
    }
}
