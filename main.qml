import QtQuick
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

Window {
    width: 1000
    height: 1000
    visible: true
    title: qsTr("Hello World")
    minimumHeight: 500
    minimumWidth: 500


//    Canvas {
//        width: 700; height: 700
//        contextType: "2d"

//        Path {
//            id: myPath5

//                                startX: 150; startY: 250



//                                PathCurve { x: 50; y: 150 }

//                                PathCurve { x: 150; y: 50 }

//                                PathCurve { x: 250; y: 150 }

//                                PathCurve { x: 150; y: 250 }


//        }

//        onPaint: {
//            context.strokeStyle = Qt.rgba(0,0,255);
//            context.path = myPath5;
//            context.stroke();
//        }


//    }

//            Rectangle {
//                x: 150 - width / 2
//                y: 50 - height / 2
//                width: 8
//                height: 8

//                color: "red"
//                z: 3
//            }

//            Rectangle {
//                x: 150 - width / 2
//                y: 250 - height / 2
//                width: 8
//                height: 8

//                color: "red"
//                z: 3
//            }

//            Rectangle {
//                x: 50 - width / 2
//                y: 150 - height / 2
//                width: 8
//                height: 8

//                color: "red"
//                z: 3
//            }

//            Rectangle {
//                x: 250 - width / 2
//                y: 150 - height / 2
//                width: 8
//                height: 8

//                color: "red"
//                z: 3
//            }

    ListModel {
        id: modelForPathCurveRect

        ListElement {
            file: "qrc:/add.png"
            name: "Create"
        }
        ListElement {
            file: "qrc:/close.png"
            name: "Delete"
        }
        ListElement {
            file: "qrc:/exchange.png"
            name: "Change"
        }
        ListElement {
            file: "qrc:/check-mark.png"
            name: "Check"
        }
    }

    Component {
          id: appHighlight
          Rectangle { width: 80; height: 80; color: "lightsteelblue" }
    }

    Component {
       id: nameDelegate
        Column
        {

            opacity: PathView.itemOpacity
            scale: PathView.scaleItem
            z:  PathView.itemZ
            property double name2: PathView.itemRotation
            property bool name3: PathView.view.moving



            Image {
                 id: album
                 width: 50
                 height: 50
                 antialiasing: true
                 fillMode: Image.PreserveAspectFit
                 anchors.horizontalCenter: delegateText.horizontalCenter

                 source: model.file

                 smooth: true


                 transform: Rotation { origin.x: 50; origin.y: 50; axis { x: 0; y: 1; z: 0 } angle: name2 }

             }

            Text {

                id: delegateText
                text: model.name
                font.pixelSize: 15
            }

        }
     }



    Rectangle {
        id: pathCurveRect
        width: 300
        height: 300
        color: "transparent"
        border.color: "orange"
        //opacity: 0.3
        Text {
            text: "PathCurve"
            anchors.top: parent.top
            anchors.left: parent.left
        }

        Rectangle {
            x: 150 - width / 2
            y: 50 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }

        Rectangle {
            x: 150 - width / 2
            y: 250 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }

        Rectangle {
            x: 50 - width / 2
            y: 150 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }

        Rectangle {
            x: 250 - width / 2
            y: 150 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }

        PathView {
            id: view
            anchors.fill: parent
            model: modelForPathCurveRect


            path:     Path {
                id: myPath


                    startX: 150; startY: 250
                    PathAttribute{name: "opacityItem"; value: 1}
                    PathAttribute{name: "scaleItem"; value: 1.1}

                    PathCurve { x: 50; y: 150 }
                    PathAttribute{name: "opacityItem"; value: 0.3}
                    PathAttribute{name: "scaleItem"; value: 0.8}

                    PathCurve { x: 150; y: 50 }
                    PathAttribute{name: "opacityItem"; value: 0.3}
                    PathAttribute{name: "scaleItem"; value: 0.8}

                    PathCurve { x: 250; y: 150 }
                    PathAttribute{name: "opacityItem"; value: 0.3}
                    PathAttribute{name: "scaleItem"; value: 0.8}

                    PathCurve { x: 150; y: 250 }
                    PathAttribute{name: "opacityItem"; value: 1}
                    PathAttribute{name: "scaleItem"; value: 1.1}


            }

            delegate: nameDelegate
            highlight: appHighlight
        }
    }

    Rectangle {
        id: pathLineRect
        anchors.left: pathCurveRect.right
        anchors.leftMargin: 1
        anchors.right: parent.right
        color: "transparent"
        border.color: "cyan"
        height: 300

        Text {
            text: "PathLine"
            anchors.top: parent.top
            anchors.left: parent.left
        }


        PathView {
            id: view2
            anchors.fill: parent
            model: 15
            pathItemCount: 7
            focus: true

            path:  Path {
                id: myPath2

                startX: 100
                startY: pathLineRect.height / 2
                PathAttribute{name: "scaleItem"; value:1}
                PathAttribute{name: "itemZ"; value:0}
                PathAttribute{name: "itemOpacity"; value:0.5}
                PathAttribute{name: "itemRotation"; value:45}


                PathLine {
                     x: pathLineRect.width / 2
                     y: pathLineRect.height / 2
                }
                PathAttribute{name: "scaleItem"; value:1.6}
                PathAttribute{name: "itemZ"; value: 100}
                PathAttribute{name: "itemOpacity"; value:1}
                PathAttribute{name: "itemRotation"; value:0}


                PathLine { x: pathLineRect.width - 100; y: pathLineRect.height / 2 }
                PathAttribute{name: "itemZ"; value:0}
                PathAttribute{name: "scaleItem"; value:1}
                PathAttribute{name: "itemOpacity"; value:0.5}
                PathAttribute{name: "itemRotation"; value:-45}


            }
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5


            delegate:


                Image {
                id: album
                width: 100
                height: 100
                antialiasing: true
                fillMode: Image.PreserveAspectFit
                //sourceSize: Qt.size(width, height)
                property double name2: PathView.itemRotation
                //fillMode: Image.PreserveAspectFit
                source: "qrc:/djbobo.jpg"
//                color: "orchid
                opacity: PathView.itemOpacity
                scale: PathView.scaleItem
                smooth: PathView.view.moving
                //opacity: PathView.isCurrentItem ? myHighlight() : 0.5
                //source: "qrc:/add.png"

                z:  PathView.itemZ
                transform: Rotation { origin.x: 50; origin.y: 50; axis { x: 0; y: 1; z: 0 } angle: name2 }




//                transform: Rotation {
//                    axis { x: 0; y: 1; z: 0 }
//                    angle: PathView.rotation
//                    origin.x: 32
//                }
               // rotation: PathView.rotation
//                border {
//                    color: "black"
//                    width: 1
//                }

//                Text{
//                    text: index
//                    anchors.centerIn: parent
//                }

            }


            Keys.onLeftPressed: decrementCurrentIndex()
           // Keys.onRightPressed: incrementCurrentIndex()

        }

        Rectangle {
            x: 100 - width / 2
            y: pathLineRect.height / 2 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }

        Rectangle {
            x: pathLineRect.width - 100 - width / 2
            y: pathLineRect.height / 2 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }

        Rectangle {
            x: pathLineRect.width / 2 - width / 2
            y: pathLineRect.height / 2 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }
    }

    Rectangle {
        id: pathQuadRect
        anchors.top: pathCurveRect.bottom
        anchors.topMargin: 1
        anchors.right: parent.right
        anchors.left: parent.left
        color: "transparent"
        border.color: "green"
        height: 300


        Text {
            text: "PathQuad"
            anchors.top: parent.top
            anchors.left: parent.left
        }


        PathView {
            id: view3
            anchors.fill: parent
            model: 15
            pathItemCount: 7
            focus: true

            path:  Path {
                id: myPath3

                startX: 100
                startY: pathQuadRect.height / 2 - 100
                PathAttribute{name: "scaleItem"; value:1}
                PathAttribute{name: "itemZ"; value:0}
                PathAttribute{name: "itemOpacity"; value:1}
                PathAttribute{name: "itemRotation"; value:0}

                PathQuad {
                    x: pathQuadRect.width - 100; y: pathQuadRect.height / 2 - 100
                    controlX: pathQuadRect.width / 2
                    controlY: pathQuadRect.height / 2 + 100
                }
                PathAttribute{name: "scaleItem"; value:1.6}
                PathAttribute{name: "itemZ"; value: 100}
                PathAttribute{name: "itemOpacity"; value:1}
                PathAttribute{name: "itemRotation"; value:0}

            }
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5


            delegate:


                Image {
                id: album2
                width: 50
                height: 50
                antialiasing: true
                fillMode: Image.PreserveAspectFit
                //sourceSize: Qt.size(width, height)
                property double name2: PathView.itemRotation
                //fillMode: Image.PreserveAspectFit
                source: "qrc:/djbobo.jpg"
//                color: "orchid
                opacity: PathView.itemOpacity
                scale: PathView.scaleItem
                smooth: PathView.view.moving
                //opacity: PathView.isCurrentItem ? myHighlight() : 0.5
                //source: "qrc:/add.png"

                z:  PathView.itemZ
                transform: Rotation { origin.x: 50; origin.y: 50; axis { x: 0; y: 1; z: 0 } angle: name2 }




//                transform: Rotation {
//                    axis { x: 0; y: 1; z: 0 }
//                    angle: PathView.rotation
//                    origin.x: 32
//                }
               // rotation: PathView.rotation
//                border {
//                    color: "black"
//                    width: 1
//                }

//                Text{
//                    text: index
//                    anchors.centerIn: parent
//                }

            }


            Keys.onLeftPressed: decrementCurrentIndex()
           // Keys.onRightPressed: incrementCurrentIndex()

        }


        Rectangle {
            x: 100 - width / 2
            y: pathQuadRect.height / 2 - 100 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }

        Rectangle {
            x: pathQuadRect.width - 100 - width / 2
            y: pathQuadRect.height / 2 - 100 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }

        Rectangle {
            x: pathQuadRect.width / 2 - width / 2
            y: pathQuadRect.height / 2 + 100 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }

    }


    Rectangle {
        id: pathCubicRect
        anchors.top: pathQuadRect.bottom
        anchors.topMargin: 1
        anchors.right: parent.right
        anchors.left: parent.left
        color: "transparent"
        border.color: "red"
        height: 300


        Text {
            text: "PathCubic"
            anchors.top: parent.top
            anchors.left: parent.left
        }


        PathView {
            id: view4
            anchors.fill: parent
            model: 15
            pathItemCount: 7
            focus: true

            path:  Path {
                id: myPath4

                startX: 100
                startY: pathCubicRect.height / 2 - 100
                PathAttribute{name: "scaleItem"; value:1}
                PathAttribute{name: "itemZ"; value:0}
                PathAttribute{name: "itemOpacity"; value:1}
                PathAttribute{name: "itemRotation"; value:0}

                PathCubic {
                    x: pathCubicRect.width - 100; y: pathCubicRect.height / 2 - 100
                    control1X: pathCubicRect.width / 2 - 100
                    control1Y: pathCubicRect.height / 2 + 100
                    control2X: pathCubicRect.width / 2 + 100
                    control2Y: pathCubicRect.height / 2 + 100
                }
                PathAttribute{name: "scaleItem"; value:1.6}
                PathAttribute{name: "itemZ"; value: 100}
                PathAttribute{name: "itemOpacity"; value:1}
                PathAttribute{name: "itemRotation"; value:0}

            }
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5


            delegate:


                Image {
                id: album4
                width: 50
                height: 50
                antialiasing: true
                fillMode: Image.PreserveAspectFit
                //sourceSize: Qt.size(width, height)
                property double name2: PathView.itemRotation
                //fillMode: Image.PreserveAspectFit
                source: "qrc:/djbobo.jpg"
//                color: "orchid
                opacity: PathView.itemOpacity
                scale: PathView.scaleItem
                smooth: PathView.view.moving
                //opacity: PathView.isCurrentItem ? myHighlight() : 0.5
                //source: "qrc:/add.png"

                z:  PathView.itemZ
                transform: Rotation { origin.x: 50; origin.y: 50; axis { x: 0; y: 1; z: 0 } angle: name2 }




//                transform: Rotation {
//                    axis { x: 0; y: 1; z: 0 }
//                    angle: PathView.rotation
//                    origin.x: 32
//                }
               // rotation: PathView.rotation
//                border {
//                    color: "black"
//                    width: 1
//                }

//                Text{
//                    text: index
//                    anchors.centerIn: parent
//                }

            }


            Keys.onLeftPressed: decrementCurrentIndex()
           // Keys.onRightPressed: incrementCurrentIndex()

        }


        Rectangle {
            x: 100 - width / 2
            y: pathCubicRect.height / 2 - 100 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }

        Rectangle {
            x: pathCubicRect.width - 100 - width / 2
            y: pathCubicRect.height / 2 - 100 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }

        Rectangle {
            x: pathCubicRect.width / 2 - 100- width / 2
            y: pathCubicRect.height / 2 + 100 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }

        Rectangle {
            x: pathCubicRect.width / 2 + 100 - width / 2
            y: pathCubicRect.height / 2 + 100 - height / 2
            width: 8
            height: 8

            color: "red"
            z: 3
        }

    }
}
