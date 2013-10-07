import QtQuick 2.0
Rectangle {

    property alias storyTitle: titleText.text
    property alias storyContent: contentText.text
    property alias storyIcon: imagePlace.source
    property alias storyDate: dateText.text
    property alias storyAuthor: authorText.text
    property alias storyAuthorImage: authorImage.source
    property alias tagsModel: tagsView.model
    property alias storyScore: score.text
    property alias storyCommentsCount: commentsCount.text
    property alias commentsModel: commentsView.model

    Rectangle { //background
        anchors.fill: parent
        color: "#888691"
        MouseArea {
            anchors.fill: parent
        }
    }

    Rectangle {
        id: datePlace
        color: "#607890"//
        width: parent.width
        height: parent.height / 25
        y : - (height /3)

        radius: 5
        Text {
            id: dateText
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 2
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
            width: parent.width / 3
            asynchronous: true
            fillMode: Image.PreserveAspectFit
        }

        Column {
            height: parent.height
            width: parent.width / 5
            Row {
                height: parent.height / 2
                width: parent.width
                //                Rectangle {
                //                    anchors.fill: parent
                //                    color: "green"
                //                }

                Image {
                    //                    id: star
                    source: "images/star.svg"
                    width: parent.width / 2
                    height: parent.height // 6
                    sourceSize.height: height
                    sourceSize.width: width
                }

                Item {
                    width: parent.width / 2
                    height: parent.height // 6
                    Text {
                        id: score
                        //                        text: model.total_point
                        anchors.centerIn: parent
                        font.bold: true
                    }
                }
            }

            Row {
                height: parent.height / 2
                width: parent.width
                Image {
                    source: "images/comment.svg"
                    width: parent.width / 2
                    height: parent.height // 6
                    sourceSize.height: height
                    sourceSize.width: width
                }

                Item {
                    width: parent.width / 2
                    height: parent.height // 6
                    Text {
                        id: commentsCount
                        anchors.centerIn: parent
                        font.bold: true
                    }
                }
            }
        }

        Column {
            height: parent.height
            width: parent.width / 2

            Row {
                height: ( parent.height / 3 ) * 2
                width: parent.width
                Rectangle {
                    id: authorPlace
                    height: parent.height
                    width: ( parent.width / 3) * 2
                    color: "transparent"
                    Text {
                        id: authorText
                        anchors.centerIn: parent
                    }
                }
                Image {
                    id: authorImage
                    height: parent.height
                    width: parent.width / 3
                }
            }

            Rectangle {
                id : tags
                height: parent.height / 3
                width: parent.width
                color: "#d3d0ba"
                radius: 15
                GridView {
                    id: tagsView
                    clip: true
                    flow: GridView.TopToBottom
                    anchors.fill: parent
                    delegate: Item { width: tags.width; height: tags.height;
                        Text {
                            anchors.centerIn: parent
                            text: tag.name
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: storyTitle
        color: "#2A2700"
        width: parent.width
        height: parent.height / 10
        anchors.top: detailRow.bottom
        radius: 5
        Rectangle { width: parent.width; height: 20; color: "#2A2700"; anchors.bottom: parent.bottom }
        Text {
            id: titleText
            anchors.fill: parent
            wrapMode: Text.WordWrap
            font.pixelSize: text.length > 50? parent.width / 19 : parent.width / 16
            font.bold: true
            color: "#F2F0DF"
        }
    }

    Flickable {
        flickableDirection: Flickable.VerticalFlick
        contentWidth: width
        contentHeight: contentText.paintedHeight
        clip: true
        anchors {
            top: storyTitle.bottom
            bottom: comments.top
            left: parent.left
            right: parent.right
        }
        Rectangle {anchors.fill: parent; color: "#888691"}


        Text {
            id: contentText
            anchors.fill: parent
            wrapMode: Text.WordWrap
            font.pixelSize: 15
            textFormat: Text.RichText
        }
    }

    Rectangle {
        id: comments
        visible: storyCommentsCount >0 ? true: false
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: storyCommentsCount >0 ? parent.height / 5 : 0
        color: "#968888"
        radius: 20
        GridView {
            clip: true
            id: commentsView
            flow: GridView.TopToBottom
            snapMode: GridView.SnapOneRow
            cellHeight: height
            cellWidth: width
            anchors.fill: parent
            delegate: Item {
                width: commentsView.cellWidth - 15  ; height: commentsView.cellHeight;
                Text {
                    anchors.fill: parent
                    font.pixelSize: 10
                    text : comment.content
                    wrapMode: Text.WordWrap
                    textFormat: Text.RichText
                }
            }
        }
    }
}
