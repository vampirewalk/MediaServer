//
//  MediaServer.m
//  MediaServer
//
//  Created by rdqa on 2015/2/11.
//  Copyright (c) 2015年 mocacube. All rights reserved.
//

#import "MediaServer.h"
#include <Platinum/Platinum.h>

NPT_SET_LOCAL_LOGGER("platinum.media.server.file")

PLT_UPnP upnp;
PLT_DeviceHostReference device;

@implementation MediaServer

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupServer];
    }
    return self;
}


- (int)setupServer
{
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    
    device = new PLT_FileMediaServer(
                                     [rootPath UTF8String],
                                     "Platinum UPnP Media Server",
                                     false,
                                     "SAMEDEVICEGUID", // NULL for random ID
                                     (NPT_UInt16)8088);
    
 
    
    NPT_List<NPT_IpAddress> list;
    NPT_CHECK_SEVERE(PLT_UPnPMessageHelper::GetIPAddresses(list));
    NPT_String ip = list.GetFirstItem()->ToString();
    
    device->m_ModelDescription = "Platinum File Media Server";
    device->m_ModelURL = "http://www.plutinosoft.com/";
    device->m_ModelNumber = "1.0";
    device->m_ModelName = "Platinum File Media Server";
    device->m_Manufacturer = "Plutinosoft";
    device->m_ManufacturerURL = "http://www.plutinosoft.com/";
    
    upnp.AddDevice(device);
    NPT_String uuid = device->GetUUID();
    
    NPT_CHECK_SEVERE(upnp.Start());
    
    return 0;
}

@end
