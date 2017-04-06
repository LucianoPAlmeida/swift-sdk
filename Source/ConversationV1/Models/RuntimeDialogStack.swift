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

/** RuntimeDialogStack. */
public struct RuntimeDialogStack: JSONDecodable, JSONEncodable {

    /// The ID of a dialog node.
    public let dialogNode: String

    /// Reserved for future use.
    public let invokedSubdialog: String?

    /**
     Initialize a `RuntimeDialogStack` with member variables.

     - parameter dialogNode: The ID of a dialog node.
     - parameter invokedSubdialog: Reserved for future use.

     - returns: An initialized `RuntimeDialogStack`.
    */
    public init(dialogNode: String, invokedSubdialog: String? = nil) {
        self.dialogNode = dialogNode
        self.invokedSubdialog = invokedSubdialog
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `RuntimeDialogStack` model from JSON.
    public init(json: JSON) throws {
        dialogNode = try json.getString(at: "dialog_node")
        invokedSubdialog = try? json.getString(at: "invoked_subdialog")
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `RuntimeDialogStack` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["dialog_node"] = dialogNode
        if let invokedSubdialog = invokedSubdialog { json["invoked_subdialog"] = invokedSubdialog }
        return json
    }
}
