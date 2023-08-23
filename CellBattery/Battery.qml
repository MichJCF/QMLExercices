import QtQuick 2.15
import Batt 1.0

Rectangle {
    width: 300
    height: 600
    anchors.centerIn: parent
    border.color: "black"
    border.width: 5
    radius: 20
    opacity: 0.8

    Rectangle {
        width: 80
        height: 20
        //anchors.centerIn: parent
        x: 114
        y: -15
        color: "black"
    }

    Rectangle {
        //id: batteryFill
        radius: 14
        width: parent.width -10
        x: 5
        height: (batteryLevel * (parent.height-10))
        ////color: batteryLevel <= 0.05 ? "red" : (batteryLevel <= 0.2 ? "orange" : (batteryLevel <= 0.45 ? "yellow" : "green"))
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        smooth: true
        focus : true

        color: {
            if (batteryLevel <= 0.05) {
                return "red"
            } else if (batteryLevel <= 0.2) {
                return "orange"
            } else if (batteryLevel <= 0.45) {
                return "yellow"
            } else {
                return "green"
            }
        }

        Behavior on color {
            ColorAnimation {
                duration: 500 // Duración de la transición en milisegundos
            }
        }

    }

    Canvas {

        anchors.fill: parent
        //anchors.centerIn: parent
        onPaint: {
            var ctx = getContext("2d");

            ctx.strokeStyle = "black";
            ctx.lineWidth = 6;

            ctx.beginPath();
            ctx.moveTo(145, 280);//ctx.moveTo(100, 200);
            ctx.lineTo(160, 300);
            ctx.lineTo(145, 300);
            ctx.lineTo(160, 320);
            ctx.closePath();

            ctx.stroke();
        }
    }

    Text {
        text: Math.floor(batteryLevel*100.0) + "%"
        x: 135
        y: 350
        //anchors.centerIn: parent
        font.pixelSize: 25
        color: "black"
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Up) {
           batteryInstance.incrementValue();
        }
        if (event.key === Qt.Key_Down) {
           batteryInstance.decrementValue();
        }
    }
}
