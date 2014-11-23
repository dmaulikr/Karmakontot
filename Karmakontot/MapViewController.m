//
//  MapViewController.m
//  Karmakontot
//
//  Created by Farshid Besharati on 2014-11-23.
//  Copyright (c) 2014 AllaUtomNiclas. All rights reserved.
//

#import "MapViewController.h"
#import "KarmaHeaderView.h"
#import "CoreData+MagicalRecord.h"

#import "User.h"
#import "Help.h"
#import "Done.h"

#import "LocalHelp.h"
#import "CalloutView.h"

@interface MapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *loginLogoutButton;
@property (nonatomic, strong) FBLoginView *loginView;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) KarmaHeaderView *karmaHeaderView;

@property (nonatomic, getter=isZoomed) BOOL zoomed;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestAlwaysAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.mapType = MKMapTypeHybrid;
    self.mapView.tintColor = [UIColor greenColor];
    
    self.karmaHeaderView = [[KarmaHeaderView alloc] initWithFrame:CGRectMake(0, 0, 133, 33)];
    
    self.navigationItem.titleView = self.karmaHeaderView;
    
    [self createABunchOfHelpObjects];
}

- (void)createABunchOfHelpObjects {
    LocalHelp *firstHelp = [[LocalHelp alloc] init];
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(59.853598, 17.635177);
    firstHelp.title = @"Need a charger for iPhone!";
    firstHelp.subtitle = @"Offering one lightning cable, which I hope to borrow from you (because I need it to charge my iPhone)";
    firstHelp.coordinate = coord;
    
    LocalHelp *secondHelp = [[LocalHelp alloc] init];
    coord = CLLocationCoordinate2DMake(59.859190, 17.634589);
    secondHelp.title = @"Accidentally fell in the river";
    secondHelp.subtitle = @"Bllhrlrghlgghlr";
    secondHelp.coordinate = coord;
    
    LocalHelp *thirdHelp = [[LocalHelp alloc] init];
    coord = CLLocationCoordinate2DMake(59.973142, 17.987766);
    thirdHelp.title = @"Stranded!";
    thirdHelp.subtitle = @"Naked. Need a ride. Please bring extra clothes.";
    thirdHelp.coordinate = coord;
    
//    
//    Help *firstHelp = [Help MR_createEntity];
//    firstHelp.longitude = @59.853598;
//    firstHelp.latitude = @17.635177;
//    firstHelp.helpTitle = @"Need a charger for iPhone!";
//    firstHelp.message = @"Offering one lightning cable, which I hope to borrow from you (because I need it to charge my iPhone)";
//    
//    Help *secondHelp = [Help MR_createEntity];
//    secondHelp.longitude = @59.859190;
//    secondHelp.latitude = @17.634589;
//    secondHelp.helpTitle = @"Accidentally fell in the river";
//    secondHelp.message = @"Bllhrlrghlgghlr";
//    
//    Help *thirdHelp = [Help MR_createEntity];
//    thirdHelp.longitude = @59.973142;
//    thirdHelp.latitude = @17.987766;
//    thirdHelp.helpTitle = @"Stranded!";
//    thirdHelp.message = @"Naked. Need a ride. Please bring extra clothes.";
    
    [self.mapView addAnnotations:@[firstHelp, secondHelp, thirdHelp]];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if (annotation == mapView.userLocation) return nil;
    
    
    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"AnnotationView"];
//    pin.canShowCallout = YES;
    pin.pinColor = MKPinAnnotationColorGreen;
    pin.animatesDrop = YES;
    
    return pin;
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if (![view.annotation isKindOfClass:[MKUserLocation class]]) {
        LocalHelp *help = (LocalHelp *)view.annotation;
        
        NSString *subtitle = [NSString stringWithFormat:@"%@\n\nDo you want to help this guy?", help.subtitle];
        
        
        UIAlertView *helpAlert = [[UIAlertView alloc] initWithTitle:help.title message:subtitle delegate:nil cancelButtonTitle:@"No" otherButtonTitles:@"Sure", nil];
        
        [helpAlert show];
    }
}
#pragma mark - Initializers

-(CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
    }
    
    return _locationManager;
}

-(FBLoginView *)loginView {
    if (!_loginView) {
        _loginView = [[FBLoginView alloc] initWithReadPermissions:@[@"public_profile", @"email", @"user_friends"]];
        _loginView.center = self.view.center;
        _loginView.delegate = self;
    }
    
    return _loginView;
}

- (IBAction)loginButtonPressed:(id)sender {
    UIBarButtonItem *button = (UIBarButtonItem *)sender;
    if ([button.title isEqualToString:@"Login"]) {
        [button setTitle:@"Logout"];
        [self.view addSubview:self.loginView];
    } else {
        [button setTitle:@"Login"];
        [self.view addSubview:self.loginView];
    }
}

#pragma mark - Facebook

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user {
    [self.loginView removeFromSuperview];
    [self.karmaHeaderView setProfilePicture:user.objectID];
    [self.karmaHeaderView setKarmaCount:@"999"];
    
    User *persistingUser = [User MR_createEntity];
    persistingUser.mail = [user objectForKey:@"email"];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    [self.loginView removeFromSuperview];
    [self.karmaHeaderView setProfilePicture:nil];
    [self.karmaHeaderView setKarmaCount:@""];
}


#pragma mark - LoginManager delegate

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    if (!self.isZoomed) {
        float distance = 500.0;
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, distance, distance);
        [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
        self.zoomed = !self.isZoomed;
    }
}

@end
