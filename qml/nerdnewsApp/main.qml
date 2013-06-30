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
        //        source: "http://nerdnews.ir/stories.json"
        source: "stories.json"
    }

    ListView {
        id: titleView
        model: stories.model
        delegate: TitleDelegate { onClicked: window.state = "SHOWCONTENT" }
        anchors.fill: parent
    }

    ContentPage {
        id: contentPage
        width: parent.width
        height: parent.height
        x: -width
    }

    states: State {
        name: "SHOWCONTENT"
        PropertyChanges { target: contentPage; x: 0 }
    }

    transitions: Transition {
        from: "*"
        to: "*"
        NumberAnimation { properties: "x"; duration: 200; easing.type: Easing.InCubic }
    }
}
