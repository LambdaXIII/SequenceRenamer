import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

ToolBar {
    position: "Header"
    width: parent.width
    MouseArea {
        id: mouseMoveWindowArea
        anchors.fill: parent
        Layout.fillWidth: true

        onPressed: {
            cursorShape = Qt.DragMoveCursor
            startPoint = Qt.point(mouseX, mouseY)
            isMoving = true
        }

        onPositionChanged: {
            mainWindow.offsetPoint = Qt.point(mouseX - mainWindow.startPoint.x,
                                              mouseY - mainWindow.startPoint.y)
            if (mainWindow.isMoving) {
                mainWindow.x = mainWindow.x + mainWindow.offsetPoint.x
                mainWindow.y = mainWindow.y + mainWindow.offsetPoint.y
            }
        }

        onReleased: {
            cursorShape = Qt.ArrowCursor
            isMoving = false
        }
    }

    RowLayout {
        anchors.fill: parent
        spacing: 3

        Text {
            text: mainWindow.title
        }
        ToolButton {
            text: qsTr("帮助")
        }

        ToolButton {
            text: qsTr("X")
            onClicked: Qt.quit()
        }
    }
}
