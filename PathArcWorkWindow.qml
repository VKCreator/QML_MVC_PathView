import QtQuick
import QtQuick.Controls 2.15

Window {
    id: root
    width: 700
    height: 300
    visible: true
    title: qsTr("Bee")
    minimumHeight: 300
    minimumWidth: 700


    // Делегат
    Component {
       id: beeDelegate

            Image {
                 id: iconImage
                 width: 50
                 height: 50
                 antialiasing: true
                 fillMode: Image.PreserveAspectFit
                 source: "qrc:/bee.png"
                 smooth: true
                 property double angleItem: PathView.itemAngle
                 transform: Rotation { origin.x: 25; origin.y: 25; axis { x: 0; y: 0; z: 1 } angle: angleItem }
            }
     }

    // Рамка с надписью
    Rectangle {
        id: pathQuadRect
        width: parent.width
        color: "transparent"
        border.color: "cyan"
        height: 300

        Text {
            text: "PathArc"
            anchors.top: parent.top
            anchors.left: parent.left
        }

        // Представление
        PathView {
            id: view
            anchors.fill: parent
            model: 15
            delegate: beeDelegate
            pathItemCount: 7
            focus: true

            path:  Path {
                id: myPath

                // S - стартовая позиция
                startX: 200; startY: 25
                PathAttribute{name: "itemAngle"; value:135}

                PathArc {
                    x:200; y: 225 // B - конечная точка первой дуги
                    radiusX: 100; radiusY: 100
                    useLargeArc: true
                }
                PathAttribute{name: "itemAngle"; value:250}

                PathArc {
                    x:200; y: 25 // S - конечная точка второй дуги
                    radiusX: 100; radiusY: 100
                    useLargeArc: true
                }
                PathAttribute{name: "itemAngle"; value:450}
            }

            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5

            Keys.onLeftPressed: decrementCurrentIndex()
            Keys.onRightPressed: incrementCurrentIndex()
       }
    }
}
