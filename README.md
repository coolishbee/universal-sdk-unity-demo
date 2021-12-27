## Build Setting

> ###### Move the Plugins Folder from `Assets/UniversalSDK/Plugins` to `Assets/Plugins`.

![](https://github.com/jameschun7/universal-sdk-unity-demo/blob/main/img/plugins-move.png?raw=true)

> ###### baseProjectTemplate.gradle :

```groovy
allprojects {
    buildscript {
        ...
        }

        dependencies {            
            classpath 'com.android.tools.build:gradle:4.0.1'
            classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:1.3.11"
            classpath 'com.google.gms:google-services:4.3.0'
            **BUILD_SCRIPT_DEPS**
        }
    }
}
```

## Screenshots

<img src="img/login-view.jpg" alt="App screenshot - login view" width="270" /> <img src="img/google-login.jpg" alt="App screenshot - google login" width="270" /> <img src="img/facebook-login.jpg" alt="App screenshot - facebook login" width="270" />
<img src="img/main-view.jpg" alt="App screenshot - main view" width="270" /> <img src="img/inapp-purchase.jpg" alt="App screenshot - inapp purchase" width="270" />

## Google InApp Billing TEST

If the message `This item cannot be requested` appears during the in-app purchase test, you must install the tester version released as a test track through the test participation method.

Because the apk built and distributed directly by the developer is not signed through the Google Play Console, test payment may not be smooth.

## Google Login Certificate Thumbprint Settings

If the error code `10` appears when trying to Google Login, you need to check whether the certificate fingerprint is registered in the firebase console.

Register the SHA-1 certificate thumbprint of each app signing key certificate and upload key certificate in Google Play Console App Settings > App Integrity tab in Firebase Console > Project settings > General tab.

![firebase-cert-setting](https://user-images.githubusercontent.com/20632507/147073695-02faf079-66b3-4af8-98e4-5c907a68190f.png)

To enable Google login for both the version released on the Google Play Console and the version directly distributed by the developer with the same certificate, you must register both the upload key certificate and the app signing certificate fingerprint.
