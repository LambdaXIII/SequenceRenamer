import QtQuick 2.4
import SequenceRenamer.OwnApi 1.0

MainContentForm {
    function changeText() {
        mainText.text = "FINISHED"
    }

    //    mouseArea.onClicked: changeText()
    DropArea {
        Component.onCompleted: {
            Brain.onRenameFinished.connect(changeText)
        }

        anchors.fill: parent
        onEntered: {
            if (drag.hasUrls) {
                var xs = drag.urls
                mainText.text = qsTr("你拖动了%1个文件\n松开手手，立即开始").replace("%1",
                                                                     xs.length)
            }
        }
        onExited: {
            mainText.text = qsTr("拖动文件到这里来改名")
        }
        onDropped: {
            console.log("dropped")
            if (drop.hasUrls) {
                var url_list = drop.urls
                if (Brain.isImportable(url_list)) {
                    console.log("accepted", url_list.length)

                    /*
                    for (var i = 0; i < url_list.length; i++) {
                        console.log(Brain.tryIt(url_list[i]))
                    }*/
                    Brain.doIt(url_list)

                    drop.accepted = true
                }
            }
        }
    }
}
