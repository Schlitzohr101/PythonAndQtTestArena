import QtQuick 2.7
import QtQuick.Controls 1.1
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15


    // property real my_height;
    // property real my_width;
    // property var pri_color;
    // property var sec_color;
    // property var action;

Rectangle{
    //height: my_height; width: my_width
    id: outer_box
    color: pri_color
    radius: 5

    Text {
        id: box  
        font.family: font_family
        font.pointSize: font_size
        anchors.centerIn: parent
        text: button_text
    }

    MouseArea {
        id: button_area
        width: parent.width
        height: parent.height
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        states:  [
            State {
                name: "mouseHover"
                when: button_area.containsMouse
                PropertyChanges {
                    target: my_glow
                    radius: 7
                }
            }
            ,State {
                name: "mouseClicked"
                when: button_area.pressed
                PropertyChanges {
                    target: my_glow
                    radius: 10
                }
            }
        ]
        onClicked: {
            action();
            my_glow.radius = 15;
        }
    }

}





