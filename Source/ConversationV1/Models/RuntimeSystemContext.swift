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

/** A system object that includes information about the dialog. */
public struct RuntimeSystemContext: JSONDecodable, JSONEncodable {

    /// An array of dialog node ids that are in focus in the conversation. If no node is in the list, the conversation restarts at the root with the next request. If multiple dialog nodes are in the list, several dialogs are in progress, and the last ID in the list is active. When the active dialog ends, it is removed from the stack and the previous one becomes active.
    public let dialogStack: [RuntimeDialogStack]

    /// The number of cycles of user input and response in this conversation.
    public let dialogTurnCounter: Int

    /// The number of inputs in this conversation. This counter might be higher than the `dialogTurnCounter` when multiple inputs are needed before a response can be returned.
    public let dialogRequestCounter: Int

    /**
     Initialize a `RuntimeSystemContext` with member variables.

     - parameter dialogStack: An array of dialog node ids that are in focus in the conversation. If no node is in the list, the conversation restarts at the root with the next request. If multiple dialog nodes are in the list, several dialogs are in progress, and the last ID in the list is active. When the active dialog ends, it is removed from the stack and the previous one becomes active.
     - parameter dialogTurnCounter: The number of cycles of user input and response in this conversation.
     - parameter dialogRequestCounter: The number of inputs in this conversation. This counter might be higher than the `dialogTurnCounter` when multiple inputs are needed before a response can be returned.

     - returns: An initialized `RuntimeSystemContext`.
    */
    public init(dialogStack: [RuntimeDialogStack], dialogTurnCounter: Int, dialogRequestCounter: Int) {
        self.dialogStack = dialogStack
        self.dialogTurnCounter = dialogTurnCounter
        self.dialogRequestCounter = dialogRequestCounter
    }

    // MARK: JSONDecodable
    /// Used internally to initialize a `RuntimeSystemContext` model from JSON.
    public init(json: JSON) throws {
        dialogStack = try json.decodedArray(at: "dialog_stack", type: RuntimeDialogStack.self)
        dialogTurnCounter = try json.getInt(at: "dialog_turn_counter")
        dialogRequestCounter = try json.getInt(at: "dialog_request_counter")
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `RuntimeSystemContext` model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["dialog_stack"] = dialogStack.map { $0.toJSONObject() }
        json["dialog_turn_counter"] = dialogTurnCounter
        json["dialog_request_counter"] = dialogRequestCounter
        return json
    }
}
