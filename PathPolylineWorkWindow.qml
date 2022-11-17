import QtQuick
import QtQuick.Controls 2.15
import QtQuick3D.Helpers

Window {
    id: root
    width: 700
    height: 300
    visible: true
    title: qsTr("Balls")
    minimumHeight: 300
    minimumWidth: 700

    // Делегат
    Component {
       id: delegate

            Rectangle {
                 id: iconImage
                 width: 20
                 height: 20
                 radius: width / 2
                 color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
            }
     }

    // Рамка с надписью
    Rectangle {
        id: pathPolylineRect
        width: parent.width
        color: "transparent"
        border.color: "cyan"
        height: 300

        Text {
            text: "PathPolyline"
            anchors.top: parent.top
            anchors.left: parent.left
        }

        // Представление
        PathView {
            id: view
            anchors.fill: parent
            model: 15
            delegate: delegate
            pathItemCount: 10
            focus: true

            path:  Path {
                id: myPath

                // Полилиния
                PathPolyline {
                    path: [ Qt.point(pathPolylineRect.width/2, 50.0), // T
                            Qt.point(pathPolylineRect.width/2 + 100, 125.0), // R
                            Qt.point(pathPolylineRect.width/2 + 50, 250.0), // B2
                            Qt.point(pathPolylineRect.width/2 - 50, 250.0), // B1
                            Qt.point(pathPolylineRect.width/2 - 100, 125.0), // L
                            Qt.point(pathPolylineRect.width/2, 50.0) // T
                          ]
                }
            }

//            preferredHighlightBegin: 0.5
//            preferredHighlightEnd: 0.5

            Keys.onLeftPressed: decrementCurrentIndex()
            Keys.onRightPressed: incrementCurrentIndex()
       }
    }
}
