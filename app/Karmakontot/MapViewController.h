//
//  MapViewController.h
//  Karmakontot
//
//  Created by Farshid Besharati on 2014-11-23.
//  Copyright (c) 2014 AllaUtomNiclas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, FBLoginViewDelegate>;

@end
