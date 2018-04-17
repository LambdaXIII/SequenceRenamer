import QtQuick 2.4

Item {
    id: item1
    width: 400
    height: 400
    property alias mainText: mainText
    property alias mouseArea: mouseArea

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
