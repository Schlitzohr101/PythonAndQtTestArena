import QtQuick 2.7
import QtQuick.Controls 1.1
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15

Component {
    id: patientCreatePage
    //property var reSizeUpdate: glass.resize_update
    Item {
        id: glass
        anchors.fill: parent
        clip: true
        function resize_update() {
            form_height = glass.height * .92;
            form_width = glass.width * .67;
        }
        property var form_height: glass.height*.92
        property var form_width: glass.width*.67
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
            id: creation_box
            color: "#87cefa"
            border.width: 4
            radius: 10
            anchors.centerIn: parent
            height: form_height
            width: form_width


            property int item_cnt: 4
            property int item_space: 3
            property var item_height: creation_box.height/(item_cnt) - (item_space*(item_cnt-1))

            ColumnLayout {
                id: patient_input_frame
                anchors.fill: parent
                
                anchors.margins: 5
                
                spacing: creation_box.item_space
                SplitView {
                    id: basic_info_boxes

                    //anchors {top: parent.top; left:parent.left; right: parent.right}
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredHeight: creation_box.item_height
                    width: patient_input_frame.width - 25
                    orientation: Qt.Horizontal

                    Rectangle {
                        id: id_box
                        color: "red"
                        Layout.minimumWidth: patient_input_frame.width/2
                        
                        Layout.fillWidth: true
                        
                    }
                    Rectangle {
                        id: date_box
                        color: "green"
                        
                        width: patient_input_frame.width/2

                    }
                }
                Rectangle {
                    id: insurance_box
                    color: "tan"
                    width: patient_input_frame.width-25
                    Layout.preferredHeight: creation_box.item_height
                    Layout.alignment: Qt.AlignHCenter
                }
                Rectangle {
                    id: additional_info
                    color: "yellow"
                    Layout.preferredHeight: creation_box.item_height
                    width: (form_width-25)
                    Layout.alignment: Qt.AlignHCenter
                }
                Rectangle {
                    id: notes_box
                    color: "blue"
                    width: form_width-50
                    Layout.preferredHeight: creation_box.item_height
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }

        Item {
            id: back_button_layout
            height: creation_box.height/6
            width: height
            anchors.rightMargin: 20
            anchors.topMargin: 20
            anchors {right: creation_box.left; top: creation_box.top;}
            MyImgButton {
                id: back_button
                
                anchors.fill: parent
                
                property var my_source: "./images/back.png"
                property var my_glow: back_glow_effect
                // property var my_height: creation_box.height/6
                // property var my_width: height
                function back_patient_select() {
                    stack_view.pop();
                }
                property var action: back_patient_select
            }
            Glow {
                id: back_glow_effect
                anchors.fill: back_button
                source: back_button
                samples: 25
                visible: true
                radius: 5
                color: "white"
            }
        }



    }
}