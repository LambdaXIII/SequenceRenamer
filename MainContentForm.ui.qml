import QtQuick 2.4
import QtQuick.Controls 2.3

Item {
    id: item1
    width: 400
    height: 400
    property alias logoMouseArea: logoMouseArea
    property alias helpButton: helpButton
    property alias quitButton: quitButton
    property alias titleText: titleText
    property alias mainText: mainText

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

    Text {
        id: titleText
        text: qsTr("窗口标题")
        font.italic: true
        verticalAlignment: Text.AlignVCenter
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 8
        font.pixelSize: 12
    }

    Button {
        id: quitButton
        x: 362
        y: 362
        width: 30
        height: 30
        text: qsTr("退")
        focusPolicy: Qt.NoFocus
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8
    }

    Button {
        id: helpButton
        x: 326
        y: 362
        width: 30
        height: 30
        text: qsTr("帮")
        focusPolicy: Qt.NoFocus
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 44
    }

    Image {
        id: paciLogo
        x: 8
        y: 365
        width: 70
        height: 27
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        fillMode: Image.PreserveAspectFit
        source: "PaciLogo.png"

        MouseArea {
            id: logoMouseArea
            anchors.fill: parent
        }
    }

    Image {
        id: image
        anchors.fill: parent
        source: "window_overlay.png"
    }
}
