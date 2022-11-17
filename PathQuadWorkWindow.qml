import QtQuick
import QtQuick.Controls 2.15

Window {
    id: root
    width: 700
    height: 300
    visible: true
    title: qsTr("Stars")
    minimumHeight: 300
    minimumWidth: 700

    // Делегат
    Component {
       id: starDelegate

            Image {
                 id: iconImage
                 width: 50
                 height: 50
                 antialiasing: true
                 fillMode: Image.PreserveAspectFit
                 opacity: PathView.itemOpacity
                 scale: PathView.scaleItem
                 z: PathView.itemZ
                 source: "qrc:/free-icon-star-1828884.png"
                 smooth: true

                 property double itemAngle: PathView.itemRotation
                 transform: Rotation { origin.x: 50; origin.y: 50; axis { x: 0; y: 1; z: 0 } angle: itemAngle }
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
            text: "PathQuad"
            anchors.top: parent.top
            anchors.left: parent.left
        }

        // Представление
        PathView {
            id: view
            anchors.fill: parent
            model: 15
            delegate: starDelegate
            pathItemCount: 7
            focus: true

            path:  Path {
                id: myPath

                // S - стартовая позиция
                startX: 100; startY: pathQuadRect.height / 2 - 100
                PathAttribute{name: "scaleItem"; value:0.6}
                PathAttribute{name: "itemZ"; value:0}
                PathAttribute{name: "itemOpacity"; value:1}
                PathAttribute{name: "itemRotation"; value:0}

                // Квадратичная кривая Безье
                PathQuad {
                    x: pathQuadRect.width - 100; y: pathQuadRect.height / 2 - 100 // E - конец
                    controlX: pathQuadRect.width / 2 // Точка M
                    controlY: pathQuadRect.height / 2 + 100
                }
                PathAttribute{name: "scaleItem"; value:1.6}
                PathAttribute{name: "itemZ"; value: 100}
                PathAttribute{name: "itemOpacity"; value:1}
                PathAttribute{name: "itemRotation"; value:0}
            }

            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5

            Keys.onLeftPressed: decrementCurrentIndex()
            Keys.onRightPressed: incrementCurrentIndex()
       }


        }

//        Rectangle {
//            x: 100 - width / 2
//            y: pathQuadRect.height / 2 - 100 - height / 2
//            width: 8
//            height: 8

//            color: "red"
//            z: 3
//        }

//        Rectangle {
//            x: pathQuadRect.width - 100 - width / 2
//            y: pathQuadRect.height / 2 - 100 - height / 2
//            width: 8
//            height: 8

//            color: "red"
//            z: 3
//        }

//        Rectangle {
//            x: pathQuadRect.width / 2 - width / 2
//            y: pathQuadRect.height / 2 + 100 - height / 2
//            width: 8
//            height: 8

//            color: "red"
//            z: 3
//        }

//            Canvas {
//                width: parent.width; height: 700
//                contextType: "2d"

//                Path {
//                    id: myPath5

//                   startX: 100; startY: pathQuadRect.height / 2 - 100

//                   PathQuad {
//                       x: pathQuadRect.width - 100; y: pathQuadRect.height / 2 - 100
//                       controlX: pathQuadRect.width / 2
//                       controlY: pathQuadRect.height / 2 + 100
//                   }

//                }

//                onPaint: {
//                    context.strokeStyle = Qt.rgba(0,0,255);
//                    context.path = myPath5;
//                    context.stroke();
//                }


//            }



}
