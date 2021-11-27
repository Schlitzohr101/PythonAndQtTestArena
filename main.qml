import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    minimumWidth: 1280
    minimumHeight: 720
    title: "Cum Generator"
    
    property string someText: "demo"
    property QtObject textInputInterface
    Connections {
        target: textInputInterface

        function onSignalNewText(msg) {
            someText = msg
        }
    }

    
    Rectangle {
        width: parent.width
        height: parent.height - 100
        color: "cyan"
        
        anchors.fill: parent
        
        TextInput {
            height: 50
            width: 100
            anchors.centerIn: parent
            onAccepted: someText = text
        }
    }
    

    Text {
        
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        
        
        text: someText
        font.pixelSize: 26
    }
}