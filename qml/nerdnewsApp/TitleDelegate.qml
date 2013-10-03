import QtQuick 2.0

Rectangle {
    id:root

    color: "silver"
    width:  ListView.view.width
    height: ListView.view.height / 6

    signal clicked

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked()
        }
    }

    Rectangle { width: parent.width; height: 1; color: "white"; anchors.top: parent.top }
    Rectangle { width: parent.width; height: 1; color: "gray" ; anchors.bottom: parent.bottom }

    Item {
        id: authorName
        anchors {
            top : imageFrame.bottom
            bottom: parent.bottom
            left: parent.left
            right: imageFrame.right
        }

        Text {
            text: model.author
            anchors.centerIn: parent
            color: "#534d4d"
            font.pixelSize: text.length < 8? root.height / 8 : root.height / 9

        }
    }

    Item {
        id: publishDate
        anchors {
            top : imageFrame.bottom
            bottom: parent.bottom
            bottomMargin: 4
            left: authorName.right
            leftMargin: 5
            right: parent.right
        }

        Text {
            text: model.published_at
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            color: "gray"
            font.pixelSize: root.height / 8
        }
    }

    Rectangle {
        id: imageFrame
        width: height
        height: parent.height / 1.5
        anchors.left: parent.left
        anchors.leftMargin: 5
        radius: 9
        color: "silver"
        anchors.verticalCenter: parent.verticalCenter

        Image {
            id: titleImage
            source: model.tags.get(0).tag.thumbnail_url
            anchors.fill: parent
            asynchronous: true
            clip: true
        }
    }

    Item {
        height: imageFrame.height
        anchors {
            verticalCenter: parent.verticalCenter
            left: imageFrame.right
            leftMargin: 5
            right: pointerPicture.left
            rightMargin: 5
        }

        Text {
            text: LayoutMirroring.enabled? '\u200F' + model.title : model.title   // \u200F to force showing etxts RTL
            anchors.fill: parent
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            font.pixelSize: parent.height / 4
        }
    }

    Image {
        id: pointerPicture
        source: "images/arrow.png"
        width: imageFrame.width / 2
        height: imageFrame.height / 2
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        rotation: LayoutMirroring.enabled ? -180 :0
    }

    Image {
        id: star
        source: "images/star.svg"
        width: height
        height: parent.height / 6
        anchors.bottom: pointerPicture.top
        anchors.bottomMargin: height / 2
        anchors.horizontalCenter: pointerPicture.horizontalCenter
        sourceSize.height: height
        sourceSize.width: width
    }

    Item {
        width: height
        height: parent.height / 6
        anchors.right: star.left
        anchors.rightMargin: 3
        anchors.bottom: pointerPicture.top
        anchors.bottomMargin: height / 2
        Text {
            text: model.total_point
            anchors.centerIn: parent
            font.bold: true
        }
    }

    Image {
        id: commentsCount
        source: "images/comment.svg"
        width: height
        height: parent.height / 6
        anchors.top: pointerPicture.bottom
        anchors.topMargin: height / 2
        anchors.horizontalCenter: pointerPicture.horizontalCenter
        sourceSize.height: height
        sourceSize.width: width
    }

    Item {
        width: height
        height: parent.height / 6
        anchors.top: pointerPicture.bottom
        anchors.topMargin: height / 2
        anchors.right: commentsCount.left
        anchors.rightMargin: 3
        Text {
            text: model.comments_count
            anchors.centerIn: parent
            font.bold: true
        }
    }
}
