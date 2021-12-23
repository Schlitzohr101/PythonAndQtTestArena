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
                
                id: picker_frame
                anchors.fill: parent
                // anchors {top: selection_box.top; left: selection_box.left; right: selection_box.right;}
                // height: selection_height
                property real p_box_height: ( selection_height * .66)
                property real opt_box_height: ( selection_height * .12)

                Rectangle { //Patient List
                    

                    id: patients_box
                    color: "#4682b4"
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: selection_width * .66
                    Layout.preferredHeight: picker_frame.p_box_height
                    //Layout.maximumHeight: (selection_height * 2)
                }
                RowLayout { //Options
                    id: options_layout
                    //anchors.top: patients_box.bottom
                    Layout.alignment: Qt.AlignHCenter
                    spacing: 20

                    Item {
                        id: cont_button_layout
                        Layout.preferredHeight: picker_frame.opt_box_height
                        Layout.preferredWidth: selection_width/2.2
                        Layout.alignment: Qt.AlignTop
                        MyButton {
                            id: cont_button
                            property var button_text: "Continue"
                            // property real my_height:  picker_frame.opt_box_height
                            // property real my_width: selection_width/2.2
                            anchors.fill: parent
                            property real font_size: 14
                            property var font_family: "Arial"
                            property var  my_glow: cont_glow_effect
                            property var pri_color: "#98fb98"
                            property var sec_color: "#87cefa"
                            function this_funct() {
                                console.log("butt")
                            }
                            property var action: this_funct
                        }
                        Glow {
                            id: cont_glow_effect
                            anchors.fill: cont_button
                            source: cont_button
                            samples: 25
                            visible: true
                            radius: 5
                            color: "white"
                        }
                    }

                    Item {
                        id: create_button_layout
                        Layout.preferredHeight: picker_frame.opt_box_height
                        Layout.preferredWidth: selection_width/2.2
                        Layout.alignment: Qt.AlignTop
                        MyButton {
                            id: create_button
                            property var button_text: "Create"
                            // property real my_height:  picker_frame.opt_box_height
                            // property real my_width: selection_width/2.2
                            anchors.fill: parent
                            property real font_size: 14
                            property var font_family: "Arial"
                            property var  my_glow: create_glow_effect
                            property var pri_color: "#98fb98"
                            property var sec_color: "#87cefa"
                            function some_funct() {
                                console.log("not butt")
                            }
                            property var action: some_funct
                        }
                        Glow {
                            id: create_glow_effect
                            anchors.fill: create_button
                            source: create_button
                            samples: 25
                            visible: true
                            radius: 5
                            color: "white"
                        }
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

    