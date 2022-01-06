import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
import "./tools"

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
            color: "#171010"
            border.width: 4
            border.color: "white"
            radius: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 100
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
                    // resizing: false

                    Rectangle {
                        id: id_box
                        color: "#448ee4"
                        radius: 5
                        border.width: 2
                        SplitView.preferredWidth: patient_input_frame.width/2 - 20
                        SplitView.minimumWidth: 275

                        TextWithInputBox {
                            id: paitent_id_box
                            property var box_color : "white"
                            property var text_color : "black"
                            property var title_text : "Patient Id"
                            property int max_chars: 28
                            anchors {left: id_box.left; top: id_box.top; right: id_box.right;}
                            height: id_box.height/4
                            width: id_box.width/2
                            property var next_box: first_name_box.my_box.my_input
                            property var isfocused: true

                            function change_focus(first, second) {
                                first.focus = false; 
                                second.focus = true;
                            }

                            property var action: change_focus
                        }

                        TextWithInputBox {
                            id: first_name_box
                            property var box_color : "white"
                            property var text_color : "black"
                            property var title_text : "First Name"
                            property int max_chars: 35
                            anchors {left: id_box.left; top: paitent_id_box.bottom; right: id_box.right;}
                            height: id_box.height/4
                            width: id_box.width/2
                            property var next_box: last_name_box.my_box.my_input
                            property var isfocused: false

                            function change_focus(first, second) {
                                first.focus = false; 
                                second.focus = true;
                            }

                            property var action: change_focus
                        }
                        TextWithInputBox {
                            id: last_name_box
                            property var box_color : "white"
                            property var text_color : "black"
                            property var title_text : "Last Name"
                            property int max_chars: 35
                            anchors {left: id_box.left; top: first_name_box.bottom; right: id_box.right;}
                            height: id_box.height/4
                            width: id_box.width/2
                            property var next_box: paitent_id_box.my_box.my_input
                            property var isfocused: false

                            function change_focus(first, second) {
                                first.focus = false; 
                                second.focus = true;
                            }

                            property var action: change_focus
                        }
                        
                        // Rectangle {
                        //     id: paitent_id_box
                        //     anchors {top: parent.top; right: parent.right}
                        //     anchors.topMargin: 20; anchors.rightMargin: 20
                        //     height: id_box.height/4
                        //     width: id_box.width/2
                        //     border.width: 1
                        //     color: "white"

                        //     TextInput {
                        //         id: paitent_id
                                
                        //         anchors.fill: parent
                                
                        //         anchors.margins: paitent_id_box.height/10
                                
                                
                        //         color: "black"
                        //         wrapMode: TextInput.Wrap
                        //         maximumLength: 50
                        //         font.pointSize: 12
                        //     }
                        // }

                        // Text {
                        //     id: paitent_id_text
                        //     anchors {top: paitent_id_box.top; right: paitent_id_box.left}
                            
                        //     anchors.topMargin: paitent_id_box.height/4.5
                        //     anchors.rightMargin: 10
                            
                        //     text: "Patient Id"
                        //     font.family: "Inconsolata"
                        //     font.pointSize: 14
                        // }

                        

                        
                        //Layout.fillWidth: true
                        
                    }
                    Rectangle {
                        id: date_box
                        color: "green"
                        
                        SplitView.preferredWidth: glass.form_width/2 - 20
                        SplitView.minimumWidth: 275


                        SplitView.fillWidth: true

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
                    width: patient_input_frame.width-25
                    Layout.alignment: Qt.AlignHCenter
                }
                Rectangle {
                    id: notes_box
                    color: "blue"
                    width: patient_input_frame.width-50
                    Layout.preferredHeight: creation_box.item_height
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }

        Item {
            id: back_button_layout
            width: (glass.width - creation_box.width)/4 - 20
            height: width
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            anchors {left: creation_box.right; bottom: creation_box.bottom;}
            MyImgButton {
                id: back_button
                
                anchors.fill: parent
                
                property var my_source: "../images/back.png"
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
                color: "#8b0000"
            }
        }

        Item {
            id: next_button_layout
            width: (glass.width - creation_box.width)/4 - 20
            height: width
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            anchors {left: back_button_layout.right; bottom: creation_box.bottom;}
            MyImgButton {
                id: next_button
                
                anchors.fill: parent
                
                property var my_source: "../images/next.png"
                property var my_glow: next_glow_effect
                // property var my_height: creation_box.height/6
                // property var my_width: height
                function next_patient_select() {
                    console.log("next button pressed")
                }
                property var action: next_patient_select

            }
            Glow {
                id: next_glow_effect
                anchors.fill: next_button
                source: next_button
                samples: 25
                visible: true
                radius: 5
                color: "#8fbc8f"
            }
        }



    }
}