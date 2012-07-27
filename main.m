/*
 Ashwin Mulekar
 copyright 2010
 All rights reserved.
 No part of this software and or design may be implicitely or explicitely copied or
 distributed without the explicit written consent of Ashwin Mulekar.
 Waterloo, ON Canada.
 */
/*
This is an application which wil be the user interface or the client part of any 
 application that wants to have a [resence on the mobile platform.
 The server part will reside on a server on the web. This application will communicate
 with the server and output data on a device.
 */

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) 
{
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;
}
