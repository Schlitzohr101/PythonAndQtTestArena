import QtQuick 2.7
import QtQuick.Controls 1.1
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15

Component {
    id: patientCreatePage
    Item {
        id: glass
        anchors.fill: parent
        clip: true

        property var form_height: height*.66
        property var form_width: width*.5
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
            ColumnLayout {
                id: patient_input_frame
                anchors.fill: parent
                
                SplitView {
                    id: basic_info_boxes
                    //anchors {top: parent.top; left:parent.left; right: parent.right}
                    Layout.alignment: Qt.AlignHCenter
                    height: form_height*.333
                    orientation: Qt.Horizontal

                    Rectangle {
                        id: id_box
                        color: "red"
                        Layout.minimumWidth: form_width/2
                        
                        Layout.fillWidth: true
                        
                    }
                    Rectangle {
                        id: date_box
                        color: "green"
                        
                        width: form_width/2

                    }
                }
                Rectangle {
                    id: notes_box
                    color: "blue"
                    width: form_width-50
                    height: form_height*.333
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }
}