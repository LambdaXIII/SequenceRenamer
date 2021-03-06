import QtQuick 2.9
import SequenceRenamer.OwnApi 1.0
import QtQuick.Dialogs 1.2

MainContentForm {
    logoMouseArea.onClicked: {
        Qt.openUrlExternally(
                    "https://github.com/LambdaXIII/SequenceRenamer/releases")
    }
    AboutDialog {
        id: aboutDialog
    }

    helpButton.onClicked: {
        aboutDialog.open()
    }
    quitButton.onClicked: Qt.quit()

    Component.onCompleted: {
        titleText.text = mainWindow.title
    }

    TitleBar {
        width: parent.width
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 370
    }

    function renameStarted() {
        //        progressBar.indeterminate = true
        mainText.text = qsTr("正在工作")
    }

    function renameFinished() {
        mainText.text = qsTr("同化完成")
        //        progressBar.value = 1.0
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
                //                progressBar.value = 0.2
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
