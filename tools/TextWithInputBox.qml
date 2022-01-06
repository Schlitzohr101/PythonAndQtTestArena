import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: frame
    // property Item next_box;
    property alias my_box: box
    Rectangle {
        id: box
        anchors {top: parent.top; right: parent.right}
        anchors.topMargin: 20; anchors.rightMargin: 20
        height: frame.height
        width: frame.width/2
        border.width: 2
        border.color: input.focus ? "green" : "black"
        color:  box_color

        property alias my_input: input

        TextInput {
            id: input
            
            anchors.fill: parent
            
            anchors.margins: box.height/10
            
            
            color: text_color
            wrapMode: TextInput.Wrap
            maximumLength: max_chars
            font.pointSize: 12
            font.family: "Helvetica"
            KeyNavigation.tab: next_box
            focus: isfocused
            onAccepted: {
                console.log("running accepted")
                action(frame.my_box.my_input, next_box);
                console.log("accepted on "+title_text+" box completed")
            }
        }
    }

    Text {
        id: box_title
        anchors {top: box.top; right:box.left}
        
        anchors.topMargin: box.height/4.5
        anchors.rightMargin: 10
        
        text: title_text
        font.family: "Inconsolata"
        font.pointSize: 14
    }
}

