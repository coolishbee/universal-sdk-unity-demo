//
//  UniversalSDKNativeInterface.m
//  UniversalSDKUnityBridge
//
//  Created by james on 2021/03/07.
//

#import <Foundation/Foundation.h>
#import "UniversalSDKWrapper.h"

#define UNIVERSAL_SDK_EXTERNC extern "C"

// MARK: - Helpers
NSString* UniversalSDKMakeNSString(const char* string)
{
    if(string) {
        return [NSString stringWithUTF8String:string];
    }else{
        return [NSString stringWithUTF8String:""];
    }
}

char* UniversalSDKMakeCString(NSString *str)
{
    const char* string = [str UTF8String];
    if(string == NULL) {
        return NULL;
    }
    
    char *buffer = (char*)malloc(strlen(string)+1);
    strcpy(buffer, string);
    return buffer;
}

UNIVERSAL_SDK_EXTERNC void universal_sdk_UnitySendMessage(const char *name,
                                                          const char *method,
                                                          NSString *params)
{
    UnitySendMessage(name, method, UniversalSDKMakeCString(params));
}

// MARK: - Extern APIs
UNIVERSAL_SDK_EXTERNC void universal_sdk_setup();
void universal_sdk_setup()
{
    [[UniversalSDKWrapper sharedInstance] setupSDK];
}

UNIVERSAL_SDK_EXTERNC void universal_sdk_login(const char* identifier,
                                               int loginType);
void universal_sdk_login(const char* identifier,
                         int loginType)
{
    NSString *nsIdentifier = UniversalSDKMakeNSString(identifier);
    [[UniversalSDKWrapper sharedInstance] login:nsIdentifier
                                           type:loginType];
}

UNIVERSAL_SDK_EXTERNC void universal_sdk_logout(const char* identifier);
void universal_sdk_logout(const char* identifier)
{
    NSString *nsIdentifier = UniversalSDKMakeNSString(identifier);
    [[UniversalSDKWrapper sharedInstance] logout:nsIdentifier];
}

UNIVERSAL_SDK_EXTERNC void universal_sdk_initBilling(const char* identifier,
                                                     const char* list);
void universal_sdk_initBilling(const char* identifier,
                               const char* list)
{
    NSString *nsIdentifier = UniversalSDKMakeNSString(identifier);
    NSString *nsProductList = UniversalSDKMakeNSString(list);
    [[UniversalSDKWrapper sharedInstance] initBilling:nsIdentifier
                                                 list:nsProductList];
}

UNIVERSAL_SDK_EXTERNC void universal_sdk_inAppPurchase(const char* identifier,
                                                       const char* pid);
void universal_sdk_inAppPurchase(const char* identifier,
                                 const char* pid)
{
    NSString *nsIdentifier = UniversalSDKMakeNSString(identifier);
    NSString *nsPid = UniversalSDKMakeNSString(pid);
    [[UniversalSDKWrapper sharedInstance] purchaseLaunch:nsIdentifier
                                                     pid:nsPid];
}

UNIVERSAL_SDK_EXTERNC void universal_sdk_openSafariView(const char* identifier,
                                                        const char* url);
void universal_sdk_openSafariView(const char* identifier, const char* url)
{
    NSString *nsIdentifier = UniversalSDKMakeNSString(identifier);
    NSString *nsUrl = UniversalSDKMakeNSString(url);
    [[UniversalSDKWrapper sharedInstance] openSafariView:nsIdentifier
                                                     url:nsUrl];
}
