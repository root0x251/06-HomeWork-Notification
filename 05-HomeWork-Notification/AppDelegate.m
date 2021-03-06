//
//  AppDelegate.m
//  05-HomeWork-Notification
//
//  Created by Slava on 18.01.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"
#import "Doctor.h"
#import "Pensioner.h"
#import "Businessman.h"
@interface AppDelegate ()
@property (strong, nonatomic) Government *government;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(governmentNotification:)
                                                 name:GovernmentTaxLevelDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationEnterBackground:)    // при сворачивании
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationEnterForeground:)    // при разворачивании
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
    
    self.government = [Government new];
    
//    Doctor *doc1 = [Doctor new];
//    Doctor *doc2 = [Doctor new];
//    
////    doc1.salary = self.government.salary;
//    doc1.salary = doc2.salary = 2222;

    NSMutableDictionary *arrayDoctors = [NSMutableDictionary new];
    NSMutableDictionary *arrayPensioner = [NSMutableDictionary new];
    NSMutableDictionary *arrayBusinessman = [NSMutableDictionary new];
    
    for (int i = 0; i < 3; i++) {
        Doctor *doc = [Doctor new];
        doc.name = [NSString stringWithFormat:@"Alex%d", i];
        doc.salary = arc4random_uniform(100) + 1000;
        doc.averagePrice = arc4random_uniform(20);
        doc.sacrifice = 0;
        [arrayDoctors setObject:doc forKey:doc.name];
        
        Pensioner *pensioner = [Pensioner new];
        pensioner.name = [NSString stringWithFormat:@"Frosya%d", i];
        pensioner.pension = arc4random_uniform(200) + 500;
        pensioner.averagePrice = arc4random_uniform(30);
        [arrayPensioner setObject:pensioner forKey:pensioner.name];
        
        Businessman *businessman = [Businessman new];
        businessman.name = [NSString stringWithFormat:@"Roman%d", i];
        businessman.taxLevel = arc4random_uniform(100) + 500;
        businessman.salary = arc4random_uniform(5000) + 5000;
        [arrayBusinessman setObject:businessman forKey:businessman.name];
        
    }
    
    self.government.taxLevel = arc4random_uniform(30) + 100;
    self.government.salary = arc4random_uniform(1000) + 1000;
    self.government.pension = arc4random_uniform(300) + 1000;
    self.government.averagePrice = arc4random_uniform(15) + 10;
    self.government.sacrifice = arc4random_uniform(50); // жертвоприношение в телятах


//    Супермен
//    
//    Создайте свой класс аналог апп делегату, только он не делегат приложения, но слушатель тех же самых нотификаций, какие методы есть у делегата. Грубо говоря у вашего класса должны быть теже методы, что и у апп делегата, но вызываться они должны путем нотификаций
//    Добавьте НСЛоги в каждый метод апп делегата и своего класса
//    Сворачивая и разварачивая приложение добивайтесь вызовов определенный методов делегата и тех же нотификаций и посмотрите что вызывается раньше - метод делегата или нотификация :)
    
    
    
    
    
    
    
    return YES;
}
- (void) applicationEnterBackground: (NSNotification *) notification {
    NSLog(@"houdiHo");
}

- (void) applicationEnterForeground: (NSNotification *) notification {
    NSLog(@"hayuHai");
}

- (void) governmentNotification: (NSNotification *) notification {
//    NSLog(@"info %@", notification.userInfo);
}


- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
