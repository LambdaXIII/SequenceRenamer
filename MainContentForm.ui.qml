import QtQuick 2.4
import QtQuick.Controls 2.3

Item {
    id: item1
    width: 400
    height: 400
    property alias progressBar: progressBar
    property alias mainText: mainText
    property alias mouseArea: mouseArea

    ProgressBar {
        id: progressBar
        x: 0
        y: 350
        height: 10
        indeterminate: true
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        value: 0
    }

    Text {
        id: mainText
        x: 173
        y: 124
        text: qsTr("拖动文件夹到这里来改名")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: false
        anchors.fill: parent
    }
}
