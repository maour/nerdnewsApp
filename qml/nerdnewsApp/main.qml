import QtQuick 2.1
import "JSONListModel"

Rectangle {
    id: window
    width: 300
    height: 500

    LayoutMirroring.enabled: true
    LayoutMirroring.childrenInherit: true

    JSONListModel {
        id: stories
        source: "http://nerdnews.ir/stories.json"
    }

    ListView {
        id: titleView
        model: stories.model
        delegate: TitleDelegate {}
        anchors.fill: parent        
    }
}
