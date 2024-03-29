
## Screenshots

<img src="img/google-login.jpg" alt="App screenshot - google login" width="270" /> <img src="img/facebook-login.jpg" alt="App screenshot - facebook login" width="270" /> <img src="img/main-view.jpg" alt="App screenshot - main view" width="270" />

<img src="img/chrome-custom-tabs.gif" alt="App screenshot - inapp purchase" width="270" /> <img src="img/IMG_0007.PNG" alt="App screenshot - ios google" width="270" /> <img src="img/safari-view-controller.gif" alt="App screenshot - view" width="270" />

## Google Login Certificate Thumbprint Settings

If the error code `10` appears when trying to Google Login, you need to check whether the certificate fingerprint is registered in the firebase console.

Register the SHA-1 certificate thumbprint of each app signing key certificate and upload key certificate in Google Play Console App Settings > App Integrity tab in Firebase Console > Project settings > General tab.

![firebase-cert-setting](https://user-images.githubusercontent.com/20632507/147073695-02faf079-66b3-4af8-98e4-5c907a68190f.png)

To enable Google login for both the version released on the Google Play Console and the version directly distributed by the developer with the same certificate, you must register both the upload key certificate and the app signing certificate fingerprint.
