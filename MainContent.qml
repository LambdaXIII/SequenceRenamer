import QtQuick 2.4
import SequenceRenamer.OwnApi 1.0

MainContentForm {
    function changeText() {
        mainText.text = "2"
    }

    //    mouseArea.onClicked: changeText()
    DropArea {
        anchors.fill: parent
        onEntered: {
            if (drag.hasUrls) {
                var xs = drag.urls
                mainText.text = qsTr("你拖动了%1个文件\n松开手手，立即开始").replace("%1",
                                                                     xs.length)
                drag.accepted = Brain.isImportable(drag.urls)
            }
        }
        onExited: {
            mainText.text = qsTr("拖动文件到这里来改名")
        }
    }
}
