import QtQuick 2.0

// This rectangle acts as a dimming rect. It also captures key presses.
Rectangle {
    id: faderRect

//    signal clicked()
    property bool captureMouse: true

    // Used to define how fast the fade in / fade out will be done (in milliseconds).
    property int transitionDuration: 1200
    // Change this, if you want to have deeper/lighter fade.
    property double fadingOpacity: 0.8

    // Fader area should always be explicitely set from calling parent who knows
    // how big area has to be faded and where the touch events need to be captured.
    // By default, use the S³ portrait resolution.
//    width: 360
//    height: 640
//    anchors.fill: parent

    // Fading colour can be defined, if e.g. a "lighter" fade is required.
    color: "black"

    // Initially hidden. Not really meant to be modified directly.
    opacity: 0
    visible: false

    // This rectangle captures all of the key events so that underlying buttons
    // etc. can't be pressed.
    Rectangle {
	id: keyCapturer
	opacity:  captureMouse? 1:0
    visible: captureMouse? true:false
	MouseArea {
	    id: mouseArea
	    width: faderRect.width
	    height: faderRect.height
	    z: 100 // Make sure that this is on top.
	    onClicked: {
		console.log("Click captured by Fader!")
//                clicked()
	    }
	}
    }

    states: [
	State {
	    name: ""    // This could actually be implicit...
	    PropertyChanges {
		target: faderRect
		opacity: 0
        visible: false
	    }
	},
	State {
	    name: "faded"
	    PropertyChanges {
		target: faderRect
		opacity: fadingOpacity
        visible : true
	    }
	}
    ]

    transitions: [
	Transition {
	    from: ""
	    to: "faded"
	    SequentialAnimation {
		NumberAnimation { properties: "opacity"; easing.type: Easing.Linear; duration: transitionDuration }
	    }
	},
	Transition {
	    from: "faded"
	    to: ""
	    NumberAnimation { properties: "opacity"; easing.type: Easing.Linear; duration: transitionDuration }
	}
    ]
}
