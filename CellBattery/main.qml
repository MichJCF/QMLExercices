import QtQuick 2.15
import QtQuick.Controls 2.15
import Batt 1.0

ApplicationWindow {
    visible: true
    width: 400
    height: 650
    color: "transparent"//"white"//
    title: "Animación de Batería"

        property real batteryLevel: 0

    BatteryCharge {
        id: batteryInstance
        onBatteryLevelUp:  {
            batteryLevel = newBatteryLevelUp;
        }
        onBatteryLevelDown: {
            batteryLevel = newBatteryLevelDown;
        }
    }

    Battery {
        anchors.centerIn: parent
    }
}
