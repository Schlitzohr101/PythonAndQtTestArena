import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 1.1

Component {
    id: patient_delegate
    Item {
        id: patient_wrapper
        height: (picker_frame.p_box_height / 6 )
        width: parent.width - 10
        focus: true
        Rectangle {
            id: patient_box
            anchors.fill: parent
            
            anchors.margins: 6
            anchors.rightMargin: 16
            
            
            color: "#8cbed6"
            radius: 10
            Text {
                id: patient_info
                anchors.centerIn: parent
                font.pointSize: 10
                text: name + ", " + age
            }
        }
        MouseArea {
            anchors.fill: parent
            id: patient_box_mouse
            onClicked: {
                patient_wrapper.ListView.view.currentIndex = index;
                //console.log(index + " has been clicked");
            }
        }
        states: [ 
            State {
                name: "currentPatient"
                when: patient_wrapper.ListView.isCurrentItem
                PropertyChanges {
                    target: patient_wrapper; x: 5
                }
            }    
        ]
        transitions: [
            Transition {
                NumberAnimation {
                    properties: "x"; duration: 200
                }
            }
        ]
    }
    
}