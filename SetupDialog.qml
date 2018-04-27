import QtQuick 2.4
import QtQuick.Window 2.3

Window {

    SetupDialogForm {
        id: mainForm

        setupDoneButton.onClicked: {
            close()
        }

        Component.onCompleted: {

            //            prefix_before_dir_switch.enabled = false
            //            prefix_field.enabled = false
            //            suffix_after_suffix_switch.enabled = false
            //            suffix_field.enabled = false
        }
    }

    property bool use_prefix: mainForm.prefix_switch.checked
    property bool prefix_at_head: mainForm.prefix_before_dir_switch.checked
    property bool use_suffix: mainForm.suffix_switch.checked
    property bool suffix_at_last: mainForm.suffix_after_suffix_switch.checked
    property string prefix_txt: mainForm.prefix_field.text
    property string suffix_txt: mainForm.suffix_field.text

    width: mainForm.width
    height: mainForm.height
    title: qsTr("前后缀设置")
    visible: false
    modality: Qt.ApplicationModal
}
