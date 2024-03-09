//
//  StocksWidgetLiveActivity.swift
//  StocksWidget
//
//  Created by David Kochkin on 08.03.2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct StocksWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct StocksWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: StocksWidgetAttributes.self) { context in
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

extension StocksWidgetAttributes {
    fileprivate static var preview: StocksWidgetAttributes {
        StocksWidgetAttributes(name: "World")
    }
}

extension StocksWidgetAttributes.ContentState {
    fileprivate static var smiley: StocksWidgetAttributes.ContentState {
        StocksWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: StocksWidgetAttributes.ContentState {
         StocksWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: StocksWidgetAttributes.preview) {
   StocksWidgetLiveActivity()
} contentStates: {
    StocksWidgetAttributes.ContentState.smiley
    StocksWidgetAttributes.ContentState.starEyes
}
