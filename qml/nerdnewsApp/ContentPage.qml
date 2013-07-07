import QtQuick 2.0
Rectangle {

    property alias storyTitle: titleText.text
    property alias storyContent: contentText.text
    property alias storyIcon: imagePlace.source
    property alias storyDate: dateText.text
    property alias storyAuthor: authorText.text
    property alias storyScore: scoreText.text

    Rectangle { //background
        anchors.fill: parent
        color: "white"
        MouseArea {
            anchors.fill: parent
        }
    }

    Rectangle {
        id: datePlace
        color: "gray"
        width: parent.width
        height: parent.height / 25
        y : - (height /3)

        radius: 5
        Text {
            id: dateText
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: parent.height  / 2
            color: "white"
        }
    }

    Row {
        id: detailRow
        height: parent.height / 7
        anchors {
            top: datePlace.bottom
            left: parent.left
            leftMargin: 10
            right: parent.right
            rightMargin: 10
        }

        Image {
            id: imagePlace
            height: parent.height
            width: parent.width / 2
            asynchronous: true
            fillMode: Image.PreserveAspectFit
        }

        Column {
            height: parent.height
            width: parent.width / 2
            Rectangle {
                id: authorPlace
                height: parent.height / 3
                width: parent.width
                color: "#8fd322"
                Text {
                    id: authorText
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id: scorePlace
                height: parent.height / 3
                width: parent.width
                color: "#eaff00"
                Text {
                    id: scoreText
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id: tagsPlace
                height: parent.height / 3
                width: parent.width
                color: "blue"
            }
        }
    }

    Rectangle {
        id: storyTitle
        color: "pink"
        width: parent.width
        height: parent.height / 7
        anchors.top: detailRow.bottom

        Text {
            id: titleText
            anchors.fill: parent
            wrapMode: Text.WordWrap
            font.pixelSize: text.length > 50? 16 : 20
            font.bold: true
        }
    }

    Flickable {
        flickableDirection: Flickable.VerticalFlick
        contentWidth: width
        contentHeight: contentText.paintedHeight
        clip: true
        anchors {
            top: storyTitle.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Text {
            id: contentText
            anchors.fill: parent
            wrapMode: Text.WordWrap
            font.pixelSize: 15
            textFormat: Text.RichText
        }
    }
}
