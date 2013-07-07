import QtQuick 2.0

Rectangle {
    id: root

    width: 400
    height: 80
    color: "black"

    signal backButtonClicked

    property bool showBackButton: false
    property alias titleText: titleText.text

    Image {
        id: background
        source: "images/bar.jpg"
        anchors.fill: parent
        fillMode: Image.TileHorizontally
        smooth: true
    }

    Text {
        id: titleText
        anchors.centerIn: parent
        color: "yellow"
        font.bold: true
        font.pixelSize: parent.height / 3
    }

    Image {
        source: "images/back.svg"
        anchors {
            top: parent.top
            bottom : parent.bottom
            left: parent.left
        }
        height: parent.height
        width: height
        smooth: true
        visible: showBackButton

        sourceSize.height : height
        sourceSize.width : width

        MouseArea {
            anchors.fill: parent
            onClicked: root.backButtonClicked()
        }
    }
}
