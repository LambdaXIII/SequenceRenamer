import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.3

MessageDialog {
    title: qsTr("关于 SequenceRenamer")
    text: qsTr("SequenceRenamer 是一个用于批量更改序列帧文件名的小工具。\n它是 Paci 项目的一部分。")
    detailedText: qsTr("拖动多个文件夹到窗口里面，即可将在目录中以及所有子目录中的文件添加自己上级目录的名字作为前缀。对于忘记设定序列帧片段名称的情况非常有用。")
    width: 500
    icon: StandardIcon.Information
    onAccepted: aboutDialog.close()
    modality: Qt.ApplicationModal
    standardButtons: StandardButton.Ok
    //    Component.onCompleted: visible = true
}
