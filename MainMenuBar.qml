import QtQuick 2.10
import QtQuick.Controls 2.3

MenuBar {
    Menu {
        title: qsTr("文件")
        Action {
            text: qsTr("退出")
            onTriggered: Qt.quit()
        }
    }

    Menu {
        title: qsTr("帮助")
        Action {
            text: qsTr("关于…")
        }
    }
}
