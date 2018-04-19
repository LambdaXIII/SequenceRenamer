import QtQuick 2.0

MouseArea {
    id: titleBarArea
    anchors.fill: parent

    //    Layout.fillWidth: true
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
