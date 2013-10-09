import QtQuick 2.0

Rectangle {
    id: splashMain

    // Emit a signal when timeout is reached
    signal splashTimeout()

    // Timeout that defines how long the Splash Screen should be shown at max.
    property int timeout: 2500  // 2,5s by default.

    // Default Splash image, user should set the correct one set when
    // instantiating the SplashScreen.
    property string image: "images/splash_screen.png"

    // Defines whether or not the Splash Screen is shown.
    property bool show: false

    // State is being deduced from the "show" property. State property
    // shouldn't be used directly
    state: show ? "showingSplashScreen" : ""
    Behavior on visible { NumberAnimation { duration:500; easing.type: Easing.InCurve} }
    Behavior on opacity { NumberAnimation {duration: 500; easing.type: Easing.InCurve} }
    //Using Fader to capture clicks!
    Fader {
        anchors.fill: parent
        visible: true
        transitionDuration: parent.timeout
    }

    // Start the splash timer when SplashScreen becomes visible.
    onStateChanged: {
        if (state == "showingSplashScreen" ){
            splashTimer.start();
        }
    }

    // Splash is hidden by default.
//    opacity: 0.0
    visible: false

    // Image shown.
    Image {
        source: image
        //	anchors.centerIn: parent
        anchors.fill: parent
    }

    // Timer that hides the Splash after the given timeout.
    Timer {
        id: splashTimer
        interval: timeout
        running: false
        repeat: false;
        onTriggered: { splashMain.splashTimeout(); splashMain.show = false }
    }

    // Default state is implicit.
    states: [
        State {
            name: "showingSplashScreen"
            PropertyChanges {
                target: splashMain
                // We use opacity so we can animate, instead of visible
                opacity: 1.0
                visible : true
            }
        }
    ]
}
