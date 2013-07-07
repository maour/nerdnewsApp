import QtQuick 2.1
import "JSONListModel"

Rectangle {
    id: window
    width: 300
    height: 500
    color: "silver"

    //enabling RTL for nerdnews.ir stories
    LayoutMirroring.enabled: true
    LayoutMirroring.childrenInherit: true

    JSONListModel {
        id: stories
        source: "http://nerdnews.ir/stories.json"
        //        source:"stories.json"
    }

    ListView {
        id: titleView
        model: stories.model
        delegate: TitleDelegate {
            onClicked: {
                contentPage.storyTitle = LayoutMirroring.enabled? '\u200F' + model.title : model.title //if UI is RTL then texts also should be RTL
                contentPage.storyContent = LayoutMirroring.enabled? '\u200F' + model.content : model.content //if UI is RTL then texts also should be RTL
                contentPage.storyIcon = "images/icon"
                contentPage.storyDate = model.published_at
                contentPage.storyAuthor = model.author
                contentPage.storyScore = model.total_point

                window.state = "SHOWCONTENT";
            }
        }

        anchors {
            top: toolBar.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        Behavior on scale { NumberAnimation {duration: 400; easing.type: Easing.OutCirc} }
    }

    ContentPage {
        id: contentPage
        anchors.top: toolBar.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        x: -width
        scale : 0.99
    }

    ToolBar {
        id: toolBar
        width: parent.width
        height: parent.height / 9
        titleText: "Nerd News"
        onBackButtonClicked: {
            window.state = ""
        }
    }

    states: State {
        name: "SHOWCONTENT"
        PropertyChanges { target: contentPage; x: 0 ; scale : 1}
        PropertyChanges { target: titleView; scale : 0.95 }
        PropertyChanges { target: toolBar; showBackButton: true }
    }

    transitions: Transition {
        from: "*"
        to: "*"
        NumberAnimation { properties: "x"; duration: 300; easing.type: Easing.OutCirc }
    }
}
