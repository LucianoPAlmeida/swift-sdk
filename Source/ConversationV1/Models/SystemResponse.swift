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
public struct SystemResponse: JSONDecodable, JSONEncodable {

    /// The raw JSON object used to construct this model.
    public let json: [String: Any]

    /// An array of dialog node IDs that are in focus in the conversation.
    public let dialogStack: [DialogStack]

    /// The number of cycles of user input and response in this conversation.
    public let dialogTurnCounter: Int

    /// The number of inputs in this conversation. This counter might be higher than the <tt>dialog_turn_counter</tt> counter when multiple inputs are needed before a response can be returned.
    public let dialogRequestCounter: Int

    // MARK: JSONDecodable
    /// Used internally to initialize a `SystemResponse` model from JSON.
    public init(json: JSON) throws {
        self.json = try json.getDictionaryObject()
        dialogStack = try json.decodedArray(at: "dialog_stack", type: DialogStack.self)
        dialogTurnCounter = try json.getInt(at: "dialog_turn_counter")
        dialogRequestCounter = try json.getInt(at: "dialog_request_counter")
    }

    // MARK: JSONEncodable
    /// Used internally to serialize a `SystemResponse` model to JSON.
    public func toJSONObject() -> Any {
        return json
    }
}
