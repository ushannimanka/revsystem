


//types
//#success
//#danger
//#warning
//#info

//closeInTime
//0 no close
//others in secs



        function showAlert(container,type,msg,closeTime,icon) {

            Metronic.alert({
                container: container, // alerts parent container(by default placed after the page breadcrumbs)
                place: "append", // append or prepent in container
                type: type,  // alert's type
                message: msg,  // alert's message
                close: true, // make alert closable
                reset: true, // close all previouse alerts first
                focus: false, // auto scroll to the alert after shown
                closeInSeconds: closeTime, // auto close after defined seconds
                icon: icon // put icon before the message
            });


        }

