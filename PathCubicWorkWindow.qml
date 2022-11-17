import QtQuick
import QtQuick.Controls 2.15

Window {
    id: root
    width: 700
    height: 300
    visible: true
    title: qsTr("Menu")
    minimumHeight: 300
    minimumWidth: 700

    // Модель с данными
    ListModel {
        id: modelForPathCubicRect

        ListElement {
            file: "qrc:/whatsapp.png"
            name: "Messaging"
        }
        ListElement {
            file: "qrc:/list.png"
            name: "Todo List"
        }
        ListElement {
            file: "qrc:/contacts.png"
            name: "Contacts"
        }
        ListElement {
            file: "qrc:/music-notes.png"
            name: "Music"
        }
        ListElement {
            file: "qrc:/video-camera.png"
            name: "Movies"
        }
        ListElement {
            file: "qrc:/camera.png"
            name: "Camera"
        }
        ListElement {
            file: "qrc:/schedule.png"
            name: "Calendar"
        }

    }

    // Делегат
    Component {
       id: starDelegate

            Column {
                scale: PathView.scaleItem
                opacity: PathView.isCurrentItem ? 1: 0.5

                 Image {
                      id: iconImage
                      width: 50
                      height: 50
                      antialiasing: true
                      fillMode: Image.PreserveAspectFit
                      anchors.horizontalCenter: textIcon.horizontalCenter
                      source: model.file
                      smooth: true
                 }
                 Text {
                     id: textIcon
                     text: model.name
                     font.pixelSize: 13
                 }
             }
     }

    // Рамка с надписью
    Rectangle {
        id: pathCubicRect
        width: parent.width
        color: "transparent"
        border.color: "cyan"
        height: 300

        Text {
            text: "PathCubic"
            anchors.top: parent.top
            anchors.left: parent.left
        }

        // Представление
        PathView {
            id: view
            anchors.fill: parent
            model: modelForPathCubicRect
            delegate: starDelegate
            pathItemCount: 7
            focus: true

            path:  Path {
                id: myPath

                // S - начальная точка (первая)
                startX: 100
                startY: pathCubicRect.height / 2 - 100
                PathAttribute{name: "itemOpacity"; value:0.5}

                // Кубическая кривая Безье
                PathCubic {
                    x: pathCubicRect.width - 100; y: pathCubicRect.height / 2 - 100 // E - конечная точка (четвёртая)
                    control1X: pathCubicRect.width / 2 - 100 // L - вторая контрольная точка
                    control1Y: pathCubicRect.height / 2 + 100
                    control2X: pathCubicRect.width / 2 + 100 // R - третья контрольная точка
                    control2Y: pathCubicRect.height / 2 + 100
                }
            }

            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5

            Keys.onLeftPressed: decrementCurrentIndex()
            Keys.onRightPressed: incrementCurrentIndex()
       }
    }
}
