import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2


//import QtGraphicalEffects 1.0

//import QtQuick.Controls.Material 2.3
Window {
    id: mainWindow
    visible: true
    width: 400
    height: 400
    title: qsTr("SequenceRenamer")
    //    background: Qt.transparent
    color: "transparent"

    flags: Qt.FramelessWindowHint | Qt.WindowSystemMenuHint
           | Qt.WindowMinimizeButtonHint | Qt.Window
    //           | Qt.WindowStaysOnTopHint

    //    Material.theme: Material.Dark
    //    Material.accent: Material.Orange
    //    menuBar: MainMenuBar {
    //    }
    property point startPoint: Qt.point(0, 0)
    property point offsetPoint: Qt.point(0, 0)
    property bool isMoving: false

    Rectangle {
        id: backgroundRect
        anchors.fill: parent
        color: "white"
        radius: 10
    }

    MainContent {
        anchors.centerIn: parent
    }
}
