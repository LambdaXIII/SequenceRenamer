import QtQuick 2.4
import QtQuick.Controls 2.3

Item {
    id: item1
    width: 350
    height: 450
    property alias suffix_after_suffix_switch: suffix_after_suffix_switch
    property alias prefix_before_dir_switch: prefix_before_dir_switch
    property alias setupDoneButton: setupDoneButton
    property alias suffix_switch: suffix_switch
    property alias suffix_field: suffix_field
    property alias prefix_switch: prefix_switch
    property alias prefix_field: prefix_field

    GroupBox {
        id: prefixGroup
        height: 180
        anchors.right: parent.right
        anchors.rightMargin: 22
        anchors.left: parent.left
        anchors.leftMargin: 22
        anchors.top: parent.top
        anchors.topMargin: 17
        spacing: 3
        title: qsTr("前缀设置")

        TextField {
            id: prefix_field
            height: 40
            text: qsTr("前缀")
            enabled: prefix_switch.checked
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: prefix_before_dir_switch.bottom
            anchors.topMargin: 6
            anchors.left: parent.left
            anchors.leftMargin: 39
        }

        CheckBox {
            id: prefix_before_dir_switch
            text: qsTr("在目录名之前添加")
            enabled: prefix_switch.checked
            checkable: true
            anchors.top: prefix_switch.bottom
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
        }

        CheckBox {
            id: prefix_switch
            text: qsTr("为文件添加前缀")
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
        }
    }

    GroupBox {
        id: groupBox
        height: 183
        anchors.top: prefixGroup.bottom
        anchors.topMargin: 24
        anchors.right: parent.right
        anchors.rightMargin: 22
        anchors.left: parent.left
        anchors.leftMargin: 22
        spacing: 3
        title: qsTr("后缀设置")

        TextField {
            id: suffix_field
            height: 40
            text: qsTr("后缀")
            enabled: suffix_switch.checked
            anchors.left: parent.left
            anchors.leftMargin: 38
            anchors.top: suffix_after_suffix_switch.bottom
            anchors.topMargin: 7
            anchors.right: parent.right
            anchors.rightMargin: 0
            placeholderText: ""
        }

        CheckBox {
            id: suffix_after_suffix_switch
            text: qsTr("在扩展名之后添加")
            enabled: suffix_switch.checked
            anchors.top: suffix_switch.bottom
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
        }

        CheckBox {
            id: suffix_switch
            text: qsTr("为文件添加后缀")
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
        }
    }

    Button {
        id: setupDoneButton
        x: 228
        y: 412
        height: 30
        text: qsTr("就这样吧")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 22
    }
}
