//
//  Texts_WidgetLiveActivity.swift
//  Texts-Widget
//
//  Created by Samuel Lee on 6/8/2567 BE.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Texts_WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Texts_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Texts_WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension Texts_WidgetAttributes {
    fileprivate static var preview: Texts_WidgetAttributes {
        Texts_WidgetAttributes(name: "World")
    }
}

extension Texts_WidgetAttributes.ContentState {
    fileprivate static var smiley: Texts_WidgetAttributes.ContentState {
        Texts_WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Texts_WidgetAttributes.ContentState {
         Texts_WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Texts_WidgetAttributes.preview) {
   Texts_WidgetLiveActivity()
} contentStates: {
    Texts_WidgetAttributes.ContentState.smiley
    Texts_WidgetAttributes.ContentState.starEyes
}
