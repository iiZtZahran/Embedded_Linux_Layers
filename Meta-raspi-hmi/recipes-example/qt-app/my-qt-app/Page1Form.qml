import QtQuick 2.12
import QtQuick.Controls 2.5
import com.company.localdevice 1.0

Page {
    id: page
    width: 800
    height: 480
    property alias slider: slider
    property alias repeater: smallrects
    property alias slider1: slider1
    property alias repeater1: smallrects1

    Image {
        id: image
        width: 800
        height: 480
        fillMode: Image.Stretch
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        source: "OGA3ET0.jpg"
    }

    RoundButton {
        id: buttonShutdown
        x: 709
        y: 100
        width: 70
        height: 71
        text: "+"
        display: AbstractButton.IconOnly
        Image {
            id: shutdown
            source: "powerbutton.png"
            height: 71
            width: 70
        }
        onClicked: {
            LocalDevice.powerOff()
        }
    }

    RoundButton {
        id: buttonTerminal
        x: 709
        y: 200
        width: 70
        height: 71
        text: "+"
        display: AbstractButton.IconOnly
        Image {
            id: terminal
            source: "terminal.png"
            height: 71
            width: 70
        }
        onClicked: {
            LocalDevice.terminal()
        }
    }

    RoundButton {
        id: buttonReboot
        x: 709
        y: 300
        width: 70
        height: 71
        text: "+"
        display: AbstractButton.IconOnly
        Image {
            id: reboot
            source: "restart.png"
            height: 71
            width: 70
        }
        onClicked: {
            LocalDevice.reboot()
        }
    }

    Dial {
        id: dial
        x: 314
        y: 110
        width: 133
        height: 117
        anchors.right: parent.right
        anchors.rightMargin: 353
        font.bold: true
        inputMode: Dial.Circular
        stepSize: 0.1
        to: 1.9
        from: 0.1
        palette.dark: "red"
    }

    Text {
        id: element3
        x: 341
        y: 229
        color: "#c53157"
        text: qsTr("Mix rate")
        font.bold: true
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 229
        font.pixelSize: 20
    }

    Dial {
        id: dial1
        anchors.left: parent.left
        stepSize: 1
        anchors.rightMargin: 353
        inputMode: Dial.Circular
        font.bold: true
        to: 20
        from: 0.1
        palette.dark: "#18de3a"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 307
        anchors.leftMargin: 314
        anchors.bottomMargin: 56
    }

    Rectangle {
        id: rectangle
        x: 98
        y: 265
        width: 59
        height: 400
        color: "#0d0b0b"
        radius: 20
        border.width: 4
        z: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 10
        border.color: "#16e52e"
        Grid {
            x: 5
            y: 10
            rows: 19
            columns: 1
            spacing: 5

            Repeater {
                id: smallrects
                model: 19
                Rectangle {
                    clip: true
                    width: 49
                    height: 16
                    color: "#16e52e"
                    radius: 3
                    visible: false
                }
            }
        }
    }

    Slider {
        id: slider
        y: 235
        width: 40
        height: 208
        snapMode: Slider.SnapAlways
        anchors.verticalCenter: rectangle.verticalCenter
        anchors.left: rectangle.right
        anchors.verticalCenterOffset: 0
        anchors.leftMargin: -116
        stepSize: 1
        to: 19
        from: 1
        orientation: Qt.Vertical
        value: 0
    }

    Rectangle {
        id: rectangle1
        x: 604
        y: 256
        width: 59
        height: 400
        color: "#0d0b0b"
        radius: 20
        anchors.verticalCenterOffset: 10
        Grid {
            x: 5
            y: 10
            Repeater {
                id: smallrects1
                Rectangle {
                    width: 49
                    height: 25
                    color: "#c53157"
                    radius: 3
                    clip: true
                    visible: false
                }
                model: 19
            }
            columns: 1
            spacing: 5
            rows: 19
        }
        z: 20
        anchors.verticalCenter: parent.verticalCenter
        border.width: 4
        border.color: "#c53157"
    }

    Slider {
        id: slider1
        x: 1013
        y: 246
        width: 40
        height: 208
        anchors.right: rectangle1.left
        anchors.rightMargin: 6
        value: 0
        stepSize: 1
        to: 19
        anchors.verticalCenter: rectangle1.verticalCenter
        snapMode: Slider.SnapAlways
        from: 1
        orientation: Qt.Vertical
    }

    Text {
        id: element
        x: 540
        color: "#b81cb6"
        text: qsTr("Industrial HMI Usage")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 26
        font.bold: true
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: -16
    }

    Text {
        id: element1
        y: 427
        color: "#18de3a"
        text: qsTr("Flow rate")
        anchors.left: parent.left
        anchors.leftMargin: 339
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        font.bold: true
        font.pixelSize: 20
    }
}
