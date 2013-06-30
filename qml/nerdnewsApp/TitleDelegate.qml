import QtQuick 2.0

Rectangle {
    id:root

    color: "silver"
    width:  ListView.view.width
    height: ListView.view.height / 6

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

    Item {
        id: imageFrame
        width: height
        height: parent.height / 1.5
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenter: parent.verticalCenter

        Image {
            id: star
            source: "images/star.png"
            width: parent.width / 3
            height: width
            anchors.top: parent.top
            anchors.right: parent.right

            Text {
                text: model.total_point
                anchors.centerIn: parent
                font.pixelSize: parent.width / 2
            }
        }

        Image {
            id: titleImage
            source: "images/icon"  //temporary image
            anchors.fill: parent
        }
    }

    Item {
        height: imageFrame.height
        anchors {
            verticalCenter: parent.verticalCenter
            left: imageFrame.right
            leftMargin: 5
            right: commentsCount.left
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
        id: commentsCount
        source: "images/comment.svg"
        opacity: 0.3
        width: height
        height: parent.height / 4
        anchors.right: pointerPicture.left
        anchors.verticalCenter: parent.verticalCenter

        Text {
            text: model.comments_count
            anchors.centerIn: parent
            font.bold: true
        }
    }
}
