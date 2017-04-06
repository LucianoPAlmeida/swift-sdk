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

/** CreateDialogNode. */
public struct CreateDialogNode: JSONDecodable, JSONEncodable {

    /// The dialog node ID.
    public let dialogNode: String

    /// The description of the dialog node.
    public let description: String?

    /// The condition that will trigger the dialog node.
    public let conditions: String?

    /// The parent dialog node.
    public let parent: String?

    /// The previous dialog node.
    public let previousSibling: String?

    public let output: DialogNodeOutput?

    /// The context for the dialog node.
    public let context: Any?

    /// The metadata for the dialog node.
    public let metadata: Any?

    public let goTo: DialogNodeGoTo?

    /**
     Initialize a `CreateDialogNode` with member variables.

     - parameter dialogNode: The dialog node ID.
     - parameter description: The description of the dialog node.
     - parameter conditions: The condition that will trigger the dialog node.
     - parameter parent: The parent dialog node.
     - parameter previousSibling: The previous dialog node.
     - parameter output: 
     - parameter context: The context for the dialog node.
     - parameter metadata: The metadata for the dialog node.
     - parameter goTo: 

     - returns: An initialized `CreateDialogNode`.
    */
    public init(dialogNode: String, description: String? = nil, conditions: String? = nil, parent: String? = nil, previousSibling: String? = nil, output: DialogNodeOutput? = nil, context: Any? = nil, metadata: Any? = nil, goTo: DialogNodeGoTo? = nil) {
        self.dialogNode = dialogNode
        self.description = description
        self.conditions = conditions
        self.parent = parent
        self.previousSibling = previousSibling
        self.output = output
        self.context = context
        self.metadata = metadata
        self.goTo = goTo
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `CreateDialogNode` model from JSON.
    public init(json: JSON) throws {
        dialogNode = try json.getString(at: "dialog_node")
        description = try? json.getString(at: "description")
        conditions = try? json.getString(at: "conditions")
        parent = try? json.getString(at: "parent")
        previousSibling = try? json.getString(at: "previous_sibling")
        output = try? json.decode(at: "output", type: DialogNodeOutput.self)
        context = try? json.getJSON(at: "context")
        metadata = try? json.getJSON(at: "metadata")
        goTo = try? json.decode(at: "go_to", type: DialogNodeGoTo.self)
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `CreateDialogNode` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["dialog_node"] = dialogNode
        if let description = description { json["description"] = description }
        if let conditions = conditions { json["conditions"] = conditions }
        if let parent = parent { json["parent"] = parent }
        if let previousSibling = previousSibling { json["previous_sibling"] = previousSibling }
        if let output = output { json["output"] = output.toJSONObject() }
        if let context = context { json["context"] = context }
        if let metadata = metadata { json["metadata"] = metadata }
        if let goTo = goTo { json["go_to"] = goTo.toJSONObject() }
        return json
    }
}
