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

/** DialogNodeGoTo. */
public struct DialogNodeGoTo: JSONDecodable, JSONEncodable {

    /// The ID of the dialog node to go to.
    public let dialogNode: String?

    /// Where in the target node focus is passed to.
    public let selector: String?

    /// Reserved for future use.
    public let _return: Bool?

    /**
     Initialize a `DialogNodeGoTo` with member variables.

     - parameter dialogNode: The ID of the dialog node to go to.
     - parameter selector: Where in the target node focus is passed to.
     - parameter _return: Reserved for future use.

     - returns: An initialized `DialogNodeGoTo`.
    */
    public init(dialogNode: String? = nil, selector: String? = nil, _return: Bool? = nil) {
        self.dialogNode = dialogNode
        self.selector = selector
        self._return = _return
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `DialogNodeGoTo` model from JSON.
    public init(json: JSON) throws {
        dialogNode = try? json.getString(at: "dialog_node")
        selector = try? json.getString(at: "selector")
        _return = try? json.getBool(at: "return")
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `DialogNodeGoTo` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        if let dialogNode = dialogNode { json["dialog_node"] = dialogNode }
        if let selector = selector { json["selector"] = selector }
        if let _return = _return { json["return"] = _return }
        return json
    }
}
