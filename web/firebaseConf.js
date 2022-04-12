function doSomething(){
    // Your web app's Firebase configuration
    // For Firebase JS SDK v7.20.0 and later, measurementId is optional
    var firebaseConfig = {
        apiKey: "AIzaSyDhO17S7chpb6TgRQUegxpHqoBuAenjUZc",
          authDomain: "crud-project-495bc.firebaseapp.com",
          projectId: "crud-project-495bc",
          storageBucket: "crud-project-495bc.appspot.com",
          messagingSenderId: "132835406551",
          appId: "1:132835406551:web:555667ffa044978fb6b692",
          measurementId: "G-21WEHG1H5T"
      };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();
}
doSomething();