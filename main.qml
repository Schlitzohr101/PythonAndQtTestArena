import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

// import "Theme.qml" as Theme

ApplicationWindow {
    visible: true
    minimumWidth: 1280
    minimumHeight: 720
    title: "Demo MainWindow"
    flags: Qt.FramelessWindowHint
    id: mainwin
    color: "#448ee4"

    property int spaceBtw : mainwin.height/40
    property int boxheight :40
    property int boxWidth : 120

    property int previousX
    property int previousY
    
    property string someText: "demo"
    property QtObject textInputInterface
    Connections {
        target: textInputInterface

        function onSignalNewText(msg) {
            someText = msg
        }
    }

    MouseArea {
        id: windowMouseArea
        anchors{left:   parent.left; right:   parent.right; top: topArea.bottom; bottom: bg.top}
        property variant clickPos: "1,1"
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 1
        onPressed: {
            clickPos = Qt.point(mouse.x, mouse.y)
        }
        onPositionChanged: {
            var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)
            mainwin.x += delta.x
            mainwin.y += delta.y
        }
    }

    MouseArea {
        id: topArea
        height: 5
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        // We set the shape of the cursor so that it is clear that this resizing
        cursorShape: Qt.SizeVerCursor
 
        onPressed: {
            // We memorize the position along the Y axis
            previousY = mouseY
        }
 
        // When changing a position, we recalculate the position of the window, and its height
        onMouseYChanged: {
            var dy = mouseY - previousY
            mainwin.setY(mainwin.y + dy)
            mainwin.setHeight(mainwin.height - dy)
        }
    }

    MouseArea {
        id: bottomArea
        height: 5
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        cursorShape: Qt.SizeVerCursor
 
        onPressed: {
            previousY = mouseY
        }
 
        onMouseYChanged: {
            var dy = mouseY - previousY
            mainwin.setHeight(mainwin.height + dy)
        }
    }
 
    MouseArea {
        id: leftArea
        width: 5
        anchors {
            top: topArea.bottom
            bottom: bottomArea.top
            left: parent.left
        }
        cursorShape: Qt.SizeHorCursor
 
        onPressed: {
            previousX = mouseX
        }
 
        onMouseXChanged: {
            var dx = mouseX - previousX
            mainwin.setX(mainwin.x + dx)
            mainwin.setWidth(mainwin.width - dx)
        }
    }
 
    MouseArea {
        id: rightArea
        width: 5
        anchors {
            top: topArea.bottom
            bottom: bottomArea.top
            right: parent.right
        }
        cursorShape:  Qt.SizeHorCursor
 
        onPressed: {
            previousX = mouseX
        }
 
        onMouseXChanged: {
            var dx = mouseX - previousX
            mainwin.setWidth(mainwin.width + dx)
        }
    }


    AnimatedImage {
        id: closeBtn
        property int count : 15
        property bool isPlaying : false
        x: mainwin.width - 18
        y: 2
        width: 16
        height: 16
        source: "./images/animated/ic_close_press.gif"
        playing: isPlaying
        speed: 0.75
        // Text{
        //     anchors.fill: parent
        //     text: closeBtn.currentFrame
        // }
        MouseArea {
            id: closeMouseArea
            x: 0
            y: 0
            width: parent.width
            height: parent.height
            hoverEnabled: true
            states:  State {
                name: "mouseHover"
                when: closeMouseArea.containsMouse
                PropertyChanges {
                    target: closeBtn
                    isPlaying: true
                }
            }
            onClicked: {
                mainwin.close()
            }
        }
    }
    AnimatedImage {
        id: minimizeBtn
        x: closeBtn.x - 17
        y: 2
        width: 16
        height: 16
        source: "./images/animated/ic_zoom out_press.gif"
        playing: false
        speed: 0.75

        MouseArea {
            id: minMouseArea
            hoverEnabled: true
            width: parent.width
            height: parent.height
            onClicked: {
                mainwin.showMinimized()
            }
            states: State {
                name: "mouseHover"
                when: minMouseArea.containsMouse
                PropertyChanges {
                    target: minimizeBtn
                    playing: true
                }
            }
        }
    }

    Image {
        id: bg
        source: "./images/fox.jpg"
        fillMode: Image.Stretch
        anchors { fill: parent; topMargin: 20}
        
    }

    StackView {
        id: baseStackView
        initialItem: testPage
        anchors { fill: bg}

        TestPage {
            id: testPage
            property int num: 0
            property var stack_view: baseStackView
            property var image_to_blur: bg
            property int selection_height: mainwin.height/ 1.45
            property int selection_width: mainwin.width/ 2.2
        }

        PatientCreatePage {
            id: create_paitent
            property int num: 1
            property var image_to_blur: bg
        }

        // Component.onCompleted: {
        //     baseStackView.push(create_paitent);
        //     baseStackView.push(baseStackView.get(0));
        // }

        // LoginView {
        //     id: loginView
        //         property var loginStatusMessage: ""
        //         property var loginStatusColor:   ""
        //         property var loginStatusVisible: false
        // }

        // AdminWin {
        //     id: adminWin
        // }

    }



    
    // Rectangle {
    //     width: parent.width
    //     height: parent.height - 100
    //     color: "cyan"
        
    //     anchors.fill: parent
        
    //     TextInput {
    //         height: 50
    //         width: 100
    //         anchors.centerIn: parent
    //         onAccepted: someText = text
    //     }
    // }
    

    // Text {
        
    //     anchors.horizontalCenter: parent.horizontalCenter
    //     anchors.bottom: parent.bottom
        
        
    //     text: someText
    //     font.pixelSize: 26
    // }

    NumberAnimation on x { duration: 1000 }
    NumberAnimation on y { duration: 1000 }
}