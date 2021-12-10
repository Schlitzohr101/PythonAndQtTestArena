import QtQuick 2.7
import QtQuick.Controls 1.1
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15

Component {
    id: testPage
    // Rectangle {

    // }


    Item {
        id: glass
        anchors.fill: parent
        
        clip: true
        //property var imageToGlass: glass

        // Image {
        //     id: testImage
        //     anchors.fill: glass
        //     source: "./images/transparent.png"
        //     fillMode: Image.Stretch
        // }

        FastBlur {
            id: frost
            anchors.fill: parent
            source: image_to_blur
            radius: 60
        }

        Rectangle {
            id: selection_box
            color: "#87cefa"
            border.width: 4
            
            anchors.centerIn: parent
            height: selection_height
            width: selection_width
            radius: 10

            ColumnLayout {
                
                anchors {top: selection_box.top; left: selection_box.left; right: selection_box.right;}
                height: selection_height
                
                // spacing: 20
                Rectangle { //Patient List
                    id: patients_box
                    color: "#4682b4"
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: selection_width - 40
                    height: selection_height - (options_layout.height+100) 
                    Layout.maximumHeight: selection_height - 100
                }
                RowLayout { //Options
                    id: options_layout
                    //anchors.top: patients_box.bottom
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 20
                    Rectangle {
                        Layout.alignment: Qt.AlignVCenter
                        Layout.preferredWidth: selection_width/2.2
                        height: selection_height/6-20
                        // Layout.preferredHeight: selection_height/6-20
                        Layout.maximumHeight: selection_height/6- 10
                        color: "#98fb98"
                    }
                    Rectangle {
                        Layout.alignment: Qt.AlignVCenter
                        Layout.preferredWidth: selection_width/2.2
                        height: selection_height/6 - 20
                        Layout.maximumHeight: selection_height/6-10
                        color: "#98fb98"
                    }
                }
            }
        }

    }
    
//     Rectangle {
//         id: bg
//         anchors.fill: parent
//         color: "cyan"

//         Rectangle{
//             id: firstBox
//             anchors {right: parent.right; top: parent.top; topMargin: spaceBtw*2}
//             height: boxheight - 5
//             width:  boxWidth
//             radius: 5
//             color: "black"
//             border.color: "white"
//             border.width: 2
//             opacity: .75
//             TextInput {
//                 id: firstNameEdit
//                 anchors.fill: parent
//                 anchors {topMargin: 2; leftMargin: 5; rightMargin: 5; bottomMargin: 2}
//                 // font.family:    "Roboto"
//                 font.pixelSize: 25
//                 color: "white"
//                 layer.enabled: true
//                 selectByMouse: true
//                 // KeyNavigation.tab: lastNameEdit
                
//             }
//         }
//         Text {
//             anchors {right: firstBox.left; rightMargin: 10; verticalCenter: firstBox.verticalCenter}
//             text: "FIRST NAME"
//             color: "white"
//             // font.family:    "Exo"
//             font.pixelSize: 22
//         }
//     }

}

    