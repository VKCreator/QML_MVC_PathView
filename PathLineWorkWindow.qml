import QtQuick
import QtQuick.Controls 2.15

Window {
    id: root
    width: 700
    height: 300
    visible: true
    title: qsTr("CoverFlow")
    minimumHeight: 300
    minimumWidth: 700

    // Модель с данными
    ListModel {
        id: modelForPathLineRect

        ListElement {
            file: "qrc:/art.jpg"
        }
        ListElement {
            file: "qrc:/art4.jpg"
        }
        ListElement {
            file: "qrc:/Crasdant,_album_cover.jpg"
        }
        ListElement {
            file: "qrc:/Gwlad_I_Mi_2,_album_cover.jpg"
        }
        ListElement {
            file: "qrc:/Spiral_-_Allison_Crowe_(album_cover).jpg"
        }
        ListElement {
            file: "qrc:/The_Music_Of_Wales,_album_cover.jpg"
        }
        ListElement {
            file: "qrc:/djbobo.jpg"
        }
    }

    // Делегат
    Component {
       id: albumDelegate

            Image {
                 id: iconImage
                 width: 100
                 height: 100
                 antialiasing: true
                 fillMode: Image.PreserveAspectFit
                 opacity: PathView.itemOpacity
                 scale: PathView.scaleItem
                 z: PathView.itemZ
                 source: model.file
                 smooth: true

                 property double itemAngle: PathView.itemRotation
                 transform: Rotation { origin.x: 50; origin.y: 50; axis { x: 0; y: 1; z: 0 } angle: itemAngle }
            }
     }

    // Рамка с надписью
    Rectangle {
        id: pathLineRect
        width: parent.width
        color: "transparent"
        border.color: "cyan"
        height: 300

        Text {
            text: "PathLine"
            anchors.top: parent.top
            anchors.left: parent.left
        }

        // Представление
        PathView {
            id: view
            anchors.fill: parent
            model: modelForPathLineRect
            delegate: albumDelegate
            pathItemCount: 7 // количество видимых элементов
            focus: true

            path:  Path {
                id: myPath

                // S - Стартовая позиция и атрибуты
                startX: 100; startY: pathLineRect.height / 2
                PathAttribute{name: "scaleItem"; value:1}
                PathAttribute{name: "itemZ"; value:0}
                PathAttribute{name: "itemOpacity"; value:0.5}
                PathAttribute{name: "itemRotation"; value:45}

                // M - Середина
                PathLine { x: pathLineRect.width / 2; y: pathLineRect.height / 2 }
                PathAttribute{name: "scaleItem"; value:1.6}
                PathAttribute{name: "itemZ"; value: 100}
                PathAttribute{name: "itemOpacity"; value:1}
                PathAttribute{name: "itemRotation"; value:0}

                // E - Конец
                PathLine { x: pathLineRect.width - 100; y: pathLineRect.height / 2 }
                PathAttribute{name: "itemZ"; value:0}
                PathAttribute{name: "scaleItem"; value:1}
                PathAttribute{name: "itemOpacity"; value:0.5}
                PathAttribute{name: "itemRotation"; value:-45}
            }

            preferredHighlightBegin: 0.5 // текущий элемент установить в центр
            preferredHighlightEnd: 0.5

            Keys.onLeftPressed: decrementCurrentIndex()
            Keys.onRightPressed: incrementCurrentIndex()
        }

//        Rectangle {
//            x: 100 - width / 2
//            y: pathLineRect.height / 2 - height / 2
//            width: 8
//            height: 8

//            color: "red"
//            z: 3
//        }

//        Rectangle {
//            x: pathLineRect.width - 100 - width / 2
//            y: pathLineRect.height / 2 - height / 2
//            width: 8
//            height: 8

//            color: "red"
//            z: 3
//        }

//        Rectangle {
//            x: pathLineRect.width / 2 - width / 2
//            y: pathLineRect.height / 2 - height / 2
//            width: 8
//            height: 8

//            color: "red"
//            z: 3
//        }
    }
}
