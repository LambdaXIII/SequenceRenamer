import QtQuick 2.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3

ApplicationWindow {
    visible: true
    width: 300
    height: 300
    title: qsTr("SequenceRenamer")

    Material.theme: Material.Dark
    Material.accent: Material.Orange

    menuBar: MainMenuBar {
    }

    MainContent {
        anchors.centerIn: parent
    }
}
