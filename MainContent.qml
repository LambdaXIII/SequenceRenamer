import QtQuick 2.4
import SequenceRenamer.OwnApi 1.0

MainContentForm {

    function renameStarted() {
        progressBar.indeterminate = true
    }

    function renameFinished() {
        mainText.text = qsTr("同化完成")
        progressBar.value = 1.0
    }

    //    mouseArea.onClicked: changeText()
    DropArea {
        Component.onCompleted: {
            Brain.onRenameStarted.connect(renameStarted)
            Brain.onRenameFinished.connect(renameFinished)
        }

        anchors.fill: parent
        onEntered: {
            if (drag.hasUrls) {
                var xs = drag.urls
                mainText.text = qsTr("你拖动了%1个东东\n松开手手，立即开始").replace("%1",
                                                                     xs.length)
                progressBar.value = 0.2
            }
        }
        onExited: {
            mainText.text = qsTr("别走啊，光标回来~")
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
