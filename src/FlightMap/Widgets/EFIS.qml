import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import QGroundControl
import QGroundControl.Controls
import QGroundControl.FactSystem
import QGroundControl.FlightMap
import QGroundControl.FlightDisplay
import QGroundControl.Palette
import QGroundControl.ScreenTools

Item {
    id: control
    implicitWidth: 800
    implicitHeight: 600
    // width:      Math.min(_defaultWidth, _maxWidth)

    property real extraInset:           0
    property real extraValuesWidth:     _outerRadius

    property real   _defaultWidth:      mainWindow.width * 0.2
    property real   _maxWidth:          ScreenTools.defaultFontPixelHeight * 15
    property real   _innerRadius:       (width - (_topBottomMargin * 3)) / 4
    property real   _outerRadius:       _innerRadius + _topBottomMargin
    property real   _spacing:           ScreenTools.defaultFontPixelHeight * 0.33
    property real   _topBottomMargin:   (width * 0.05) / 2

    property var  vehicle:      globals.activeVehicle

    Item {
        id: container
        property double scaleRatio: 3.05 * Math.min(height / 1080, width / 1920)

        anchors {
            fill: parent
            margins: 16
        }

        Row {
            anchors.centerIn: parent
            spacing: 8
            scale: container.scaleRatio

            Rectangle {
                width: 310
                height: 310
                radius: 6
                color: "#000000"

                ElectronicAttitudeDirectionIndicator {
                    anchors.centerIn: parent
                    scaleRatio: container.scaleRatio

                    // adi.angleOfAttack: pfd.angleOfAttack
                    // adi.sideSlipAngle: pfd.angleOfSideSlip
                    adi.roll: vehicle ? vehicle.roll.rawValue: 0
                    adi.pitch: vehicle ? vehicle.pitch.rawValue: 0
                    // adi.slipSkid: pfd.slipSkid
                    // adi.turnRate: pfd.turnRate
                    // adi.dotH: pfd.ilsLOC
                    // adi.dotV: pfd.ilsGS
                    // adi.fdPitch: pfd.fdPitch
                    // adi.fdRoll: pfd.fdRoll
                    // adi.dotHVisible: pfd.ilsLOCVisible
                    // adi.dotVVisible: pfd.ilsGSVisible
                    // adi.fdVisible: pfd.fdVisible
                    // adi.stallVisible: pfd.stall

                    // asi.airspeed: pfd.airspeed
                    // asi.bugValue: pfd.airspeedBug

                    alt.altitude: vehicle ? vehicle.altitudeRelative.rawValue: 0
                    // alt.bugValue: pfd.altitudeBug

                    // hsi.heading: pfd.heading
                    // hsi.bugValue: pfd.headingBug

                    // vsi.climbRate: pfd.climbRate

                    // labels.airspeedBug: pfd.airspeedBug
                    // labels.machNumber: pfd.machNumber
                    // labels.altitudeBug: pfd.altitudeBug
                    // labels.pressure: pfd.pressure
                    // labels.pressureMode: pfd.pressureMode
                    // labels.flightMode: pfd.flightMode
                    // labels.speedMode: pfd.speedMode
                    // labels.lnav: pfd.lateralNavigationMode
                    // labels.vnav: pfd.verticalNavigationMode
                }
            }

            Rectangle {
                width: 310
                height: 310
                radius: 6
                color: "#000000"

                ElectronicHorizontalSituationIndicator {
                    anchors.centerIn: parent

                    // heading: pfd.heading
                    // course: pfd.course
                    // bearing: pfd.bearing
                    // deviation: pfd.vorDeviation
                    // headingBug: pfd.headingBug
                    // distance: pfd.dmeDistance
                    // cdiMode: pfd.courseDeviationIndicatorMode
                }
            }
        }
    }
}
